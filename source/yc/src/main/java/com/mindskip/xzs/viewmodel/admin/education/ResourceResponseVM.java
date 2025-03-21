package com.mindskip.xzs.viewmodel.admin.education;

import com.mindskip.xzs.domain.CourseResource;
import lombok.Data;

@Data
public class ResourceResponseVM {
    private String id;
    private String originalName;
    private String downloadUrl;
    private String fileType;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getDownloadUrl() {
        return downloadUrl;
    }

    public void setDownloadUrl(String downloadUrl) {
        this.downloadUrl = downloadUrl;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getStoragePath() {
        return storagePath;
    }

    public void setStoragePath(String storagePath) {
        this.storagePath = storagePath;
    }

    private String storagePath;

    public static ResourceResponseVM fromEntity(CourseResource resource) {
        ResourceResponseVM vm = new ResourceResponseVM();
        vm.setId(resource.getId().toString());
        vm.setOriginalName(resource.getOriginalName());
        vm.setDownloadUrl("api/file/" + resource.getStoragePath());
        vm.setFileType(getFileExtension(resource.getOriginalName()));
        return vm;
    }

    private static String getFileExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}