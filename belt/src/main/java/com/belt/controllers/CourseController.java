package com.belt.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.belt.models.Course;
import com.belt.services.CourseService;


import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CourseController {

    @Autowired
    CourseService courseService;

    @GetMapping("/welcome")
    public String home(HttpSession session, Model model) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
     List<Course> courses =courseService.getAllCourses(); 
     System.out.println(courses); 
     model.addAttribute("courses", courses);
        return "dashboard.jsp";
    }

    // CREATE
    @GetMapping("/courses/add")
    public String createNewCourse(Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/welcome";
            
        } else {
            model.addAttribute("course", new Course());
            return "new.jsp";
        }
    }

        @PostMapping("/courses")
        public String createCourse(@Valid @ModelAttribute Course course, BindingResult result){
            if(result.hasErrors()){
                return "new.jsp";
            } else {
                courseService.addCourse(course);
                return "redirect:/welcome";
            }
    }

    // VIEW ONE
    @GetMapping("/courses/{id}")
    public String showCourse(@PathVariable Long id, HttpSession session, Model model){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        Course course = courseService.getOneCourseById(id);
        model.addAttribute("course", course);
        return "viewone.jsp";
    }
    
     // DELETE
     @DeleteMapping("/courses/{id}/delete")
     public String destroy(@PathVariable Long id){
         courseService.destroyCourse(id);
         return "redirect:/welcome";
     }
     
       //  EDIT
    @GetMapping("/courses/{id}/edit")
    public String edit(@PathVariable Long id, Model model){
        Course course = courseService.getOneCourseById(id);
        model.addAttribute("course", course);
        return "edit.jsp";
    }

    @PutMapping("/courses/{id}")
    public String update(@Valid @ModelAttribute Course course, BindingResult result){
        if(result.hasErrors()){
            return "/edit.jsp";
        }
        System.out.println(course);
        courseService.updateCourse(course);
        return "redirect:/welcome";
    
    }
}




