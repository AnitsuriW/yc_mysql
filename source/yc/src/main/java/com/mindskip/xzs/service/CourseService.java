package com.mindskip.xzs.service;

import com.github.pagehelper.PageInfo;
import com.mindskip.xzs.domain.Course;

import com.mindskip.xzs.domain.CourseUnit;
import com.mindskip.xzs.viewmodel.admin.education.CoursePageRequestVM;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

public interface CourseService extends BaseService<Course> {
    List<Course>allCourses();
    PageInfo<Course> page(CoursePageRequestVM requestVM);
    void createCourseWithResources(Course course);
    void deleteCourseWithResources(Long id);
    Course getCourseWithUnits(Long courseId);
    List<Course> getActiveCourses();
}
