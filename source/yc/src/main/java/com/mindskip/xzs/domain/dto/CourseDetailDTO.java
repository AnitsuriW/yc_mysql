package com.mindskip.xzs.domain.dto;

import com.mindskip.xzs.domain.Course;
import lombok.Data;

import java.util.List;
import java.util.stream.Collectors;

public class CourseDetailDTO {
    private Long id;
    private String title;
    private String coverPath;
    private List<UnitDTO> units;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

    public List<UnitDTO> getUnits() {
        return units;
    }

    public void setUnits(List<UnitDTO> units) {
        this.units = units;
    }

    @Data
    public static class UnitDTO {
        private Long id;
        private String title;
        private List<ResourceDTO> resources;
    }

    @Data
    public static class ResourceDTO {
        private Long id;
        private String originalName;
        private String storagePath;
        private String fileType;
    }

    public static CourseDetailDTO from(Course course) {
        CourseDetailDTO dto = new CourseDetailDTO();
        dto.setId(course.getId());
        dto.setTitle(course.getTitle());
        dto.setCoverPath(course.getCoverPath());
        dto.setUnits(course.getUnits().stream().map(unit -> {
            UnitDTO unitDTO = new UnitDTO();
            unitDTO.setId(unit.getId());
            unitDTO.setTitle(unit.getTitle());
            unitDTO.setResources(unit.getResources().stream().map(resource -> {
                ResourceDTO resourceDTO = new ResourceDTO();
                resourceDTO.setId(resource.getId());
                resourceDTO.setOriginalName(resource.getOriginalName());
                resourceDTO.setStoragePath(resource.getStoragePath());
                resourceDTO.setFileType(resource.getFileType());
                return resourceDTO;
            }).collect(Collectors.toList()));
            return unitDTO;
        }).collect(Collectors.toList()));
        return dto;
    }
}