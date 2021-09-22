package com.uni.sellers.common;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.groovy.transform.SynchronizedASTTransformation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.uni.sellers.util.CommonUtils;

public class CommonInterceptor extends HandlerInterceptorAdapter {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 5. 25.
	 * @explain	: 공통 인터셉터
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception, AccessDeniedException {
		log.info("======================================          START         ======================================");
		log.info(" Request URL \t:  " + request.getRequestURL());
		//세션 체크 후 로그인 페이지로 이동
		return checkSession(request,response);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception, AccessDeniedException {
		log.info("======================================           END          ======================================\n");
	}

	public boolean checkSession(HttpServletRequest request, HttpServletResponse response) throws Exception, AccessDeniedException{
		HttpSession session = request.getSession();
		boolean result = true;
		
		//keyCloakToken이 있는지 확인
  	  	String keyCloakToken = (String)session.getAttribute("token");
  	  	System.out.println("############# KEYCLOAK TOKEN ############### : "+keyCloakToken);
  	  	if (keyCloakToken==null) {
  	  		result = false; 

			try {
				response.sendRedirect("/logout");
			} catch (IOException e) {
				e.printStackTrace();
			}
  	  	}
		
		//ajax 통신인지 판단
		if (isAjaxRequest(request)) {
        	if(CommonUtils.isEmpty(session.getAttribute("userInfo")))
        	{
        		//session이 끊기면 403에러
        		response.sendError(HttpServletResponse.SC_FORBIDDEN);
        		result = false;
        	}
		} else {
			if(CommonUtils.isEmpty(session.getAttribute("userInfo")))
			{
//				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				result = false;
				try {
					response.sendRedirect("/logout");
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
        }
		return result;
	}
	
	private boolean isAjaxRequest(HttpServletRequest req) {
//    	log.info("ajaxValue : " + req.getHeader(ajaxHeader));
        return req.getHeader("AJAX") != null
                && req.getHeader("AJAX").equals(Boolean.TRUE.toString());
    }
	
}
