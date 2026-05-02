package com.example.school.service;

import com.example.school.model.Course;
import com.example.school.model.Student;
import com.example.school.repository.CourseRepository;
import com.example.school.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class SchoolService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private CourseRepository courseRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }
    
    public List<Student> getAllStudentsWithCourses() {
        return studentRepository.findAllStudentsWithCourses();
    }

    public Optional<Student> getStudentById(Long id) {
        return studentRepository.findById(id);
    }

    @Transactional
    public Student saveStudent(Student student) throws Exception {
        try {
            return studentRepository.save(student);
        } catch (DataIntegrityViolationException e) {
            throw new Exception("Data Integrity Violation: Email might already exist.", e);
        }
    }

    @Transactional
    public Student updateStudent(Long id, Student studentDetails) throws Exception {
        Optional<Student> studentOpt = studentRepository.findById(id);
        if (studentOpt.isPresent()) {
            Student existingStudent = studentOpt.get();
            existingStudent.setName(studentDetails.getName());
            existingStudent.setEmail(studentDetails.getEmail());
            try {
                return studentRepository.save(existingStudent);
            } catch (DataIntegrityViolationException e) {
                throw new Exception("Data Integrity Violation: Update failed.", e);
            }
        } else {
            throw new Exception("Student not found");
        }
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }
    
    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }
    
    @Transactional
    public Course saveCourse(Long studentId, Course course) throws Exception {
        Optional<Student> studentOpt = studentRepository.findById(studentId);
        if (studentOpt.isPresent()) {
            course.setStudent(studentOpt.get());
            try {
                return courseRepository.save(course);
            } catch (Exception e) {
                throw new Exception("Error saving course", e);
            }
        } else {
            throw new Exception("Student not found");
        }
    }
    
    @Transactional
    public Course updateCourse(Long id, Course courseDetails) throws Exception {
        Optional<Course> courseOpt = courseRepository.findById(id);
        if (courseOpt.isPresent()) {
            Course existingCourse = courseOpt.get();
            existingCourse.setTitle(courseDetails.getTitle());
            existingCourse.setDescription(courseDetails.getDescription());
            try {
                return courseRepository.save(existingCourse);
            } catch (Exception e) {
                throw new Exception("Error updating course", e);
            }
        } else {
            throw new Exception("Course not found");
        }
    }
}
