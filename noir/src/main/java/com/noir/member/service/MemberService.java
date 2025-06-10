package com.noir.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.noir.member.dao.MemberDAO;
import com.noir.member.vo.GoogleProfile;
import com.noir.member.vo.KakaoProfile;
import com.noir.member.vo.MemberRole;
import com.noir.member.vo.MemberVO;
import com.noir.member.vo.NaverProfile;

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
	
	//카카오 고유 ID로 회원 찾기
	public MemberVO findByKakaoId(HttpServletRequest req, KakaoProfile kakaoProfile) {
		
		String kakaoId = kakaoProfile.getId()+"";
		
		return memberDAO.findBySnsId(kakaoId);
	}
	
	
	//카카오 로그인 -> 로컬 회원가입 처리
	public MemberVO registerKakaoLogin(HttpServletRequest req, KakaoProfile kakaoProfile) {
		
		MemberVO member = new MemberVO();
		
		member.setLogin_id(kakaoProfile.getKakao_account().getEmail());
		member.setPassword("Social_login");
		member.setName(kakaoProfile.getProperties().getNickname());
		member.setProfileImage(kakaoProfile.getKakao_account().getProfile().getProfile_image_url());
		member.setPhone(kakaoProfile.getKakao_account().getPhone_number());
		member.setSocial_type("KAKAO");
		member.setSns_id(kakaoProfile.getId()+"");
		member.setRole(MemberRole.USER);
		
		System.out.println(member.getPhone());
		
		memberDAO.registerKakao(member);
		
		return member;
	}


	//네이버 고유 ID로 회원찾기
	public MemberVO findByNaverId(HttpServletRequest req, NaverProfile naverProfile) {
		
		String naverId = naverProfile.getResponse().getId();
		
		return memberDAO.findBySnsId(naverId);
	}
	
	//네이버 로그인 -> 로컬 회원가입 처리
	public MemberVO registerNaverLogin(HttpServletRequest req, NaverProfile naverProfile) {
		
		MemberVO member = new MemberVO();
		
		member.setLogin_id(naverProfile.getResponse().getEmail());
		member.setPassword("Social_login");
		member.setName(naverProfile.getResponse().getNickname());
		member.setProfileImage(naverProfile.getResponse().getProfile_image());
		member.setPhone(naverProfile.getResponse().getMobile());
		member.setSocial_type("NAVER");
		member.setSns_id(naverProfile.getResponse().getId());;
		member.setRole(MemberRole.USER);
		
		System.out.println(member.getPhone());
		
		memberDAO.registerKakao(member);
		
		return member;
	}

	public MemberVO findByGoogleId(HttpServletRequest req, GoogleProfile googleProfile) {
		
		String snsId = googleProfile.getId();
	
		return memberDAO.findBySnsId(snsId);
	}

	public MemberVO registerGoogleLogin(HttpServletRequest req, GoogleProfile googleProfile) {
		
		MemberVO member = new MemberVO();
		
		member.setLogin_id(googleProfile.getEmail());
		member.setPassword("Social_login");
		member.setName(googleProfile.getName());
		member.setProfileImage(googleProfile.getPicture());
		member.setSocial_type("Google");
		member.setSns_id(googleProfile.getId());;
		member.setRole(MemberRole.USER);
		
		memberDAO.registerGoogle(member);
		
		return member; 
	}

	public void saveGooglePhone(HttpServletRequest req, String phone) {
		
		HttpSession session = req.getSession();
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		String snsId = member.getSns_id();
		
		memberDAO.saveGooglePhone(phone,snsId);
		
	}
}
