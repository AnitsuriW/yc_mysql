package com.mindskip.xzs.domain.dto;

import org.springframework.web.multipart.MultipartFile;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

public class CourseCreateDTO {
    @NotBlank(message = "课程标题不能为空")
    @Size(max = 100, message = "标题长度不能超过100字符")
    private String title;

    @NotNull(message = "封面文件不能为空")
    private MultipartFile cover;

    @Valid
    @NotEmpty(message = "至少需要添加一个单元")
    private List<UnitDTO> units;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public MultipartFile getCover() {
        return cover;
    }

    public void setCover(MultipartFile cover) {
        this.cover = cover;
    }

    public List<UnitDTO> getUnits() {
        return units;
    }

    public void setUnits(List<UnitDTO> units) {
        this.units = units;
    }
}

