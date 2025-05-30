package com.noir.menu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noir.menu.dao.MenuDAO;
import com.noir.menu.vo.MenuVO;
import com.noir.menu.vo.SupplementVO;
import com.noir.menu.vo.WineVO;

@Service
public class MenuService {
	
	@Autowired
	MenuDAO menuDAO;
	
	//코스 메뉴 가져오기
	public List<MenuVO> getMenusByType(String menuType) {
		
		return menuDAO.selectByType(menuType);
	}
	
	//보충 메뉴 가져오기
	public List<SupplementVO> getSupplementMenu() {
		
		return menuDAO.selectSupplementMenu();
	}
	
	//와인리스트 가져오기
	public List<WineVO> getWineList(Map<String, Object> paramMap) {
		
		return menuDAO.selectWineList(paramMap);
	}

}
