package com.reservoircode.appforcomposewatch.resource;

import com.reservoircode.appforcomposewatch.model.Student;
import com.reservoircode.appforcomposewatch.service.StudentService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/students")
@Controller
public record StudentResource(StudentService studentService) {

    @GetMapping("/all")
    public ResponseEntity<List<Student>> findAll() {
        return ResponseEntity.ok(studentService.findAll());
    }

    @GetMapping("/adults")
    public String findAdults(Model model) {
        model.addAttribute("students", studentService.findAll().stream().filter(student -> student.getAge() > 18).toList());

        return "students";
    }
}
