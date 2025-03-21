package com.mindskip.xzs.domain.dto;

import com.mindskip.xzs.domain.CourseResource;

public class CourseResourceDTO {
    private Long id;
    private String originalName;
    private String fileType;

    public static CourseResourceDTO from(CourseResource resource) {
        CourseResourceDTO dto = new CourseResourceDTO();
        dto.setId(resource.getId());
        dto.setOriginalName(resource.getOriginalName());
        dto.setFileType(resource.getFileType());
        return dto;
    }
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
}