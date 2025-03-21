package com.mindskip.xzs.viewmodel.admin.education;

import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class ResourceCreateVM {
    @NotNull(message = "资源文件不能为空")
    private MultipartFile file;

    @NotBlank(message = "资源名称不能为空")
    private String originalName;

    public @NotNull(message = "资源文件不能为空") MultipartFile getFile() {
        return file;
    }

    public void setFile(@NotNull(message = "资源文件不能为空") MultipartFile file) {
        this.file = file;
    }

    public @NotBlank(message = "资源名称不能为空") String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(@NotBlank(message = "资源名称不能为空") String originalName) {
        this.originalName = originalName;
    }
}