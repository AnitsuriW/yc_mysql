package com.mindskip.xzs.controller.student;

import ch.qos.logback.classic.Logger;
import com.mindskip.xzs.base.RestResponse;
import com.mindskip.xzs.domain.Course;
import com.mindskip.xzs.domain.dto.CourseDTO;
import com.mindskip.xzs.domain.dto.CourseDetailDTO;
import com.mindskip.xzs.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@RestController
@RequestMapping("/api/student")
public class StudentCourseController {
    private final CourseService courseService;

    @Autowired
    public StudentCourseController(CourseService courseService) {
        this.courseService = courseService;
    }
    @GetMapping("/courses")
    public RestResponse<List<CourseDTO>> getAvailableCourses() {
            List<Course> courses = courseService.getActiveCourses();
            List<CourseDTO> dtos = courses.stream()
                    .map(CourseDTO::from)
                    .collect(Collectors.toList());
            return RestResponse.ok(dtos);
    }
    @GetMapping("/course/{courseId}")
    public RestResponse<CourseDetailDTO> getCourseDetail(@PathVariable Long courseId) {
        Course course = courseService.getCourseWithUnits(courseId);
        return RestResponse.ok(CourseDetailDTO.from(course));
    }

}