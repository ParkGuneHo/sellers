package com.uni.sellers.clientsalesactive;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uni.sellers.common.CommonDAO;
import com.uni.sellers.datasource.CommandMap;
import com.uni.sellers.util.CommonUtils;

@Controller
public class ClientSalesActiveController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="clientSalesActiveService")
	private ClientSalesActiveService clientSalesActiveService;
	
	@Resource(name="clientSalesActiveDAO")
	private ClientSalesActiveDAO clientSalesActiveDAO;
	
	@Resource(name="commonDAO")
	private CommonDAO commonDAO;
	
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 리스트
	 */
	@RequestMapping(value="/clientSalesActive/viewClientContactList.do")
	public ModelAndView viewClientContactList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/clientContactList");
		//지워도 되는지 모르겠음 2017 03 16 김진욱
		/*Map<String,Object> searchDetailGroup = clientSalesActiveService.clientContactSearchDetailGroup(map.getMap());
		mv.addObject("searchDetailGroup", searchDetailGroup);*/
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 대시보드
	 */
	@RequestMapping(value="/clientSalesActive/viewClientContactDashboard.do")
	public ModelAndView viewClientContactDashboard(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/clientContactDashboard");
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 대시보드 부서
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactDashBoardDivision.do")
	public ModelAndView selectClientContactDashBoardDivision(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactDashBoardDivision= clientSalesActiveDAO.selectClientContactDashBoardDivision(map.getMap());
		mv.addObject("list", selectClientContactDashBoardDivision);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 대시보드 팀
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactDashBoardTeam.do")
	public ModelAndView selectClientContactDashBoardTeam(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactDashBoardTeam= clientSalesActiveDAO.selectClientContactDashBoardTeam(map.getMap());
		mv.addObject("list", selectClientContactDashBoardTeam);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 대시보드 개인
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactDashBoardMember.do")
	public ModelAndView selectClientContactDashBoardMember(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactDashBoardMember= clientSalesActiveDAO.selectClientContactDashBoardMember(map.getMap());
		mv.addObject("list", selectClientContactDashBoardMember);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 고객사별 그룹
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactDashBoardCompanyGroup.do")
	public ModelAndView selectClientContactDashBoardCompanyGroup(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactDashBoardCompanyGroup= clientSalesActiveDAO.selectClientContactDashBoardCompanyGroup(map.getMap());
		mv.addObject("selectClientContactDashBoardCompanyGroup", selectClientContactDashBoardCompanyGroup); 
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 고객사별
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactDashBoardComapny.do")
	public ModelAndView selectClientContactDashBoardComapny(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactDashBoardComapny= clientSalesActiveDAO.selectClientContactDashBoardComapny(map.getMap());
		mv.addObject("selectClientContactDashBoardComapny", selectClientContactDashBoardComapny);
		return mv;
	}
		
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 고객영업활동 -> 고객컨택 리스트
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactList.do")
	public ModelAndView selectClientContactList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectClientContactList= clientSalesActiveService.selectClientContactList(map.getMap());
		mv.addObject("rows", selectClientContactList);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 08. 08.
	 * @explain	: 고객영업활동 -> 고객컨택 리스트 카운트
	 */
	@RequestMapping(value="/clientSalesActive/selectClientContactCount.do")
	public ModelAndView selectClientContactCount(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		Map<String,Object> countMap = clientSalesActiveDAO.selectClientContactCount(map.getMap());
		//페이징이 처리
		String listCount =  countMap.get("listCount").toString();
		mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
		String latelyUpdate = commonDAO.selectLatelyUpdate(map.getMap());
		mv.addObject("listCount", countMap.get("listCount"));
		mv.addObject("searchPKArray", countMap.get("searchPKArray"));
		mv.addObject("latelyUpdate", latelyUpdate);
		return mv;
	}
	
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 08. 22.
	 * @explain	: 영업활동 -> 고객컨택 상세보기
	 */
	@RequestMapping(value="/clientSalesActive/selectContactDetail.do")
	public ModelAndView selectContactDetail(CommandMap map, Device device) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> selectContactDetail = clientSalesActiveService.selectContactDetail(map.getMap());
		List<Map<String,Object>> selectContactFileList = clientSalesActiveDAO.selectContactFileList(map.getMap());
		mv.addObject("detail", selectContactDetail);
		mv.addObject("fileList",selectContactFileList);
		mv.addObject("actionList",clientSalesActiveDAO.gridActionPlanContact(map.getMap()));

		if (device.isNormal()) {
		    log.info("************************************* 접속 기기 : Normal");
		} else if (device.isTablet()) {
		    log.info("************************************* 접속 기기 : Tablet");
		} else if (device.isMobile()) {
            log.info("************************************* 접속 기기 : Mobile");
            log.info("************************************* " + map.get("datatype"));
            if (map.get("datatype")==null) {
                mv.setViewName("/clientSalesActive/clientContactDetail");
            }
            log.info("************************************* mv[" + mv.getViewName() + "]");
        }
		
		return mv;
	}
	
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 3.
	 * @explain	: 영업활동 -> 고객컨택 파일리스트
	 */
	@RequestMapping(value="/clientSalesActive/clientContactFileList.do")
	public ModelAndView clientContactFileList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> clientContactFileList = clientSalesActiveService.clientContactFileList(map.getMap());
		mv.addObject("clientContactFileList", clientContactFileList);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 7.
	 * @explain	: 영업활동 -> 고객컨택 insert
	 */
	@RequestMapping(value="/clientSalesActive/insertClientContact.do")
	public ModelAndView insertClientContact(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> getMap = clientSalesActiveService.insertClientContact(map.getMap(), request);
		mv.addObject("cnt", getMap.get("cnt"));
		mv.addObject("returnPK", getMap.get("filePK"));
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 7.
	 * @explain	: 영업활동 -> 고객컨택 update
	 */
	@RequestMapping(value="/clientSalesActive/updateClientContact.do")
	public ModelAndView updateClientContact(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.updateClientContact(map.getMap(), request);
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 7.
	 * @explain	: 영업활동 -> 고객컨택 delete
	 */
	@RequestMapping(value="/clientSalesActive/deleteClientContact.do")
	public ModelAndView deleteClientContact(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.deleteClientContact(map.getMap(), request);
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 27.
	 * @explain	: 영업활동 -> 고객컨택 Action Items Grid
	 */
	@RequestMapping(value="/clientSalesActive/gridContactActionItems.do")
	public ModelAndView gridContactActionItems(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> gridContactActionItems = clientSalesActiveService.gridContactActionItems(map.getMap());
		mv.addObject("rows", gridContactActionItems);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 27.
	 * @explain	: 영업활동 -> 고객컨택 Action Items Grid Insert
	 */
	@RequestMapping(value="/clientSalesActive/insertContactActionItem.do")
	public ModelAndView insertContactActionItem(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.insertContactActionItem(map.getMap());
		//int cnt = clientSalesActiveService.insertClientSatisfactionDetailList(map.getMap());
		mv.addObject("cnt" , cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 27.
	 * @explain	: 영업활동 -> 고객컨택 Action Items Grid Delete
	 */
	@RequestMapping(value="/clientSalesActive/deleteContactActionItem.do")
	public ModelAndView deleteContactActionItem(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("cnt" , clientSalesActiveService.deleteContactActionItem(map.getMap()));
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 6. 27.
	 * @explain	: 영업활동 -> 고객컨택 Action Items Grid
	 */
	@RequestMapping(value="/clientSalesActive/returnIssue.do")
	public ModelAndView returnIssue(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/listClientIssue");
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 10.
	 * @explain	: 영업활동 -> 고객컨택 gridActionPlanContact
	 */
	@RequestMapping(value="/clientSalesActive/gridActionPlanContact.do")
	public ModelAndView gridActionPlanContact(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> gridActionPlanContact = clientSalesActiveDAO.gridActionPlanContact(map.getMap());
		mv.addObject("rows" , gridActionPlanContact);
		return mv;
	}
	
    /**
     * @author  : 민성기
     * @Date    : 2017. 4. 7.
     * @explain : 영업활동 -> 고객컨택 등록/수정 폼으로 이동
     */
    @RequestMapping(value="/clientSalesActive/clientContactInsertForm.do")
    public ModelAndView clientContactInsertForm(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("clientSalesActive/clientContactInsertForm");
        mv.addObject("mode", map.get("mode"));
        mv.addObject("pkNo", map.get("pkNo"));
        return mv;
    }	
    
	//////////////////////////////////////고객컨택 end ////////////////////////////////////////////////
	
	
	////////////////////////////////////////영업기회 start ////////////////////////////////////////////////
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 첫 페이지
	*/
	@RequestMapping(value="/clientSalesActive/viewOpportunityList.do")
	public ModelAndView viewOpportunityList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityList");
		Map<String,Object> searchDetailGroup = clientSalesActiveService.opportunitySearchDetailGroup(map.getMap());
		mv.addObject("searchDetailGroup", searchDetailGroup);
		return mv;
	}
	
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 리스트 카운트
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunityCount.do")
	public ModelAndView selectOpportunityCount(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		//카운트
		Map<String,Object> countMap = clientSalesActiveDAO.selectOpportunityCount(map.getMap());
		String latelyUpdate = commonDAO.selectLatelyUpdate(map.getMap());
		
		//합계
		if(countMap.get("searchPKArray") == null) countMap.put("searchPKArray", ""); //nullpoint 에러방지
		countMap.put("searchPKArray", Arrays.asList(countMap.get("searchPKArray").toString().split(",")));
		countMap.put("searchStartDate", map.get("searchStartDate"));
		countMap.put("searchEndDate", map.get("searchEndDate"));
		Map<String,Object> sumMap = clientSalesActiveDAO.selectOpportunitySum(countMap);
		
		//페이징이 처리
		String listCount =  countMap.get("listCount").toString();
		mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
		mv.addObject("listCount", countMap.get("listCount"));
		mv.addObject("searchPKArray", countMap.get("searchPKArray"));
		mv.addObject("latelyUpdate", latelyUpdate);
		mv.addObject("sumMap", sumMap);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 매출계획 가져오기
	* Uni버전에서는 변경했음
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunitySalesPlan.do")
	public ModelAndView selectOpportunitySalesPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> selectOpportunitySalesPlan= clientSalesActiveDAO.selectOpportunitySalesPlan(map.getMap());
		List<Map<String, Object>> selectSalesPlanCount= clientSalesActiveDAO.selectSalesPlanCount(map.getMap());
		mv.addObject("salesAmount", selectOpportunitySalesPlan);
		mv.addObject("salesListCount", selectSalesPlanCount);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 09. 28
	* @explain	: 영업활동 -> 영업기회 매출계획 HTML
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunitySalesPlanHtml.do")
	public ModelAndView selectOpportunitySalesPlanHtml(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityModalSalesPlanHtml");
		/*
		 * 주석처리 2017-07-17 김진욱
		 */
		/*Map<String,Object> searchDetailGroup = clientSalesActiveService.opportunitySearchDetailGroup(map.getMap());
		mv.addObject("searchDetailGroup", searchDetailGroup);*/
	return mv;
	}
	
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 그리드
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunity.do")
	public ModelAndView gridOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String, Object>> gridOpportunity= clientSalesActiveService.gridOpportunity(map.getMap());
		mv.addObject("rows", gridOpportunity);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 8. 3.
	* @explain	: 사업전략 -> 전략 프로젝트 상세정보
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunityDetail.do")
	public ModelAndView selectOpportunityDetail(CommandMap map, Device device) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> selectOpportunityDetail = clientSalesActiveService.selectOpportunityDetail(map.getMap()); //기본정보
		List<Map<String,Object>> selectProductSalesList = clientSalesActiveService.selectOpportunityProductSalesList(map.getMap()); //매출 품목
		List<Map<String,Object>> selectProductPsList = clientSalesActiveService.selectOpportunityProductPsList(map.getMap()); //매입 품목
		List<Map<String, Object>> selectOpportunitySalesPlanList= clientSalesActiveDAO.selectOpportunitySalesPlanList(map.getMap()); //매출계획
		List<Map<String, Object>> selectOpportunitySalesSplitList= clientSalesActiveDAO.selectOpportunitySalesSplitList(map.getMap()); //매출계획 스플릿
		List<Map<String, Object>> selectSalesCycleWinPlan = clientSalesActiveService.gridSalesCycleWinPlan(map.getMap()); //윈플랜
		List<Map<String, Object>> selectMilestones = clientSalesActiveService.selectOpportunityMilestons(map.getMap()); //마일스톤
		List<Map<String,Object>> selectOpportunityScCheckList = clientSalesActiveDAO.selectOpportunityScCheckList(map.getMap()); //파일
		List<Map<String,Object>> selectOpportunityFileList = clientSalesActiveDAO.selectOpportunityFileList(map.getMap()); //파일
		
		mv.addObject("detail", selectOpportunityDetail);
		mv.addObject("productSalesList",selectProductSalesList);
		mv.addObject("productPsList",selectProductPsList);
		mv.addObject("salesPlanList",selectOpportunitySalesPlanList);
		mv.addObject("winPlanList",selectSalesCycleWinPlan);
		mv.addObject("salesSplitList",selectOpportunitySalesSplitList);
		mv.addObject("milestonesList",selectMilestones);
		mv.addObject("scCheckList",selectOpportunityScCheckList);
		mv.addObject("fileList",selectOpportunityFileList);
		
        if (device.isMobile()) {
            log.info("************************************* 접속 기기 : Mobile");
            if (map.get("datatype")==null) {
                mv.setViewName("/clientSalesActive/opportunityDetail");
            }
            log.info("************************************* mv[" + mv.getViewName() + "]");
        }       
		
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 3.
	* @explain	: 영업활동 -> 영업기회 파일리스트
	*/
	@RequestMapping(value="/clientSalesActive/opportunityFileList.do")
	public ModelAndView opportunityFileList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> opportunityFileList = clientSalesActiveService.opportunityFileList(map.getMap());
		mv.addObject("opportunityFileList", opportunityFileList);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 7.
	* @explain	: 영업활동 -> 영업기회 insert
	*/
	@RequestMapping(value="/clientSalesActive/insertOpportunity.do")
	public ModelAndView insertOpportunity(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.insertOpportunity(map.getMap(), request);
		mv.addObject("cnt", cnt);
		mv.addObject("pkNo", map.get("filePK"));
	return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2018. 10. 18.
	 * @explain	: 영업활동 -> 영업기회 리스트 마일스톤 마우스 오버~
	 */
	@RequestMapping(value="/clientSalesActive/selectOpportunityMilestonesList.do")
	public ModelAndView selectOpportunityMilestonesList(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> selectOpportunityMilestonesList = clientSalesActiveDAO.selectOpportunityMilestonesList(map.getMap()); //윈플랜
		mv.addObject("msList", selectOpportunityMilestonesList);
		return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 7.
	* @explain	: 영업활동 -> 영업기회 update
	*/
	@RequestMapping(value = "/clientSalesActive/updateOpportunity.do")
	public ModelAndView updateOpportunity(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		int cnt = clientSalesActiveService.updateOpportunity(map.getMap(), request);
		mv.addObject("cnt", cnt);
		mv.addObject("pkNo", map.get("hiddenModalPK"));
	return mv;
	}
	
	/**
	* @author : 욱이
	* @Date : 2016. 6. 7.
	* @explain : 영업활동 -> 영업기회 delete
	*/
	@RequestMapping(value = "/clientSalesActive/deleteOpportunity.do")
	public ModelAndView deleteOpportunity(CommandMap map, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.deleteOpportunity(map.getMap(), request);
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 7.
	* @explain	: 영업활동 -> 영업기회 milestones select
	*/
	@RequestMapping(value="/clientSalesActive/selectOpportunityMilestons.do")
	public ModelAndView selectOpportunityMilestons(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = clientSalesActiveService.selectOpportunityMilestons(map.getMap());
		mv.addObject("rows", list);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 saleCycle insert
	*/
	@RequestMapping(value="/clientSalesActive/insertSalesCycleActionPlan.do")
	public ModelAndView insertSalesCycleActionPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.insertSalesCycleActionPlan(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 saleCycle insert
	*/
	@RequestMapping(value="/clientSalesActive/insertSalesCycleWinPlan.do")
	public ModelAndView insertSalesCycleWinPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.insertSalesCycleWinPlan(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 saleCycle delete
	*/
	@RequestMapping(value="/clientSalesActive/deleteSalesCycleActionPlan.do")
	public ModelAndView deleteSalesCycleActionPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.deleteSalesCycleActionPlan(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 4.
	* @explain	: 영업활동 -> 영업기회 saleCycle delete
	*/
	@RequestMapping(value="/clientSalesActive/deleteSalesCycleWinPlan.do")
	public ModelAndView deleteSalesCycleWinPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.deleteSalesCycleWinPlan(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 7.
	* @explain	: 영업활동 -> 영업기회 saleCycle salesCheckList
	*/
	@RequestMapping(value="/clientSalesActive/gridSalesCheckList.do")
	public ModelAndView gridSalesCheckList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = clientSalesActiveService.gridSalesCheckList(map.getMap());
		mv.addObject("rows", list);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 8. 25.
	* @explain	: 영업활동 -> 영업기회 saleCycle salesCheckListOwner
	*/
	@RequestMapping(value="/clientSalesActive/gridSalesCheckListOwner.do")
	public ModelAndView gridSalesCheckListOwner(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = clientSalesActiveDAO.gridSalesCheckListOwner(map.getMap());
		mv.addObject("rows", list);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 7.
	* @explain	: 영업활동 -> 영업기회 saleCycle select 1단게
	*/
	@RequestMapping(value="/clientSalesActive/gridOpportunityCheckList.do")
	public ModelAndView gridSalesCycleActionPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = clientSalesActiveService.gridOpportunityCheckList(map.getMap());
		mv.addObject("rows", list);
	return mv;
	}
	
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 14.
	* @explain	: 영업활동 -> 영업기회 saleCycle select 2단계
	*/
	@RequestMapping(value="/clientSalesActive/gridSalesCycleWinPlan.do")
	public ModelAndView gridSalesCycleWinPlan(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = clientSalesActiveService.gridSalesCycleWinPlan(map.getMap());
		mv.addObject("rows", list);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 14.
	* @explain	: 영업활동 -> 영업기회 saleCycle complete
	*/
	@RequestMapping(value="/clientSalesActive/completeSaleCycle.do")
	public ModelAndView completeSaleCycle(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.completeSaleCycle(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 7. 05.
	* @explain	: 영업활동 -> 영업기회 saleCycle 체크리스트 저장
	*/
	@RequestMapping(value="/clientSalesActive/updateSalesCheckList.do")
	public ModelAndView updateSalesCheckList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.updateSalesCheckList(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 6. 14.
	* @explain	: 영업활동 -> 영업기회 saleCycle 3단계 업뎃
	*/
	@RequestMapping(value="/clientSalesActive/updateSaleCycleClose.do")
	public ModelAndView updateSaleCycleClose(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.updateSaleCycleClose(map.getMap());
		mv.addObject("cnt", cnt);
	return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 7. 05.
	* @explain	: 영업활동 -> 영업기회 saleCycle 단계 변경
	*/
	@RequestMapping(value="/clientSalesActive/updateSalesCycleStep.do")
	public ModelAndView updateSalesCycleStep(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.updateSalesCycleStep(map.getMap());
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2018. 05. 30.
	 * @explain	: 영업활동 -> 영업기회 client erp code update
	 */
	@RequestMapping(value="/clientSalesActive/updateClientMasterErpCd.do")
	public ModelAndView updateClientMasterErpCd(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveDAO.updateClientMasterErpCd(map.getMap());
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2018. 06. 05.
	 * @explain	: 영업활동 -> 영업기회 client erp code select
	 */
	@RequestMapping(value="/clientSalesActive/selectClientMasterErpCd.do")
	public ModelAndView selectClientMasterErpCd(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("ERP_CLIENT_CODE",clientSalesActiveDAO.selectClientMasterErpCd(map.getMap()));
		return mv;
	}
	
    /**
     * @author  : 민성기
     * @Date    : 2017. 6. 5.
     * @explain : 영업기회 -> 영업기회 모바일 등록/수정 폼으로 이동
     */
    @RequestMapping(value="/clientSalesActive/opportunityInsertForm.do")
    public ModelAndView clientIssueInsertForm(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("clientSalesActive/opportunityInsertForm");
        mv.addObject("mode", map.get("mode"));
        mv.addObject("pkNo", map.get("pkNo"));
        return mv;
    }       
	
    
    /**
     * @author  : 심
     * @Date    : 2018. 9. 13.
     * @explain : 영업기회 -> 영업기회 키딜 업데이트
     */
    @RequestMapping(value="/clientSalesActive/updateOppKeyDeal.do")
    public ModelAndView updateOppKeyDeal(CommandMap map, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveDAO.updateOppKeyDeal(map.getMap());
		mv.addObject("cnt", cnt);
		mv.addObject("pkNo", map.get("hiddenModalPK"));
		return mv;
    }
    
    /**
     * @author  : 심
     * @Date    : 2018. 9. 13.
     * @explain : 영업기회 -> 영업기회 키딜 업데이트
     */
    @RequestMapping(value="/clientSalesActive/updateOppSalesCycle.do")
    public ModelAndView updateOppSalesCycle(CommandMap map, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	int cnt = clientSalesActiveDAO.updateOppSalesCycle(map.getMap());
    	mv.addObject("cnt", cnt);
    	mv.addObject("pkNo", map.get("hiddenModalPK"));
    	return mv;
    }
	
    
    /**
	* @author 	: 욱이
	* @Date		: 2018. 12. 11.
	* @explain	: 영업활동 -> 영업기회 임시저장 체크
	*/
	@RequestMapping(value="/clientSalesActive/selectTempCountOpp.do")
	public ModelAndView selectTempCountOpp(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("opportunity_id", clientSalesActiveService.selectTempCountOpp(map.getMap()));
		return mv;
	}
	
	////////////////////////////////////////영업기회 end ////////////////////////////////////////////////
	
	
	
	
	
	
	//영업기회 대시보드
	@RequestMapping(value="/clientSalesActive/viewOpportunityDashBoard.do")
	public ModelAndView viewOpportunityDashBoard(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoard");
		//태원: 영업기회 - 개인별/고객사별 탭 
		//mv.addObject("tabFlag",map.get("tabFlag"));
		return mv;
	}
	
	//본부장 권한
	@RequestMapping(value="/clientSalesActive/selectOpportunityDashBoardDivision.do")
	public ModelAndView selectOpportunityDashBoardDivision(CommandMap map) throws Exception{
		//ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoardDivisionAjax");
		ModelAndView mv = new ModelAndView();
		
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		
		List<Map<String,Object>> selectOpportunityDashBoardDivision= clientSalesActiveDAO.selectOpportunityDashBoardDivision(map.getMap());
		mv.addObject("selectOpportunityDashBoardDivision", selectOpportunityDashBoardDivision);
		return mv;
	}
	
	//팀장권한
	@RequestMapping(value="/clientSalesActive/selectOpportunityDashBoardTeam.do")
	public ModelAndView selectOpportunityDashBoardTeam(CommandMap map) throws Exception{
		//ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoardTeamAjax");
		
		ModelAndView mv = new ModelAndView();
		
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		List<Map<String,Object>> selectOpportunityDashBoardTeam= clientSalesActiveDAO.selectOpportunityDashBoardTeam(map.getMap());
		mv.addObject("selectOpportunityDashBoardTeam", selectOpportunityDashBoardTeam);
		return mv;
	}
	
	//사원권한
	@RequestMapping(value="/clientSalesActive/selectOpportunityDashBoardMember.do")
	public ModelAndView selectOpportunityDashBoardMember(CommandMap map) throws Exception{
		//ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoardMemberAjax");
		
		ModelAndView mv = new ModelAndView();
		
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		List<Map<String,Object>> selectOpportunityDashBoardMember= clientSalesActiveDAO.selectOpportunityDashBoardMember(map.getMap());
		mv.addObject("selectOpportunityDashBoardMember", selectOpportunityDashBoardMember);
		return mv;
	}
	
	//영업기회 대시보드 (고객사별)
	@RequestMapping(value="/clientSalesActive/selectOpportunityDashBoardCompanyGroup.do")
	public ModelAndView selectOpportunityDashBoardCompanyGroup(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoardCompanyGroup");
		List<Map<String,Object>> selectOpportunityDashBoardCompanyGroup= clientSalesActiveDAO.selectOpportunityDashBoardCompanyGroup(map.getMap());
		mv.addObject("selectOpportunityDashBoardCompanyGroup", selectOpportunityDashBoardCompanyGroup); 
		return mv;
	}
	
	@RequestMapping(value="/clientSalesActive/selectOpportunityDashBoardComapny.do")
	public ModelAndView selectOpportunityDashBoardComapny(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/opportunityDashBoardCompany");
		List<Map<String,Object>> selectOpportunityDashBoardCompnay= clientSalesActiveDAO.selectOpportunityDashBoardComapny(map.getMap());
		mv.addObject("selectOpportunityDashBoardCompnay", selectOpportunityDashBoardCompnay);
		return mv;
	}

	
	////////////////////////////////////////잠재기회 start ////////////////////////////////////////////////
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재영업기회 리스트
	 */
	@RequestMapping(value="/clientSalesActive/viewHiddenOpportunityList.do")
	public ModelAndView listHiddenOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/hiddenOpportunityList");
		return mv;
	}
	
	/**
	* @author 	: 욱이
	* @Date		: 2016. 09. 05.
	* @explain	: 영업활동 -> 잠재기회 리스트
	*/
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunity.do")
	public ModelAndView selectHiddenOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
	List<Map<String,Object>> selectHiddenOpportunity= clientSalesActiveService.selectHiddenOpportunity(map.getMap());
	mv.addObject("rows", selectHiddenOpportunity);
	return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재기회 리스트 카운트
	 */
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityCount.do")
	public ModelAndView selectHiddenOpportunityCount(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		Map<String,Object> countMap = clientSalesActiveDAO.selectHiddenOpportunityCount(map.getMap());
		String latelyUpdate = commonDAO.selectLatelyUpdate(map.getMap());
		//페이징이 처리
		String listCount =  countMap.get("listCount").toString();
		mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
		mv.addObject("listCount", countMap.get("listCount"));
		mv.addObject("searchPKArray", countMap.get("searchPKArray"));
		mv.addObject("latelyUpdate", latelyUpdate);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재기회 상세보기
	 */
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDetail.do")
	public ModelAndView selectHiddenOpportunityDetail(CommandMap map, Device device) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String,Object> selectContactDetail = clientSalesActiveService.selectHiddenOpportunityDetail(map.getMap());
		//List<Map<String,Object>> selectContactFileList = clientSalesActiveDAO.selectHiddenOpportunityFileList(map.getMap());
		mv.addObject("detail", selectContactDetail);
		//mv.addObject("fileList",selectContactFileList);
		if (device.isMobile()) {
		    if (map.get("datatype")==null) {
		        mv.setViewName("/clientSalesActive/hiddenOpportunityDetail");
		    }
		}
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재기회 Action Plan
	 */
	@RequestMapping(value="/clientSalesActive/gridActionPlanHiddenOpportunity.do")
	public ModelAndView gridActionPlanHiddenOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> gridActionPlanHiddenOpportunity= clientSalesActiveDAO.gridActionPlanHiddenOpportunity(map.getMap());
		mv.addObject("rows", gridActionPlanHiddenOpportunity);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재기회 Action Plan
	 */
	@RequestMapping(value="/clientSalesActive/updateHiddenOpportunity.do")
	public ModelAndView updateHiddenOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		int cnt = clientSalesActiveService.updateHiddenOpportunity(map.getMap());
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 09. 05.
	 * @explain	: 영업활동 -> 잠재기회 Action Plan 삭제
	 */
	@RequestMapping(value="/clientSalesActive/deleteActionPlanHiddenOpportunity.do")
	public ModelAndView deleteActionPlanHiddenOpportunity(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		mv.addObject("cnt", clientSalesActiveDAO.deleteActionPlanHiddenOpportunity(map.getMap()));
		return mv;
	}
	
	/**
	 * @author 	: 욱이
	 * @Date		: 2016. 08. 31.
	 * @explain	: 영업활동 -> 고객컨택정보 입력 -> 잠재기회 입력
	 */
	@RequestMapping(value="/clientSalesActive/insertHiddenOpportunity.do")
	public ModelAndView insertHiddenOpportunity(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");		
		Map<String,Object> getMap = clientSalesActiveService.insertHiddenOpportunity(map.getMap(), request);
		mv.addObject("cnt", getMap.get("cnt"));
		mv.addObject("returnPK", getMap.get("filePK"));
		return mv;
	}
	
	
	//잠재영업기회 대시보드
	@RequestMapping(value="/clientSalesActive/viewHiddenOpportunityDashBoard.do")
	public ModelAndView viewHiddenOpportunityDashBoard(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("/clientSalesActive/hiddenOpportunityDashBoard");
		return mv;
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 3. 17.
	 * @explain : 고객영업활동 -> 잠재영업기회 -> 부서별
	 */
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDashBoardDivision.do")
	public ModelAndView selectHiddenOpportunityDashBoardDivision(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectHiddenOpportunityDashBoardDivision= clientSalesActiveDAO.selectHiddenOpportunityDashBoardDivision(map.getMap());
		mv.addObject("selectHiddenOpportunityDashBoardDivision", selectHiddenOpportunityDashBoardDivision);
		return mv;
	}
	
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDashBoardTeam.do")
	public ModelAndView selectHiddenOpportunityDashBoardTeam(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectHiddenOpportunityDashBoardTeam= clientSalesActiveDAO.selectHiddenOpportunityDashBoardTeam(map.getMap());
		mv.addObject("selectHiddenOpportunityDashBoardTeam", selectHiddenOpportunityDashBoardTeam);
		return mv;
	}
	
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDashBoardMember.do")
	public ModelAndView selectHiddenOpportunityDashBoardMember(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectHiddenOpportunityDashBoardMember= clientSalesActiveDAO.selectHiddenOpportunityDashBoardMember(map.getMap());
		mv.addObject("selectHiddenOpportunityDashBoardMember", selectHiddenOpportunityDashBoardMember);
		return mv;
	}
	
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDashBoardCompanyGroup.do")
	public ModelAndView selectHiddenOpportunityDashBoardCompanyGroup(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectHiddenOpportunityDashBoardCompanyGroup= clientSalesActiveDAO.selectHiddenOpportunityDashBoardCompanyGroup(map.getMap());
		mv.addObject("selectHiddenOpportunityDashBoardCompanyGroup", selectHiddenOpportunityDashBoardCompanyGroup);
		return mv;
	}
	
	@RequestMapping(value="/clientSalesActive/selectHiddenOpportunityDashBoardCompany.do")
	public ModelAndView selectHiddenOpportunityDashBoardCompany(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		List<Map<String,Object>> selectHiddenOpportunityDashBoardCompany= clientSalesActiveDAO.selectHiddenOpportunityDashBoardCompany(map.getMap());
		mv.addObject("selectHiddenOpportunityDashBoardCompany", selectHiddenOpportunityDashBoardCompany);
		return mv;
	}
	
    /**
     * @author  : 민성기
     * @Date    : 2017. 4. 7.
     * @explain : 영업활동 -> 고객컨택 등록/수정 폼으로 이동
     */
    @RequestMapping(value="/clientSalesActive/hiddenOpportunityInsertForm.do")
    public ModelAndView hiddenOpportunityInsertForm(CommandMap map, HttpServletRequest request) throws Exception{
        ModelAndView mv = new ModelAndView("clientSalesActive/hiddenOpportunityInsertForm");
        mv.addObject("mode", map.get("mode"));
        mv.addObject("pkNo", map.get("pkNo"));
        return mv;
    }   	
	////////////////////////////////////////잠재기회 end ////////////////////////////////////////////////
		
	
}