package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.domain.CourseResource;
import com.mindskip.xzs.domain.CourseUnit;
import com.mindskip.xzs.viewmodel.admin.education.CoursePageRequestVM;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CourseMapper extends BaseMapper<Course> {
    int insert(Course course);
    List<Course> getCourseByLevel(Integer level);
    List<Course> page(@Param("courseName") String courseName);
    List<Course> allCourses();
    List<Course> page(CoursePageRequestVM requestVM);
    void insertUnit(CourseUnit unit);
    void insertResource(CourseResource resource);
}