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


//@Controller("mainController"): 해당 클래스를 컨트롤러로 지정하며, 빈의 이름을 "mainController"로 설정한다.
//@EnableAspectJAutoProxy: AOP를 사용하기 위한 어노테이션으로, 이를 설정하면 자동으로 AOP 프록시를 생성하여 적용한다.
@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	

	@RequestMapping(value= "/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		session=request.getSession();
				
		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		return mav;
	}
}





