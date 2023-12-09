package com.belt.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;


import com.belt.models.User;


public interface UserRepository extends CrudRepository<User, Long> {
    
    Optional<User> findByEmail(String email);
    
    Optional<User> findByUserName(String userName);
}