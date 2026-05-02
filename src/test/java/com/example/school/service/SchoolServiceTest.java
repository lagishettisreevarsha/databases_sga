package com.example.school.service;

import com.example.school.model.Course;
import com.example.school.model.Student;
import com.example.school.repository.CourseRepository;
import com.example.school.repository.StudentRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class SchoolServiceTest {

    @Mock
    private StudentRepository studentRepository;

    @Mock
    private CourseRepository courseRepository;

    @InjectMocks
    private SchoolService schoolService;

    private Student student;
    private Course course;

    @BeforeEach
    void setUp() {
        student = new Student("John Doe", "john@example.com");
        student.setId(1L);

        course = new Course("Java 101", "Intro to Java");
        course.setId(1L);
    }

    @Test
    void testSaveStudent() throws Exception {
        when(studentRepository.save(any(Student.class))).thenReturn(student);

        Student savedStudent = schoolService.saveStudent(student);

        assertNotNull(savedStudent);
        assertEquals("John Doe", savedStudent.getName());
        verify(studentRepository, times(1)).save(student);
    }

    @Test
    void testGetAllStudentsWithCourses() {
        when(studentRepository.findAllStudentsWithCourses()).thenReturn(Arrays.asList(student));

        List<Student> students = schoolService.getAllStudentsWithCourses();

        assertEquals(1, students.size());
        verify(studentRepository, times(1)).findAllStudentsWithCourses();
    }

    @Test
    void testUpdateStudent() throws Exception {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));
        when(studentRepository.save(any(Student.class))).thenReturn(student);

        Student updatedDetails = new Student("Jane Doe", "jane@example.com");
        Student updatedStudent = schoolService.updateStudent(1L, updatedDetails);

        assertEquals("Jane Doe", updatedStudent.getName());
        assertEquals("jane@example.com", updatedStudent.getEmail());
    }

    @Test
    void testSaveCourse() throws Exception {
        when(studentRepository.findById(1L)).thenReturn(Optional.of(student));
        when(courseRepository.save(any(Course.class))).thenReturn(course);

        Course savedCourse = schoolService.saveCourse(1L, course);

        assertNotNull(savedCourse);
        assertEquals("Java 101", savedCourse.getTitle());
        verify(courseRepository, times(1)).save(course);
    }
}
