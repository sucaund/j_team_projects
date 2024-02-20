package team.hellong.service;

import java.lang.reflect.Method;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SampleInterceptor implements HandlerInterceptor {
	public SampleInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	// 3번	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	    System.out.println("post handle........................");
	    String ID =  (String)modelAndView.getModel().get("id");
	    int memCnt = (Integer) modelAndView.getModel().get("memCnt");
	    System.out.println("SampleInterceptor  post handle memCnt: " + memCnt);
	    if(memCnt <  1){
		      System.out.println("memCnt Not exists");
		      request.getSession().setAttribute("ID", ID);
		      // User가 존재하지 않으면   User interCeptor Page(회원등록) 이동 
		      response.sendRedirect("doMemberWrite"); 
		} else {       //    정상   Login   User  
		      System.out.println("memCnt exists");
		      request.getSession().setAttribute("ID", ID);
		      // User가 존재하면   User interCeptor Page(회원List) 이동 
		      response.sendRedirect("doMemberList"); 
		}	
	 }

	// 1번
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    System.out.println("pre handle..........................");
	    HandlerMethod method =  (HandlerMethod) handler;
	    Method methodObj = method.getMethod();
	    System.out.println("Bean: " + method.getBean());
	    System.out.println("Method: " + methodObj);
	    
		return true;	
	}

}
