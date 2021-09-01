package validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.MemberCommand;

public class MemberCommandValidator implements Validator {
	/**
	 * 같은 종류끼리는 extends로 상속 interface만 다중 상속이 가능함
	 */
	private static final String emailRegExp = "^[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@(?:\\w+\\.)+\\w+$";	// 이메일 패턴을 정규표현식으로 사용
	/**
	 * ^ : 앞에 있는 문자들
	 * a-z A-Z 0-9 가 올 수 있음
	 * +, * : 반복
	 * 
	 * @ 다음에 ~~ 문자 반복
	 * word(w)
	 * $:맨 뒤
	 * 맨 뒤는 word(w)로 끝나야 한다.
	 */
	private Pattern pattern;
	public MemberCommandValidator() {
		// email 패턴을 바교하기 위해 pattern에 정규표현식을 저장
		pattern = Pattern.compile(emailRegExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		/**
		 * 유효성 검사
		 */
		MemberCommand regReq = (MemberCommand) target; // 형변환
		// 비밀번호와 비밀번호 확인 비교
		if (!regReq.getUserPw().isEmpty()) { // userPw가 비어있지 않다면(값이 있으면)
			if(!regReq.isUserPwEqualsUserPwCon()) {
				errors.rejectValue("userPwCon", "nomatch");
			}
		}
		
		if(!regReq.getUserEmail().trim().isEmpty()) {
			// 생성자에 의해 정규 표현식을 가지고 있는 pattern과 이메일 비교
			Matcher matcher = pattern.matcher(regReq.getUserEmail());	// 일치하면 true, 아니면 false
			if(!matcher.matches()) {
				errors.rejectValue("userEmail", "bad");
			}
		} else {
			errors.rejectValue("userEmail", "required");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userId", "required"); // 유효성 검사(공백문자가 있어서는 안됨)
		ValidationUtils.rejectIfEmpty(errors, "userPw", "required"); // 유효성 검사(공백문자 가능)
		ValidationUtils.rejectIfEmpty(errors, "userPwCon", "required");
		ValidationUtils.rejectIfEmpty(errors, "userName", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPh1", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPh2", "required");
		ValidationUtils.rejectIfEmpty(errors, "userAddr", "required");
		ValidationUtils.rejectIfEmpty(errors, "userEmail", "required");
		ValidationUtils.rejectIfEmpty(errors, "interest", "required");
		ValidationUtils.rejectIfEmpty(errors, "userBirth", "required");

	}
	/**
	 * command 객체 유효성 검사
	 */

}
