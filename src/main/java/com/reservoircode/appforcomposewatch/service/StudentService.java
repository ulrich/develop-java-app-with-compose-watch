package com.reservoircode.appforcomposewatch.service;

import com.reservoircode.appforcomposewatch.model.Student;
import com.reservoircode.appforcomposewatch.repository.StudentRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public record StudentService(StudentRepository studentRepository) {

    public List<Student> findAll() {
        return studentRepository.findAll();
    }
}
