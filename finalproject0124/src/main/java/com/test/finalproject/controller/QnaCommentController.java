package com.test.finalproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.QnaCommentService;
import com.test.finalproject.vo.QnaCommentVo;

@RestController
public class QnaCommentController {
	@Autowired private QnaCommentService service;
	
	@GetMapping(value="/comment/insert", produces = {MediaType.APPLICATION_JSON_VALUE})
	public HashMap<String, Object> insert(QnaCommentVo vo){
		//System.out.println("aaa" + vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			int n = service.insert(vo);
			map.put("code", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("code", "fail");
		}
		return map;
	}
		
}
