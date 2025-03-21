package com.mindskip.xzs.domain.dto;

import com.mindskip.xzs.domain.CourseResource;
import org.springframework.web.multipart.MultipartFile;

public class ResourceDTO {
    private MultipartFile file;
    private String originalName;


    public static ResourceDTO from(CourseResource resource) {
        ResourceDTO dto = new ResourceDTO();
        dto.setOriginalName(resource.getOriginalName());
        return dto;
    }
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }
}
