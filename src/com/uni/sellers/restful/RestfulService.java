package com.uni.sellers.restful;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Service;

import com.uni.sellers.common.CommonAppSecurity;
import com.uni.sellers.common.CommonService;
import com.uni.sellers.security.CustomAuthenticationSuccessHandler;

@Service("restfulService")
public class RestfulService {
	private static final String KEY_SCURITY = "sellersDunetUnipoint";
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="customAuthenticationSuccessHandler")
	private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Resource(name="applicationCustomAuthenticationProvider")
	private ApplicationCustomAuthenticationProvider applicationCustomAuthenticationProvider;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name="restfulDAO")
	private RestfulDAO restfulDAO;
	
	@Resource(name="commonAppSecurity")
	private CommonAppSecurity commonAppSecurity;
	
	@Value("#{config['ip.addr']}")
	private String ipAddr;
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	public void login(HttpServletRequest request, HttpServletResponse response, Object id, Object pw) throws Exception {
		Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(id, pw);
		Authentication result = applicationCustomAuthenticationProvider.authenticate(requestAuthentication);
		SecurityContextHolder.getContext().setAuthentication(result);
		customAuthenticationSuccessHandler.onAuthenticationSuccess(request, response, result);
	}
	
	public Map<String, Object> mobileAppUser(Map<String, Object> loginMap, Map<String, Object> userInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> rtMap = new HashMap<String, Object>();
		//loginMap ????????? ?????????
		//userInfo ????????? ??????
		
		if(loginMap != null && userInfo != null) { //????????? ?????????, ???????????? ????????????
			/*String gotoUrl = "/main/index.do"; //??????????????? ??????
			
			if(loginMap.get("pushUrl") != null && !"".equals(loginMap.get("pushUrl"))) { //pushUrl ?????? ????????? ??????
				gotoUrl = loginMap.get("pushUrl").toString();
			}*/
			
			if(loginMap.get("userDi") != null && !"".equals(loginMap.get("userDi"))) { //????????? ???????????? ?????? ??????????????? ????????? X
				if("1".equals(loginMap.get("autoLogin").toString())) { //??????????????? 
					//int cnt = 0;
					//cnt = upsertUserDevice(loginMap); //????????? ???????????? ?????? ?????? ?????? 
					
					//if(cnt > 0){ //?????? ?????????
					Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(loginMap.get("userId"), loginMap.get("autoLogin"));
					Authentication result = applicationCustomAuthenticationProvider.appAutoAuthenticate(requestAuthentication, null);
					SecurityContextHolder.getContext().setAuthentication(result);
					
					customAuthenticationSuccessHandler.appOnAuthenticationSuccess(request, response, result);
					//redirectStrategy.sendRedirect(request, response, ipAddr + gotoUrl);
					
					int rslt = result.isAuthenticated() ? 1:-1;
					
					rtMap.put("result", rslt);
					rtMap.put("moveUrl", ipAddr + "/api/login");
					//rtMap.put("moveUrl", "http://thesellers.unipoint.co.kr:30300/api/login");
					
					return rtMap;
					//}
				}else { //???????????? ?????? ??? ?????????
					//?????? ????????? ??????
					String decPw = loginMap.get("userPw").toString();
					String encPw = commonAppSecurity.Decryption(decPw, KEY_SCURITY);
					
					//????????? ??????
					Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(loginMap.get("userId"), encPw);
					Authentication result = applicationCustomAuthenticationProvider.authenticate(requestAuthentication);
					SecurityContextHolder.getContext().setAuthentication(result);
					
					int rslt = result.isAuthenticated() ? 1:-1;
					rtMap.put("result", rslt);
					
					if(result.isAuthenticated()){
						customAuthenticationSuccessHandler.appOnAuthenticationSuccess(request, response, result);
						//redirectStrategy.sendRedirect(request, response, ipAddr + gotoUrl);
						
						rtMap.put("moveUrl", ipAddr + "/api/login");
						//rtMap.put("moveUrl", "http://thesellers.unipoint.co.kr:30300/api/login");
					}else {
						
					}
					
					return rtMap;
				}
				
			}
		}
		rtMap.put("result", -1);
		rtMap.put("moveUrl", "");
		return rtMap;
	}
	
	public void mobileAppLogin(Map<String, Object> loginMap, Map<String, Object> userInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//loginMap ????????? ?????????
		//userInfo ????????? ??????
		
		if(loginMap != null && userInfo != null) { //????????? ?????????, ???????????? ????????????
			String gotoUrl = "/main/index.do"; //??????????????? ??????
			
			if(loginMap.get("pushUrl") != null && !"".equals(loginMap.get("pushUrl"))) { //pushUrl ?????? ????????? ??????
				gotoUrl = loginMap.get("pushUrl").toString();
			}
			
			if(loginMap.get("userDi") != null && !"".equals(loginMap.get("userDi"))) { //????????? ???????????? ?????? ??????????????? ????????? X
				if("1".equals(loginMap.get("autoLogin").toString())) { //??????????????? 
					int cnt = 0;
					cnt = upsertUserDevice(loginMap); //????????? ???????????? ?????? ?????? ?????? 
					
					if(cnt > 0){ //?????? ?????????
						Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(loginMap.get("userId"), loginMap.get("autoLogin"));
						Authentication result = applicationCustomAuthenticationProvider.appAutoAuthenticate(requestAuthentication, null);
						SecurityContextHolder.getContext().setAuthentication(result);
						
						customAuthenticationSuccessHandler.appOnAuthenticationSuccess(request, response, result);
						redirectStrategy.sendRedirect(request, response, ipAddr + gotoUrl);
						//redirectStrategy.sendRedirect(request, response, "http://thesellers.unipoint.co.kr:30300" + gotoUrl);
					}
				}else { //???????????? ?????? ??? ?????????
					//?????? ????????? ??????
					String decPw = loginMap.get("userPw").toString();
					String encPw = commonAppSecurity.Decryption(decPw, KEY_SCURITY);
					//String kkkk = commonAppSecurity.Encryption("uni123", KEY_SCURITY);
					
					//????????? ??????
					Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(loginMap.get("userId"), encPw);
					Authentication result = applicationCustomAuthenticationProvider.appAutoAuthenticate(requestAuthentication, null);
					SecurityContextHolder.getContext().setAuthentication(result);
					
					int rslt = result.isAuthenticated() ? 1:-1;
					
					if(result.isAuthenticated()){
						int cnt = 0;
						cnt = upsertUserDevice(loginMap); //????????? ???????????? ?????? ?????? ?????? 
						
						if(cnt > 0){ //?????? ?????????
							customAuthenticationSuccessHandler.appOnAuthenticationSuccess(request, response, result);
							redirectStrategy.sendRedirect(request, response, ipAddr + gotoUrl);
							//redirectStrategy.sendRedirect(request, response, "http://thesellers.unipoint.co.kr:30300" + gotoUrl);
						}
					}else {
						
					}
					
				}
				
			}
		}
		
	}
	
	@SuppressWarnings("unused")
	public int upsertUserDevice(Map<String, Object> map) throws Exception {
		//????????? ???????????? ???  ???????????? ????????? ??????
		List<Map<String, Object>> list = restfulDAO.selectUserDeviceKey(map);
		String deviceKey = map.get("userDi").toString();
		int cnt = 0;
		boolean diCheck = false;
		
		for(int i=0; i<list.size(); i++){
			if(deviceKey.equals("123") || deviceKey.equals(list.get(i).get("DEVICE_KEY"))) {
				cnt = 1;
				diCheck = true;
			}
		}
		
		if(!diCheck){
			//????????? ??????????????? 3??? ?????? ??????
			if(list != null) {
				if(3 <= list.size() ) { //??????????????? ?????? ?????? ????????? ??????
					map.put("device_key_id", list.get(0).get("DEVICE_KEY_ID"));
					cnt = restfulDAO.updateUserDeviceKey(map);
				}else{ //2??? ????????? ?????? ??????
					cnt = restfulDAO.insertUserDeviceKey(map);
				}
			}else { //?????????????????? ??????
				cnt = restfulDAO.insertUserDeviceKey(map);
			}
		}
		
		return cnt;
	}
	
}
