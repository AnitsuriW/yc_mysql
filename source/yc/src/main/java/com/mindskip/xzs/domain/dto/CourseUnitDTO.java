package com.mindskip.xzs.domain.dto;

import com.mindskip.xzs.domain.CourseUnit;

import java.util.List;
import java.util.stream.Collectors;

public class CourseUnitDTO {
    private Long id;
    private String title;
    private List<CourseResourceDTO> resources;

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

    public List<CourseResourceDTO> getResources() {
        return resources;
    }

    public void setResources(List<CourseResourceDTO> resources) {
        this.resources = resources;
    }

    public static CourseUnitDTO from(CourseUnit unit) {
        CourseUnitDTO dto = new CourseUnitDTO();
        dto.setId(unit.getId());
        dto.setTitle(unit.getTitle());
        dto.setResources(unit.getResources().stream()
                .map(CourseResourceDTO::from)
                .collect(Collectors.toList()));
        return dto;
    }
}