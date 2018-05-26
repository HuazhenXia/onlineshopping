package edu.mum.onlineshoping.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import edu.mum.onlineshoping.model.User;
import edu.mum.onlineshoping.service.UserService;


public class UsernameUniqueValidator implements ConstraintValidator<UsernameUnique, String> {
	@Autowired
	private UserService userService;

	@Override
	public void initialize(UsernameUnique arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(String arg0, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
		int user=0;
		try {
			user=userService.findUserWithName(arg0);
		} catch(Exception e) {}
		//user = userService.getProductById();
		return user==0?true:false;
	}

}
