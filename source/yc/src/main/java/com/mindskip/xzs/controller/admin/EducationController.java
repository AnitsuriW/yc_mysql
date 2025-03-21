package com.mindskip.xzs.controller.admin;


import com.mindskip.xzs.base.BaseApiController;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.base.SystemCode;
import com.mindskip.xzs.domain.CourseResource;
import com.mindskip.xzs.domain.CourseUnit;
import com.mindskip.xzs.domain.Subject;
import com.mindskip.xzs.domain.dto.CourseCreateDTO;
import com.mindskip.xzs.domain.dto.CourseDTO;
import com.mindskip.xzs.domain.dto.ResourceDTO;
import com.mindskip.xzs.domain.dto.UnitDTO;
import com.mindskip.xzs.exception.BusinessException;
import com.mindskip.xzs.service.FileStorageService;
import com.mindskip.xzs.service.SubjectService;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.service.CourseService;
import com.mindskip.xzs.utility.PageInfoHelper;
import com.mindskip.xzs.viewmodel.admin.education.*;
import com.github.pagehelper.PageInfo;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;
import java.util.stream.Collectors;

@RestController("AdminEducationController")
@RequestMapping(value = "/api/admin/education")
public class EducationController extends BaseApiController {
    private static final Logger logger = LoggerFactory.getLogger(EducationController.class);
    private final SubjectService subjectService;
    private final CourseService courseService;
    private final FileStorageService storageService;

    @Autowired
    public EducationController(SubjectService subjectService, CourseService courseService,  @Qualifier("fileStorageService")FileStorageService storageService) {
        this.subjectService = subjectService;
        this.courseService = courseService;
        this.storageService = storageService;
    }
    @Configuration
    @ConfigurationProperties(prefix = "file")
    public class StorageProperties {
        private String uploadDir;

        public String getUploadDir() {
            return uploadDir;
        }

        public void setUploadDir(String uploadDir) {
            this.uploadDir = uploadDir;
        }
    }

    @RequestMapping(value = "/subject/list", method = RequestMethod.POST)
    public RestResponse<List<Subject>> list() {
        List<Subject> subjects = subjectService.allSubject();
        return RestResponse.ok(subjects);
    }

    @RequestMapping(value = "/subject/page", method = RequestMethod.POST)
    public RestResponse<PageInfo<SubjectResponseVM>> pageList(@RequestBody SubjectPageRequestVM model) {
        PageInfo<Subject> pageInfo = subjectService.page(model);
        PageInfo<SubjectResponseVM> page = PageInfoHelper.copyMap(pageInfo, e -> modelMapper.map(e, SubjectResponseVM.class));
        return RestResponse.ok(page);
    }

    @RequestMapping(value = "/subject/edit", method = RequestMethod.POST)
    public RestResponse edit(@RequestBody @Valid SubjectEditRequestVM model) {
        Subject subject = modelMapper.map(model, Subject.class);
        if (model.getId() == null) {
            subject.setDeleted(false);
            subjectService.insertByFilter(subject);
        } else {
            subjectService.updateByIdFilter(subject);
        }
        return RestResponse.ok();
    }

    @RequestMapping(value = "/subject/select/{id}", method = RequestMethod.POST)
    public RestResponse<SubjectEditRequestVM> select(@PathVariable Integer id) {
        Subject subject = subjectService.selectById(id);
        SubjectEditRequestVM vm = modelMapper.map(subject, SubjectEditRequestVM.class);
        return RestResponse.ok(vm);
    }

    @RequestMapping(value = "/subject/delete/{id}", method = RequestMethod.POST)
    public RestResponse delete(@PathVariable Integer id) {
        Subject subject = subjectService.selectById(id);
        subject.setDeleted(true);
        subjectService.updateByIdFilter(subject);
        return RestResponse.ok();
    }

    @GetMapping("/courses")
    public RestResponse<PageInfo<CourseCreateVM>> getCourseList(
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "1") Integer pageIndex,
            @RequestParam(defaultValue = "10") Integer pageSize) {

        try {
            CoursePageRequestVM requestVM = new CoursePageRequestVM();
            requestVM.setPageIndex(pageIndex);
            requestVM.setPageSize(pageSize);
            PageInfo<Course> coursePage = courseService.page(requestVM);

            PageInfo<CourseCreateVM> vmPage = new PageInfo<>();
            vmPage.setList(coursePage.getList().stream()
                    .map(c -> modelMapper.map(c, CourseCreateVM.class))
                    .collect(Collectors.toList()));
            vmPage.setTotal(coursePage.getTotal());

            return RestResponse.ok(vmPage);
        }catch (BusinessException e) {
            return RestResponse.fail(e.getCode(), e.getMessage());
        }
    }
    @PostMapping("/course/page")
    public RestResponse<PageInfo<CourseResponseVM>> pageList(@RequestBody CoursePageRequestVM model) {
        PageInfo<Course> pageInfo = courseService.page(model);
        PageInfo<CourseResponseVM> page = PageInfoHelper.copyMap(pageInfo, e -> {
            CourseResponseVM vm = new CourseResponseVM();
            vm.setId(e.getId().toString());
            vm.setTitle(e.getTitle());
            vm.setCoverUrl(e.getCoverPath());
            List<UnitResponseVM> unitVMs = e.getUnits().stream().map(unit -> {
                UnitResponseVM unitVM = new UnitResponseVM();
                unitVM.setTitle(unit.getTitle());
                unitVM.setResources(unit.getResources().stream().map(res -> {
                    ResourceResponseVM resVM = new ResourceResponseVM();
                    resVM.setOriginalName(res.getOriginalName());
                    return resVM;
                }).collect(Collectors.toList()));
                return unitVM;
            }).collect(Collectors.toList());

            vm.setUnits(unitVMs);
            return vm;
        });
        return RestResponse.ok(page);
    }
    @PostMapping(value = "/create", consumes =MediaType.MULTIPART_FORM_DATA_VALUE)
    public RestResponse<?> createCourse(@Valid @ModelAttribute CourseCreateDTO dto, BindingResult result) {
        if (result.hasErrors()) {
            return RestResponse.fail(SystemCode.ParameterValidError.getCode(),
                    result.getFieldError().getDefaultMessage());
        }logger.debug(() ->"接收到的课程标题: "+ dto.getTitle());
        dto.getUnits().forEach(unit -> {
            logger.debug(() ->"单元标题: "+unit.getTitle());
            unit.getResources().forEach(res -> {
                logger.debug(() ->"资源文件名: "+res.getOriginalName());
            });
        });
        logger.debug(()-> "接收到的units数量:"+ dto.getUnits().size());
        if (result.hasErrors()) {
            String errorMsg = result.getFieldError().getDefaultMessage();
            return RestResponse.fail(501, errorMsg);
        }

        if (dto.getCover().isEmpty()) {
            return RestResponse.fail(501, "封面文件不能为空");
        }
        if (dto.getUnits().isEmpty()) {
            return RestResponse.fail(501, "units 不能为空");
        }
        try {
            String coverPath = processCover(dto.getCover());
            Course course = buildCourseEntity(dto, coverPath);
            courseService.createCourseWithResources(course);
            return RestResponse.ok();
        }  catch (IOException e) {
            logger.error(() -> "文件存储失败: " + e.getMessage(), e);

            return RestResponse.fail(SystemCode.InnerError.getCode(), "文件上传失败");
        } catch (Exception e) {
            logger.error(() -> "课程创建异常: " + e.getMessage(), e);
            return RestResponse.fail(SystemCode.InnerError.getCode(), "系统内部错误");
        }
    }


    @PostMapping("/course/delete/{id}")
    public RestResponse deleteCourse(@PathVariable Long id) {
        try {
            courseService.deleteCourseWithResources(id);
            return RestResponse.ok();
        } catch (Exception e) {
            logger.error(() -> "删除课程失败: " + e.getMessage());
            return RestResponse.fail(SystemCode.InnerError.getCode(), "删除失败");
        }
    }
    @Autowired
    private StorageProperties storageProperties;
    private String processCover(MultipartFile file) throws IOException {
        String uploadDir = storageProperties.getUploadDir();
        Path dirPath = Paths.get(uploadDir, "covers");
        if (!Files.exists(dirPath)) {
            Files.createDirectories(dirPath);
        }
        String filename = UUID.randomUUID() + "_" + file.getOriginalFilename();
        Path targetPath = dirPath.resolve(filename);
        Files.copy(file.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);

        return "/api/file/covers/" + filename;
    }

    private Course buildCourseEntity(CourseCreateDTO dto, String coverPath) {
        Course course = new Course();
        course.setTitle(dto.getTitle());
        course.setCoverPath(coverPath);

        List<CourseUnit> units = dto.getUnits().stream()
                .filter(unit ->
                        unit.getTitle() != null && !unit.getTitle().trim().isEmpty() &&
                                !unit.getResources().isEmpty()
                )
                .map(this::buildCourseUnit)
                .collect(Collectors.toList());

        course.setUnits(units);
        return course;
    }

    private CourseUnit buildCourseUnit(UnitDTO unitDto) {
        CourseUnit unit = new CourseUnit();
        unit.setTitle(unitDto.getTitle());

        List<CourseResource> resources = unitDto.getResources().stream()
                .map(this::buildCourseResource)
                .collect(Collectors.toList());
        unit.setResources(resources);

        return unit;
    }

    private CourseResource buildCourseResource(ResourceDTO resDto) {
        if (resDto.getFile() == null || resDto.getFile().isEmpty()) {
            throw new IllegalArgumentException("资源文件不能为空");
        }try {
            CourseResource resource = new CourseResource();
            resource.setOriginalName(resDto.getOriginalName());
            resource.setStoragePath(storageService.store(resDto.getFile(), "materials"));
            return resource;
        } catch (IOException e) {
            throw new RuntimeException("资源文件存储失败: " + e.getMessage());
        }
    }

}



