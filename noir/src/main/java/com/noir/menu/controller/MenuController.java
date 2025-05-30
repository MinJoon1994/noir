package com.noir.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.noir.menu.service.MenuService;
import com.noir.menu.vo.MenuVO;
import com.noir.menu.vo.SupplementVO;
import com.noir.menu.vo.WineVO;

@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;
	//메뉴 페이지
	@RequestMapping(value= "/list.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView menu(@RequestParam String menuType,
							 HttpServletRequest request,
							 HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
		
		if(menuType==null || menuType.equals("")) menuType="lunch";
		
		ModelAndView mav=new ModelAndView();
		
		//메뉴타입으로 메뉴리스트 불러오기
		List<MenuVO> menuList = menuService.getMenusByType(menuType);
		
		//보충메뉴 메뉴리스트 불러오기
		List<SupplementVO> supplementList = menuService.getSupplementMenu();
		
		mav.addObject("menuList",menuList);
		mav.addObject("supplementList",supplementList);
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping("/wine.do")
	public ModelAndView wine(HttpServletRequest req, HttpServletResponse resp) {

		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/menu/winelist");
		
		return mav;
	}
	
	//와인 리스트 페이지
	@RequestMapping("/winelist.do")
	public ModelAndView wineList(
			@RequestParam(required = false) String wine_name,
		    @RequestParam(required = false) String wine_type,
		    @RequestParam(required = false) String region,
		    @RequestParam(required = false) String vintage,
		    @RequestParam(required = false) String wine_category,
			HttpServletRequest req,HttpServletResponse resp)throws Exception{
		
		HttpSession session;
		session=req.getSession();

		ModelAndView mav=new ModelAndView();
		
		System.out.println("wine_name : "+wine_name);
		
		//와인 검색 조건
		Map<String, Object> paramMap = new HashMap<>();
	    if (wine_name != null && !wine_name.isEmpty()) paramMap.put("wine_name", wine_name);
	    if (wine_type != null && !wine_type.isEmpty()) paramMap.put("wine_type", wine_type);
	    if (region != null && !region.isEmpty()) paramMap.put("region", region);
	    if (vintage != null && !vintage.isEmpty()) paramMap.put("vintage", vintage);
	    if (wine_category != null && !wine_category.isEmpty()) paramMap.put("wine_category", wine_category);
		
		//와인리스트 불러오기
		List<WineVO> wineList = menuService.getWineList(paramMap);
		
		mav.addObject("wineList",wineList);

		String viewName=(String)req.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	

}
