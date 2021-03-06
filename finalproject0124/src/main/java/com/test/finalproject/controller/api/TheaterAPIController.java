package com.test.finalproject.controller.api;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.TheaterService;
import com.test.finalproject.vo.TheaterVo;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "/api/theater"
			, produces = {MediaType.APPLICATION_JSON_VALUE})
@RequiredArgsConstructor
public class TheaterAPIController {

	private final TheaterService service;
	
	@GetMapping
	public List<TheaterVo> getList() {
		return service.getList();
	}
	
	@GetMapping("/{theatername}")
	public TheaterVo getTheater(@PathVariable String theatername) {
		return service.getTheaterByName(theatername);
	}
	
}
