package com.mindskip.xzs.viewmodel.admin.education;

import com.mindskip.xzs.base.BasePage;

public class CoursePageRequestVM extends BasePage {
    private String title;
    private Integer pageIndex;
    private Integer pageSize;
    private String courseName;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public Integer getPageIndex() {
        return pageIndex;
    }

    @Override
    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    @Override
    public Integer getPageSize() {
        return pageSize;
    }

    @Override
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
}