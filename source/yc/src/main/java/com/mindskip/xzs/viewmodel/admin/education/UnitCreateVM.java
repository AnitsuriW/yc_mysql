package com.mindskip.xzs.viewmodel.admin.education;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.List;

public class UnitCreateVM {
    @NotBlank(message = "单元标题不能为空")
    @Size(max = 50, message = "单元标题长度不能超过50字符")
    private String title;

    @NotEmpty(message = "单元必须包含资源文件")
    private List<ResourceCreateVM> resources;

    public @NotBlank(message = "单元标题不能为空") @Size(max = 50, message = "单元标题长度不能超过50字符") String getTitle() {
        return title;
    }

    public void setTitle(@NotBlank(message = "单元标题不能为空") @Size(max = 50, message = "单元标题长度不能超过50字符") String title) {
        this.title = title;
    }

    public List<ResourceCreateVM> getResources() {
        return resources;
    }

    public void setResources(List<ResourceCreateVM> resources) {
        this.resources = resources;
    }
}