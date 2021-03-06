package com.test.finalproject.controller.admin;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.error.exception.FormBindException;
import com.test.finalproject.form.ResultForm;
import com.test.finalproject.form.TheaterForm;
import com.test.finalproject.service.TheaterService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/admin/theater", produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class AdminTheaterAPIController {

	private final TheaterService service;
	
	@PostMapping
	@AdminLevel(1)
	public ResultForm insert(
				@Valid @RequestBody TheaterForm form,
				BindingResult bindingResult
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		service.insert(form);
		return new ResultForm("success", "등록 되었습니다.");
	}
	
	@PutMapping
	@AdminLevel(1)
	public ResultForm update(
				@Valid @RequestBody TheaterForm form,
				BindingResult bindingResult
			) {
		if(bindingResult.hasErrors()) {
			throw new FormBindException("잘 못된 입력");
		}
		service.update(form);
		return new ResultForm("success", "수정 되었습니다.");
	}
	
}
