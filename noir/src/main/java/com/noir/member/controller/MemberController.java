package com.noir.member.controller;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.servlet.ModelAndView;

import com.noir.member.service.MemberService;
import com.noir.member.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	//멤버 로그인 화면 요청
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm(HttpServletRequest req,HttpServletResponse resp)throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String)req.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
		
	}
	
	//멤버 회원가입 화면 요청
	@RequestMapping(value="/registerForm.do")
	public ModelAndView registerForm(HttpServletRequest req,HttpServletResponse resp)throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		String viewName = (String)req.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
		
	}
	
	//멤버 회원가입 처리
	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest req, HttpServletResponse resp)throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		//회원가입 폼 값 받아오기
		String loginId = req.getParameter("loginId");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String agreePolicy = req.getParameter("agreePolicy");
		
		boolean hasError = false;
		
		//값 유효성 검사
	    if (loginId == null || loginId.trim().isEmpty()) {
	        req.setAttribute("loginIdError", "아이디를 입력해주세요.");
	        hasError = true;
	    }
	    if (password == null || password.trim().isEmpty()) {
	        req.setAttribute("passwordError", "비밀번호를 입력해주세요.");
	        hasError = true;
	    }
	    if (name == null || name.trim().isEmpty()) {
	        req.setAttribute("nameError", "이름을 입력해주세요.");
	        hasError = true;
	    }
	    if (phone == null || phone.trim().isEmpty()) {
	    	req.setAttribute("phoneError", "전화번호를 입력해주세요.");
	    	hasError = true;
	    }
	    
	    if (agreePolicy==null|| agreePolicy.isEmpty()) {
	    	req.setAttribute("agreePolicyError", "개인정보 처리방침 동의는 필수 선택입니다.");
	    	hasError =true;
	    }

	    if (hasError) {
	        mav.setViewName("/member/registerForm");
	        return mav;
	    }
	    
	    memberService.register(req);
	    
	    return new ModelAndView("forward:/WEB-INF/views/member/registerSuccess.jsp");
		
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp) {
		
		ModelAndView mav = new ModelAndView();
		
		//로그인 사용자 정보 받아오기
		MemberVO member = memberService.login(req);
		
		if(member==null) {
			mav.setViewName("/member/loginForm");
			return mav;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("member", member);
		
		mav.setViewName("redirect:/main.do");
		
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest req,HttpServletResponse resp) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = req.getSession();
		
		//세션 무효화
		session.invalidate();
		
		mav.setViewName("redirect:/main.do");
		
		return mav;
	}
}
