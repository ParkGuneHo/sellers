package com.uni.sellers.restful;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.uni.sellers.common.CommonDAO;
import com.uni.sellers.common.CommonService;
import com.uni.sellers.main.MainService;
import com.uni.sellers.security.CustomAuthenticationSuccessHandler;
/*
1. 응답 상태 설정 
      - setStatus(int sc), setStatus(int sc, Stirng sm) 
  정상적인 응답의 경우에 상태코드(sc)를 설정한다.  
  응답부를 Return 하기전에 호출되어야 한다. 
2. 응답상태코드 
    SC_OK(코드:200) : 클라이언트의 요청이 성공임을 표시, 서버의 응답은 요청된  
                              자료를 포함(Default Message : OK) 
    SC_MOVED_PERMENTLY(코드:301) : 요청된 리소스가 영구적으로 새위치로 이동, 
                                새위치는 Location Header에 포함(Default Msg : Moved Permanently) 
    SC_MOVED_TEMPORARILY(코드:302) : 요청된 리소스가 임시로 새위치로 이동, 
                                새로운 위치는 Location Header에 포함 
                                (Default Msg : Moved Temporaily) 
    SC_NOT_FOUND(코드 : 404) : 요청된  Resource가 없는 경우 
                                (Default Msg : Not Found) 
    SC_INTERNAL_SERVER_ERROR(코드:500) : 예상치못한 오류가 서버내에서 발생 
                                (Default Msg : Internal Server Error)  
    SC_CREATED(코드:201) : 요청은 성공되었고,서버에서 새로운 Resource가  
                                생성되었음을 표시 
                                (Default Msg : Created)  
3. 오류 재지정을 위한 응답 
    - sendError(int sc, String msg) throws IOException 
      클라이언트에게 상태 코드 sc 및 상세 메시지 msg과 함께 오류 응답을 전송 한다. 
    - sendError(int sc) throws IOException 
      디폴트 메시지로 오류 응답을 전송한다. 
    서블릿이 요청을 처리하는 동안 오류설정 
    - sendRedirect(String location) throws IOException 
      클라이언트에게 재지정 URL(location) 과 함께 재지정 응답을 전송한다. 
4. 응답 헤더 설정 : 헤더 이름(name)에 대하여 그 값(value)을 설정한다. 
    setHeader(String name, String value) 
    setIntHeader(String name, int value) 
    setDateHeader(String name, long date) 
    boolean containsHeader(String name) 
    HTML 
    <META HTTP-EQUIV> 
    예: <META HTTP-EQUIV=“name” CONTENT=“value”>              
5. 응답헤더 
  Chache-Control : 해당 문서에 대해 캐싱 시스템이 처리해야 하는 방식을 표시  
                            no-cache(캐시되어서는 안된다),no-store(프록시서버에의해  
                            캐시되거나, 저장되어서는 안된다) HTTP/1.1에 도입 
  Pragma : HTTP1.0의 Cache-Control과 같은것, no-cache만 사용가능 
  Connection : Client와의 접속을 유지할지 여부표시, Keep-Alive나 close등으로  
                      표시, 서블릿에서 자신의 Content-Length Header를 세팅하면 자동적 
                      으로 Keep-Alive갑으로 설정됨 
  Location : 문서의 새로운 위치를 기술, SC_CREATED,  
                  SC_MOVED_PERMENENTLY, SC_MOVE_TEMPORARILY등의  
                  상태코드와 함께 사용, 이헤더의 값은 http://를 포함해야 한다 

 =============================================
* 200 번대 응답(Response) : 성공(Success)
 	
200 OK
* 요청 정상 처리.

204 No Content
* 요청 정상 처리하였지만, 돌려줄 리소스 없음.
* 응답에 어떠한 엔티티 바디(Entity Body)도 포함하지 않음.
* 서버에서 처리 후, 클라이언트에 정보를 보낼 필요가 없는 경우 사용. 

206 Partial Content
* Range가 지정된 요청인 경우, 지정된 범위만큼의 요청을 받았다는 것을 알려줌. 

 =============================================

* 300 번대 응답(Response) : 리디렉션(Redirection)

301 Moved Permanently
* 요청된 리소스에는 새로운 URI가 지정되어 있기 때문에, 이후로는 새 URI를 사용해야 한다는 것을 나타냄. (영구적인 URI 변경)

302 Found
* 요청된 리소스에는 새로운 URI가 지정되어 있기 때문에, 이후로는 새 URI를 사용해야 한 다는 것을 나타냄. 301과 유사하지만, 302는 일시적인 URI 이동) 

303 See Other
* 이 응답은 요청에 대한 리소스는 다른 URI에 있기 때문에 GET 메서드를 사용해서 얻어야 한다는 것을 나타냄. 302 코드와 같지만, 303은 리디렉션 위치를 GET 메서드를 통해 얻어야 한다고 명확하게 되어 있음. 

304 Not Modified
* 요청한 리소스가 마지막 요청 이후 변경된 적이 없기 때문에 기존 클라이언트의 로컬 캐시 리소스를 사용하도록 알려줌.

300번대로 분류되어 있지만, 리디렉션과는 관계없는 처리를 함.

307 Temporary Redirect
* 임시로 페이지를 리다이렉트 함.

 =============================================

* 400 번대 응답(Response) : 클라이언트 에러 (Client Error)

400 Bad Request
* 클라이언트의 요청 구문이 잘못됨.
* 브라우저는 이 응답을 200 OK 응답과 동일한 형태로 취급함.

401 Unauthorized
* 요청 처리를 위해 HTTP 인증(BASIC 인증, DIGEST 인증) 정보가 필요함을 알려줌.
* 접근 허용을 차단함. 최초 요청에는 인증 다이얼로그 표시하고, 두번째는 인증 실패 응답을 보냄. 

403 Forbidden
* 접근 금지 응답. Directory Listing 요청(서버 파일 디렉토리 목록 표시) 및 관리자 페이지 접근 등을 차단하는 경우의 응답. (파일 시스템 퍼미션 거부, 허가 되지 않은 IP 주소를 통한 액세스의 거부 등)
* 서버는 엔티티 바디에 접근 거부에 대한 이유를 명시하여 보낼 수 있음.

404 Not Found
* 클라이언트가 요청한 리소스가 서버에 없음

405 
Mothod Not Allowed
* 허용되지 않는 HTTP 메서드를 사용함. 

 =============================================

* 500 번대 응답(Response) : 서버 에러 (Server Error)

500 Internal Server Error
* 서버에서 클라이언트 요청을 처리 중에 에러가 발생함.

503 Service Unavailable
* 서버가 일시적으로 요청을 처리할 수 없음.
* 서버가 과부하 상태이거나 점검중이므로 요청을 처리할 수 없음을 알려줌.

504 Gateway Timeout
* 서버를 통하는 게이트웨이에 문제가 발생하여 시간이 초과됨.

505 HTTP Version Not Supported
* 해당 HTTP 버전에서는 지원되지 않는 요청임을 알려줌.

 */

import io.swagger.annotations.ApiOperation;

@RestController
public class RestfulController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="customAuthenticationSuccessHandler")
	private CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Resource(name="commonDAO")
    private CommonDAO commonDAO;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@Resource(name="applicationCustomAuthenticationProvider")
	private ApplicationCustomAuthenticationProvider applicationCustomAuthenticationProvider;
	
	@Resource(name="restfulDAO")
	private RestfulDAO restfulDAO;
	
	@Resource(name="restfulService")
	private RestfulService restfulService;
	
	@Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@ResponseBody
	@RequestMapping(value = "/api/user", method = {RequestMethod.POST, RequestMethod.OPTIONS})
	public ModelAndView loginUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		//POST Body에  담긴 데이터 값 map에 담기
		//Map<String, Object> loginMap = Dispatcher.getBodyNonAjax(request);
		Map<String, Object> loginMap = Dispatcher.getBodyAjax(request);
		loginMap.put("member_id_num", loginMap.get("userId"));
		Map<String, Object> userInfo = commonDAO.selectLoginProccess(loginMap);
		
		//모바일 앱 로그인 로직
		Map<String, Object> rtMap = restfulService.mobileAppUser(loginMap, userInfo, request, response);
		mv.addObject("result", rtMap.get("result"));
		mv.addObject("moveUrl", rtMap.get("moveUrl"));
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/login", method = {RequestMethod.POST, RequestMethod.OPTIONS})
	public void ApiLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//POST Body에  담긴 데이터 값 map에 담기
		Map<String, Object> loginMap = Dispatcher.getBodyNonAjax(request);
		//Map<String, Object> loginMap = Dispatcher.getBodyAjax(request);
		loginMap.put("member_id_num", loginMap.get("userId"));
		Map<String, Object> userInfo = commonDAO.selectLoginProccess(loginMap);
		
		//모바일 앱 로그인 로직
		restfulService.mobileAppLogin(loginMap, userInfo, request, response);
	 }
	
	//토큰 생성 테스트
	@ResponseBody
	@RequestMapping(value = "/api/token", method = {RequestMethod.POST, RequestMethod.OPTIONS})
	public void receiveToken(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//POST Body에  담긴 데이터 값 map에 담기
		Map<String, Object> map = Dispatcher.getBodyNonAjax(request);
		
		log.info(map.get("Token").toString());
	 }
	
	
	
	@ResponseBody
	@ApiOperation(value = "로그인", notes = "로그인 체크 후 세션, 회원정보 리턴")
	@RequestMapping(value = "/api/logintest", method = {RequestMethod.POST, RequestMethod.OPTIONS})
	public ModelAndView restfulApiLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		//POST Body에  담긴 데이터 값 map에 담기
		Map<String, Object> loginMap = Dispatcher.getBodyNonAjax(request);
		
		Map<String, Object> userInfo = commonDAO.selectLoginProccess(loginMap);
		
		//암호 복호화 로직
		String password_enc = loginMap.get("password_enc").toString();
		//String kkkk = commonAppSecurity.Encryption("uni123", KEY_SCURITY);
		
		//로그인 로직
		Authentication requestAuthentication = new UsernamePasswordAuthenticationToken(loginMap.get("member_id_num"), password_enc);
		Authentication result = applicationCustomAuthenticationProvider.appAutoAuthenticate(requestAuthentication, loginMap);
		SecurityContextHolder.getContext().setAuthentication(result);
		
		int rslt = result.isAuthenticated() ? 1:-1;
		
		mv.addObject("result", rslt);
		mv.addObject("userInfo",userInfo);
		
		return mv;
	}
	
}
