package com.noir.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.noir.member.dao.MemberDAO;
import com.noir.member.vo.MemberRole;
import com.noir.member.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	MemberVO memberVO;
	
	@Autowired
	MemberDAO memberDAO;
	
	//회원 등록
	public void register(HttpServletRequest req) {
		
		String loginId = req.getParameter("loginId");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		memberVO.setLogin_id(loginId);
		memberVO.setPassword(password);
		memberVO.setName(name);
		memberVO.setPhone(phone);
		memberVO.setRole(MemberRole.USER);
		
		memberDAO.register(memberVO);
		
	}
	
	//로그인 처리
	public MemberVO login(HttpServletRequest req) {
		
		String loginId = req.getParameter("login_id");
		String password = req.getParameter("password");
		
		MemberVO member = memberDAO.login(loginId, password);
		

		if(!memberDAO.countByLoginId(loginId)) {
			req.setAttribute("errorMsg", "아이디가 존재하지 않습니다.");
			return null;
		}
		
		if(member==null) {
			req.setAttribute("errorMsg", "비밀번호가 틀렸습니다.");
		}
		
		if(member.getProfileImage()==null) {
			member.setProfileImage("/resources/image/noir_icon.png");
		}
		
		return member;
		
	}
}
