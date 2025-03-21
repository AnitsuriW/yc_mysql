package com.mindskip.xzs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.domain.CourseResource;
import com.mindskip.xzs.domain.CourseUnit;
import com.mindskip.xzs.repository.CourseMapper;
import com.mindskip.xzs.repository.CourseRepository;
import com.mindskip.xzs.repository.CourseResourceRepository;
import com.mindskip.xzs.repository.CourseUnitRepository;
import com.mindskip.xzs.service.CourseService;
import com.mindskip.xzs.viewmodel.admin.education.CoursePageRequestVM;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class CourseServiceImpl extends BaseServiceImpl<Course> implements CourseService {
    @Autowired
    private CourseResourceRepository resourceRepository;
    private final CourseMapper courseMapper;
    private static final Logger logger = LoggerFactory.getLogger(CourseServiceImpl.class);

    @Autowired
    public CourseServiceImpl(CourseMapper courseMapper) {
        super(courseMapper);
        this.courseMapper = courseMapper;
    }

    @Override
    public List<Course> allCourses() {
        return courseMapper.allCourses();
    }
    @Override
    public Course selectById(Integer id){
        return super.selectById(id);
    }

    @Override
    public int updateByIdFilter(Course record){
        return super.updateByIdFilter(record);
    }

    @Override
    public PageInfo<Course> page(CoursePageRequestVM requestVM) {
        return PageHelper.startPage(requestVM.getPageIndex(), requestVM.getPageSize(), "id desc").doSelectPageInfo(() ->
                courseMapper.page(requestVM)
        );
    }

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private CourseUnitRepository unitRepository;
    @Override
    @Transactional
    public void createCourseWithResources(Course course) {
        course.setDeleted(0);
        List<CourseUnit> validUnits = course.getUnits().stream()
                .filter(unit -> StringUtils.hasText(unit.getTitle()))
                .peek(unit -> {
                    List<CourseResource> validResources = unit.getResources().stream()
                            .filter(res -> StringUtils.hasText(res.getOriginalName()))
                            .peek(res -> res.setUnit(unit))
                            .collect(Collectors.toList());
                    unit.setResources(validResources);
                })
                .filter(unit -> !unit.getResources().isEmpty())
                .peek(unit -> unit.setCourse(course))
                .collect(Collectors.toList());

        course.setUnits(validUnits);
        courseRepository.save(course);
    }
    @Transactional
    public void deleteCourseWithResources(Long courseId) {
        resourceRepository.deleteByCourse_Id(courseId);
        unitRepository.deleteByCourse_Id(courseId);

        courseRepository.deleteById(courseId);
    }

    @Transactional(readOnly = true)
    @Override
    public Course getCourseWithUnits(Long courseId) {
        Course course = courseRepository.findById(courseId)
                .orElseThrow(() -> new RuntimeException("课程不存在"));
        List<CourseUnit> units = unitRepository.findByCourse_Id(courseId);
        course.setUnits(units);
        units.forEach(unit -> {
            List<CourseResource> resources = resourceRepository.findByUnitId(unit.getId());
            unit.setResources(resources);
        });

        return course;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Course> getActiveCourses() {
        List<Course> courses = courseRepository.findActiveCoursesWithUnits();
        courses.forEach(course ->
                course.getUnits().forEach(unit ->
                        unit.setResources(resourceRepository.findByUnitId(unit.getId()))
                )
        );
        return courses;
    }
}



