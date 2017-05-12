package net.kh.utils;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import net.kh.member.MemberVO;

public class MemberEntryValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object command, Errors errors) {
		MemberVO member = (MemberVO) command;

		if (!(StringUtils.hasLength(member.getEmail())))
			errors.rejectValue("email", "error.required");

		if (!(StringUtils.hasLength(member.getPw())))
			errors.rejectValue("password", "error.required");

		if (!(StringUtils.hasLength(member.getName())))
			errors.rejectValue("name", "error.required");

		if (!(StringUtils.hasLength(member.getPhone())))
			errors.rejectValue("phone", "error.required");

		if (errors.hasErrors())
			errors.reject("error.input.member");
	}

}
