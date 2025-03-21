package com.mindskip.xzs.domain.dto;
import com.mindskip.xzs.domain.CourseUnit;

import java.util.List;
import java.util.stream.Collectors;

public class UnitDTO {
    private String title;
    private List<ResourceDTO> resources;

    public static UnitDTO from(CourseUnit courseUnit) {
        UnitDTO dto = new UnitDTO();
        dto.setTitle(courseUnit.getTitle());
        dto.setResources(
                courseUnit.getResources().stream()
                        .map(ResourceDTO::from)
                        .collect(Collectors.toList())
        );
        return dto;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    public List<ResourceDTO> getResources() {
        return resources;
    }

    public void setResources(List<ResourceDTO> resources) {
        this.resources = resources;
    }

}
