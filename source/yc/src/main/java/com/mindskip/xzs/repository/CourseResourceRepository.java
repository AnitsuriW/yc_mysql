package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.CourseResource;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

// CourseResourceRepository.java
public interface CourseResourceRepository extends JpaRepository<CourseResource, Long> {

    @Modifying
    @Query("DELETE FROM CourseResource cr WHERE cr.unit.id IN (SELECT cu.id FROM CourseUnit cu WHERE cu.course.id = ?1)")
    void deleteByCourse_Id(Long courseId);

    List<CourseResource> findByUnitId(Long unitId);
}
