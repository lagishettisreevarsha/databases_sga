package com.example.school;

import com.example.school.model.Course;
import com.example.school.model.Student;
import com.example.school.repository.CourseRepository;
import com.example.school.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Override
    public void run(String... args) throws Exception {
        if (studentRepository.count() == 0) {
            // Create 10 Students
            for (int i = 1; i <= 10; i++) {
                Student student = new Student("Student " + i, "student" + i + "@example.com");
                studentRepository.save(student);
            }
            
            // Create 10 Courses and assign to students
            long studentIdCounter = 1;
            for (int i = 1; i <= 10; i++) {
                Course course = new Course("Course " + i, "Description for Course " + i);
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
