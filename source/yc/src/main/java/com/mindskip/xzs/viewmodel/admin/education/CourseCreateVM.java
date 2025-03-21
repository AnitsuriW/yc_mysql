package com.mindskip.xzs.viewmodel.admin.education;

import org.springframework.web.multipart.MultipartFile;
import javax.validation.constraints.*;
import java.util.List;

public class CourseCreateVM {
    @NotBlank(message = "课程标题不能为空")
    @Size(max = 100, message = "标题长度不能超过100字符")
    private String title;

    @NotNull(message = "封面文件不能为空")
    private MultipartFile cover;

    @NotEmpty(message = "至少需要添加一个单元")
    private List<UnitCreateVM> units;

    public @NotBlank(message = "课程标题不能为空") @Size(max = 100, message = "标题长度不能超过100字符") String getTitle() {
        return title;
    }

    public void setTitle(@NotBlank(message = "课程标题不能为空") @Size(max = 100, message = "标题长度不能超过100字符") String title) {
        this.title = title;
    }

    public @NotNull(message = "封面文件不能为空") MultipartFile getCover() {
        return cover;
    }

    public void setCover(@NotNull(message = "封面文件不能为空") MultipartFile cover) {
        this.cover = cover;
    }

    public @NotEmpty(message = "至少需要添加一个单元") List<UnitCreateVM> getUnits() {
        return units;
    }

    public void setUnits(@NotEmpty(message = "至少需要添加一个单元") List<UnitCreateVM> units) {
        this.units = units;
    }
}