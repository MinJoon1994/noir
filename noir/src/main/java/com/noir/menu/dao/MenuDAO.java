package com.noir.menu.dao;

import java.util.HashMap;
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
	
	//1. 코스 메뉴 가져오기
	public List<MenuVO> selectByType(String menuType) {
		
		return sqlSession.selectList("mapper.menu.selectMenuByType",menuType);
	}
	
	//2. 보충 메뉴 가져오기
	public List<SupplementVO> selectSupplementMenu() {
		
		return sqlSession.selectList("mapper.menu.selectSupplementMenu");
	}
	
	//3. 와인 리스트 가져오기
	public List<WineVO> selectWineList(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("mapper.menu.selectWineList",paramMap);
	}
	
	//4. 보충 메뉴 수정
	public void updateSupplementMenu(SupplementVO supplement) {
		
		sqlSession.update("mapper.menu.updateSupplementMenu",supplement);
	}
	
	//5. 코스 메뉴 수정
	public void updateMenu(MenuVO menu) {
		
		sqlSession.update("mapper.menu.updateMenu",menu);
	}
	
	//6. 메뉴 순서 변경 요청
	public void swapOrder(int currentId, int targetOrder) {
		Map<String,Integer> paramMap= new HashMap<>();
		paramMap.put("id",currentId);
		paramMap.put("order", targetOrder);
		
		sqlSession.update("mapper.menu.swapOrder",paramMap);
		
	}

}
