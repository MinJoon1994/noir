package com.noir.menu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noir.menu.vo.MenuVO;
import com.noir.menu.vo.SupplementVO;
import com.noir.menu.vo.WineVO;

@Repository
public class MenuDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//코스 메뉴 가져오기
	public List<MenuVO> selectByType(String menuType) {
		
		return sqlSession.selectList("mapper.menu.selectMenuByType",menuType);
	}
	
	//보충 메뉴 가져오기
	public List<SupplementVO> selectSupplementMenu() {
		
		return sqlSession.selectList("mapper.menu.selectSupplementMenu");
	}
	
	//와인 리스트 가져오기
	public List<WineVO> selectWineList(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("mapper.menu.selectWineList",paramMap);
	}

}
