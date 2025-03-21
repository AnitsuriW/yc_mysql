package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;
import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course, Long> {
    @Query("SELECT DISTINCT c FROM Course c " +
            "LEFT JOIN FETCH c.units u ")
    List<Course> findActiveCoursesWithUnits();
    @EntityGraph(attributePaths = {"units", "units.resources"})
    Optional<Course> findById(Long id);
}