package com.example.school;

import com.example.school.model.Course;
import com.example.school.model.Student;
import com.example.school.repository.CourseRepository;
import com.example.school.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Override
    public void run(String... args) throws Exception {
        if (studentRepository.count() == 0) {
            
            List<String> studentNames = Arrays.asList(
                "Aiden Martinez", "Sophia Patel", "Liam O'Connor", "Olivia Chen",
                "Noah Kim", "Emma Williams", "Elias Garcia", "Ava Robinson",
                "Jackson Smith", "Mia Johnson"
            );
            
            List<String> courseTitles = Arrays.asList(
                "Introduction to Computer Science", "Data Structures", "Calculus I",
                "Physics Mechanics", "World History", "Creative Writing",
                "Organic Chemistry", "Microeconomics", "Psychology 101", "Linear Algebra"
            );

            // Create 10 Students
            for (int i = 0; i < 10; i++) {
                String name = studentNames.get(i);
                String email = name.toLowerCase().replace(" ", ".") + "@example.com";
                Student student = new Student(name, email);
                studentRepository.save(student);
            }
            
            // Create 10 Courses and assign to students
            long studentIdCounter = 1;
            for (int i = 0; i < 10; i++) {
                String title = courseTitles.get(i);
                Course course = new Course(title, "Comprehensive study of " + title);
                Student student = studentRepository.findById(studentIdCounter).orElse(null);
                if (student != null) {
                    course.setStudent(student);
                    courseRepository.save(course);
                }
                studentIdCounter = studentIdCounter < 10 ? studentIdCounter + 1 : 1;
            }
        }
    }
}
