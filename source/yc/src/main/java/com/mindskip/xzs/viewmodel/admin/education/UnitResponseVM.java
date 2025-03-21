package com.mindskip.xzs.viewmodel.admin.education;

import com.mindskip.xzs.domain.CourseUnit;

import java.util.List;
import java.util.stream.Collectors;

public class UnitResponseVM {
    private String id;
    private String title;
    private List<ResourceResponseVM> resources;

    public static UnitResponseVM fromEntity(CourseUnit unit) {
        UnitResponseVM vm = new UnitResponseVM();
        vm.setId(unit.getId() != null ? unit.getId().toString() : null);
        vm.setTitle(unit.getTitle());
        vm.setResources(unit.getResources().stream()
                .map(ResourceResponseVM::fromEntity)
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

    public List<ResourceResponseVM> getResources() {
        return resources;
    }

    public void setResources(List<ResourceResponseVM> resources) {
        this.resources = resources;
    }
}