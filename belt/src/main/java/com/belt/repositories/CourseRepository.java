package com.belt.repositories;



import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.belt.models.Course;

public interface CourseRepository extends CrudRepository<Course, Long> {
    List<Course> findAll();

    
}