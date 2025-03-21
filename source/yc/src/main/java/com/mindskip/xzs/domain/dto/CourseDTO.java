package com.mindskip.xzs.domain.dto;

import com.mindskip.xzs.domain.Course;
import org.hibernate.Hibernate;

import java.util.List;
import java.util.stream.Collectors;

public class CourseDTO {
    private Long id;
    private String title;
    private String coverPath;
    private List<CourseUnitDTO> units;
    private String description;

    public static CourseDTO from(Course course) {
        CourseDTO dto = new CourseDTO();
        dto.setId(course.getId());
        dto.setTitle(course.getTitle());
        dto.setCoverPath(course.getCoverPath());

        List<CourseUnitDTO> unitDTOs = course.getUnits().stream()
                .map(unit -> {
                    CourseUnitDTO unitDTO = new CourseUnitDTO();
                    unitDTO.setId(unit.getId());
                    unitDTO.setTitle(unit.getTitle());
                    Hibernate.initialize(unit.getResources());

                    List<CourseResourceDTO> resourceDTOs = unit.getResources().stream()
                            .map(CourseResourceDTO::from)
                            .collect(Collectors.toList());
                    unitDTO.setResources(resourceDTOs);
                    return unitDTO;
                })
                .collect(Collectors.toList());
        dto.setUnits(unitDTOs);
        return dto;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public void setCoverPath(String coverPath) {
        this.coverPath = coverPath;
    }

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

    public List<CourseUnitDTO> getUnits() {
        return units;
    }

    public void setUnits(List<CourseUnitDTO> units) {
        this.units = units;
    }


}