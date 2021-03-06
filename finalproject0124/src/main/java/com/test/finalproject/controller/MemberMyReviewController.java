package com.test.finalproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MyReviewVo;
import com.test.finalproject.vo.ReviewVo;
import com.util.PageUtil;

@RestController
public class MemberMyReviewController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/member/myreview", method=RequestMethod.GET)
	public HashMap<String, Object> myReview(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, String field, String keyword, String mid) {
//		System.out.println("아이디:" + mid);
		HashMap<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("field", field);
		pmap.put("keyword", keyword);
		pmap.put("mid", mid);
		
		int totalRowCount = service.reviewCount(pmap);
		PageUtil pageutil = new PageUtil(pageNum, 5, 5, totalRowCount);
		pmap.put("startRow", pageutil.getStartRow());
		pmap.put("endRow", pageutil.getEndRow());
		
		List<MyReviewVo> reviewList = service.myReview(pmap);
//		System.out.println("리뷰리스트:" + reviewList);
//		System.out.println("전체 글의 수" + totalRowCount);
//		System.out.println("페이지 수: " + pageutil.getTotalPageCount());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewList", reviewList);
		map.put("startPageNum", pageutil.getStartPageNum());
		map.put("endPageNum", pageutil.getEndPageNum());
		map.put("pageCount", pageutil.getTotalPageCount());
		map.put("rowBlockCount", pageutil.getRowBlockCount());
		map.put("field", field);
		map.put("keyword", keyword);
		
		return map;
	}
}
