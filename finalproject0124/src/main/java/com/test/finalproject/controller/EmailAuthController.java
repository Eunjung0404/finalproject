package com.test.finalproject.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
//import org.springframework.mail.MailSender;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.JavaMailSenderImpl;
//import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.finalproject.service.MemberService;
import com.test.finalproject.vo.MemberVo;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class EmailAuthController {
	@Autowired
	JavaMailSenderImpl mailSender;
	@Autowired
	MemberService service;

	@RequestMapping(value = "/emailAuth", method=RequestMethod.GET)
	public String findPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
			throws IOException {
		
		String email = (String) request.getParameter("memail");
		String id = (String) request.getParameter("mid");
		session.setAttribute("memail", email);
		
		System.out.println("id: " + id);
		System.out.println("email: " + email);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", id);
		map.put("memail", email);

		MemberVo vo = service.findPwd(map);
		
		
		
		System.out.println("aaaa: " + vo);
		if (vo != null) {
			Random r = new Random();
			int num = r.nextInt(999999); // 6?????? ???????????? ??????

			if (vo.getMid().equals(id)) {
				session.setAttribute("email", vo.getMemail());
				session.setAttribute("mpwd", vo.getMpwd());

				String setfrom = "kimjh-_-@naver.com"; // ????????? ?????? ?????????
				String tomail = email; // ?????? ?????? ?????????
				String title = "???????????? ?????? ?????? ????????? ?????????.";
				String content = System.getProperty("line.separator") + "???????????????. MOVIE ONE ?????????"
						+ System.getProperty("line.separator") + "???????????? ??????(??????) ??????????????? " + num + " ?????????."
						+ System.getProperty("line.separator");
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);

					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

//				ModelAndView mv = new ModelAndView();
//				mv.setViewName("/member/emailAuth");
//				mv.addObject("num", num);
				model.addAttribute("num", num);
				
				return "member/emailAuth.tiles";
			} else {
//				ModelAndView mv = new ModelAndView();
//				mv.setViewName("/member/findPwd");
				return "member/findPwd.tiles";
			}
		} else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("/member/findPwd");
			return "member/findPwd.tiles";
		}
	}
}
