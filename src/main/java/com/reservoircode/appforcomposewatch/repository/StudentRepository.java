package com.reservoircode.appforcomposewatch.repository;

import com.reservoircode.appforcomposewatch.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
}
