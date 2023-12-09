package com.belt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.belt.models.Course;
import com.belt.repositories.CourseRepository;

import jakarta.validation.Valid;





@Service
public class CourseService {

    @Autowired
    CourseRepository courseRepository;
    public List<Course> allCourses() {
        return null;
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public void addCourse(@Valid Course course) {
        courseRepository.save(course);
    }

    public Course getOneCourseById(Long id) {
        Optional<Course> course =courseRepository.findById(id);
        return course.orElse(null);
    }

    public void updateCourse( Course course) {
        courseRepository.save(course);
    }

    public void destroyCourse(Long id) {
         courseRepository.deleteById(id);
    }
    
}
