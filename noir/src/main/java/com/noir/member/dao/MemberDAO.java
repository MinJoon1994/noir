package com.noir.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noir.member.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//1.회원등록
	public void register(MemberVO memberVO) {
		sqlSession.insert("mapper.member.insertMember",memberVO);
	}
	
	//2.회원 가입된 아이디 존재하는지 체크
	public boolean countByLoginId(String loginId) {
		Integer count = sqlSession.selectOne("mapper.member.countByLoginId", loginId);
		return count !=null && count > 0;
		
	}
	//3.로그인 처리
	public MemberVO login(String loginId,String password) {
		Map<String,String> map = new HashMap<>();
		map.put("login_id",loginId);
		map.put("password", password);
		return sqlSession.selectOne("mapper.member.login",map);
	}

}
