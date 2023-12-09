package com.belt.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.belt.models.LoginUser;
import com.belt.models.User;
import com.belt.repositories.UserRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class UserService {
    
	//	//// FIELDS ////////////////////////////////////////////
	
    final UserRepository userRepository;

    UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    //	//// CREATE ////////////////////////////////////////////
    
    //	**** Register a New User *******************************
    public  User register(User newUser, BindingResult result) {
        if(userRepository.findByEmail(newUser.getEmail()).isPresent()) {		// Check if E-mail is already in database
            result.rejectValue("email", "Unique", "This email is already in use!");
        }
        if(userRepository.findByUserName(newUser.getUserName()).isPresent()) {
            result.rejectValue("userName", "Unique", "This Name is already in use!");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {		// Check to make sure password matches confirm password
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()) {										// Check if there are errors on the form
            return null;
        } else {														// BCrypt hash the password then create a new User
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }

    //	//// RETRIEVE //////////////////////////////////////////
    
    //	**** Log In the User ***********************************
    public User login(LoginUser newLogin, BindingResult result) {
        if(result.hasErrors()) {										// Check form for errors
            return null;
        }
        
        // Find the User in the database by their email
        Optional<User> potentialUser = userRepository.findByEmail(newLogin.getEmail());
        if(!potentialUser.isPresent()) {								// If User not found, do NOT log in User
            result.rejectValue("email", "Unique", "Unknown email!");
            return null;
        }
        User user = potentialUser.get();								
        // Check the password given in the form vs the password hash in the database
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Matches", "Invalid Password!");
        }
        if(result.hasErrors()) {
            return null;
        } else {
            return user;	
        }
    }
    
    //	**** Retrieve User By ID ********************************
    
	public User retrieveUser(Long id) {
		Optional<User> optUser = userRepository.findById(id);
		if ( optUser.isPresent() ) {
			return optUser.get();			
		} else {
			return null;
		}
	}

    public User findByID(Long id) {
        return null;
    }

    public Object getSessionUser(HttpSession session) {
        return null;
    }

    public static User findId(Long userId) {
        return null;
    }
    
}