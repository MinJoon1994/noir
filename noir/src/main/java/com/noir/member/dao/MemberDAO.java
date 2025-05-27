package com.noir.member.dao;

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

}
