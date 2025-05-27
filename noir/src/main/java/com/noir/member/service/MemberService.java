package com.noir.member.service;

import javax.servlet.http.HttpServletRequest;

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
}
