package com.example.school.repository;

import com.example.school.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    
    // Custom query method with inner join
    @Query("SELECT DISTINCT s FROM Student s JOIN FETCH s.courses c")
    List<Student> findAllStudentsWithCourses();
}
