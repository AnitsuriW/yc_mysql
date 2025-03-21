package com.mindskip.xzs.repository;

import com.mindskip.xzs.domain.CourseUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

// CourseUnitRepository.java
public interface CourseUnitRepository extends JpaRepository<CourseUnit, Long> {
    @Transactional
    void deleteByCourse_Id(Long courseId);
    List<CourseUnit> findByCourse_Id(Long courseId);
}
