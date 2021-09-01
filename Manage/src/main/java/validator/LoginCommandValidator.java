package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.LoginCommand;

public class LoginCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
//		LoginCommand loginCommand = (LoginCommand) target;
		ValidationUtils.rejectIfEmpty(errors, "loginId", "required");
		ValidationUtils.rejectIfEmpty(errors, "loginPw", "required");
	}

}
