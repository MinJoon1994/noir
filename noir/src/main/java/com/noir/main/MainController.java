package com.noir.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


//누아르 식당 메인페이지 네비 관련

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	
	//메인 페이지
	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
				
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//식당 소개 페이지
	@RequestMapping(value= "/about.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView about(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
				
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//메뉴 페이지
	@RequestMapping(value= "/menu.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView menu(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
				
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//갤러리 페이지
	@RequestMapping(value= "/gallery.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView gallery(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
				
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
}





