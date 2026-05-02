package com.example.school.controller;

import com.example.school.model.Course;
import com.example.school.model.Student;
import com.example.school.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class SchoolController {

    @Autowired
    private SchoolService schoolService;

    // --- Read Operations ---
    @GetMapping("/")
    public String viewHomePage(Model model) {
        // Here we use the custom query method that performs an inner join
        List<Student> studentsWithCourses = schoolService.getAllStudentsWithCourses();
        model.addAttribute("students", studentsWithCourses);
        return "list";
    }

    // --- Create Operations ---
    @GetMapping("/add-student")
    public String showNewStudentForm(Model model) {
        Student student = new Student();
        model.addAttribute("student", student);
        return "add-student";
    }

    @PostMapping("/save-student")
    public String saveStudent(@ModelAttribute("student") Student student, RedirectAttributes redirectAttributes) {
        try {
            schoolService.saveStudent(student);
            redirectAttributes.addFlashAttribute("successMessage", "Student saved successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/add-student";
        }
        return "redirect:/";
    }

    // --- Update Operations ---
    @GetMapping("/edit-student/{id}")
    public String showEditStudentForm(@PathVariable(value = "id") long id, Model model, RedirectAttributes redirectAttributes) {
        try {
            Student student = schoolService.getStudentById(id).orElseThrow(() -> new Exception("Student not found"));
            model.addAttribute("student", student);
            return "edit-student";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/";
        }
    }

    @PostMapping("/update-student/{id}")
    public String updateStudent(@PathVariable(value = "id") long id, @ModelAttribute("student") Student studentDetails, RedirectAttributes redirectAttributes) {
        try {
            schoolService.updateStudent(id, studentDetails);
            redirectAttributes.addFlashAttribute("successMessage", "Student updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/edit-student/" + id;
        }
        return "redirect:/";
    }

    // --- Course Operations (Bonus/Completeness) ---
    @GetMapping("/add-course/{studentId}")
    public String showNewCourseForm(@PathVariable(value = "studentId") long studentId, Model model) {
        Course course = new Course();
        model.addAttribute("course", course);
        model.addAttribute("studentId", studentId);
        return "add-course";
    }

    @PostMapping("/save-course/{studentId}")
    public String saveCourse(@PathVariable(value = "studentId") long studentId, @ModelAttribute("course") Course course, RedirectAttributes redirectAttributes) {
        try {
            schoolService.saveCourse(studentId, course);
            redirectAttributes.addFlashAttribute("successMessage", "Course saved successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/";
    }
}
