package com.mindskip.xzs.viewmodel.admin.education;

import com.mindskip.xzs.domain.Course;
import lombok.Data;
import java.util.List;
import java.util.stream.Collectors;

@Data
public class CourseResponseVM {
    private String id;
    private String title;
    private String coverUrl;
    private List<UnitResponseVM> units;

    public static CourseResponseVM fromEntity(Course course) {
        CourseResponseVM vm = new CourseResponseVM();
        vm.setId(course.getId().toString());
        vm.setTitle(course.getTitle());
        vm.setCoverUrl("api/file/" + course.getCoverPath());
        vm.setUnits(course.getUnits().stream()
                .map(UnitResponseVM::fromEntity)
                .collect(Collectors.toList()));
        return vm;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public List<UnitResponseVM> getUnits() {
        return units;
    }

    public void setUnits(List<UnitResponseVM> units) {
        this.units = units;
    }
}