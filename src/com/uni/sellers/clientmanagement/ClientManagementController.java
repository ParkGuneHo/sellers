package com.uni.sellers.clientmanagement;

//import java.util.ArrayList;
//import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.uni.sellers.admin.AdminDAO;
import com.uni.sellers.admin.AdminService;
import com.uni.sellers.clientsalesactive.ClientSalesActiveDAO;
import com.uni.sellers.clientsatisfaction.ClientSatisfactionDAO;
import com.uni.sellers.datasource.CommandMap;
import com.uni.sellers.util.CommonUtils;



@Controller
public class ClientManagementController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Resource(name="clientManagementService")
	private ClientManagementService clientManagementService;
	
	@Resource(name="clientManagementDAO")
	private ClientManagementDAO clientManagementDAO;	
	
	@Resource(name="clientSalesActiveDAO")
	private ClientSalesActiveDAO clientSalesActiveDAO;
	
	@Resource(name="clientSatisfactionDAO")
	private ClientSatisfactionDAO clientSatisfactionDAO;
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	@Value("#{config['path.image']}")
	private String imagePath;

	////////////////////////////////////////고객개인정보 관리 start////////////////////////////////////////////
	
	/**
	 * @author 	: 장성훈
	 * @Date		: 2016. 7. 17.
	 * @explain	: 고객관리 -> 고객개인정보 관리 그리드
	 */
	@RequestMapping(value="/clientManagement/gridClientIndividualInfo.do")
	public ModelAndView gridClientIndividualInfo(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> gridClientIndividualInfo= clientManagementService.gridClientIndividualInfoManage(map.getMap());
		mv.addObject("rows", gridClientIndividualInfo);
		return mv;
	}
	
	@RequestMapping(value="/clientManagement/clientIndividualPhotoList.do")
	public ModelAndView clientIndividualPhotoList(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> clientIndividualPhotoList= clientManagementService.clientIndividualPhotoList(map.getMap());
		mv.addObject("rows", clientIndividualPhotoList);
		return mv;
	}
	
	/**
	 * @author 	: 장성훈
	 * @Date		: 2016. 7. 17.
	 * @explain	: 고객관리 -> 고객개인정보 관리 update
	 */
	@RequestMapping(value="/clientManagement/updateClientIndividualInfo.do")
	public ModelAndView updateClientIndividualInfo(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		int cnt = clientManagementService.updateClientIndividualInfo(map.getMap(), request);
		mv.addObject("cnt", cnt);
		return mv;
	}
	
	/**
	 * @author 	: 장성훈
	 * @Date		: 2016. 6. 9.
	 * @explain	: 영업활동 -> 고객개인정보 관리 delete    //  작업해야함
	 */
	@RequestMapping(value="/clientManagement/deleteClientIndividualInfo.do")
	public ModelAndView deleteClientIndividualInfo(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		int cnt = clientManagementService.deleteClientIndividualInfo(map.getMap(), request);
		mv.addObject("cnt", cnt);
		return mv;
	}	
	
	/**
	 * @author 	: 장성훈
	 * @Date		: 2016. 6. 8.
	 * @explain	: 고객관리 -> 고객개인정보 관리 insert
	 */
	@RequestMapping(value="/clientManagement/insertClientIndividualInfo.do")
	public ModelAndView insertClientIndividualInfo(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(map.get("datatype").equals("html")){
			log.info((String)map.get("jsp"));
			mv.setViewName((String)map.get("jsp"));
		}else{
			mv.setViewName("jsonView");
		}
		
		Map<String, Object> clientMap = clientManagementService.insertClientIndividualInfo(map.getMap(), request);
		mv.addObject("cnt", clientMap.get("cnt"));
		mv.addObject("filePK", clientMap.get("filePK"));
		mv.addObject("error", clientMap.get("error"));
		return mv;
	}
	
	////////////////////////////////////////고객개인정보 관리 end//////////////////////////////////////////////
	
	
	
	
	
	///////////////////////////////////////고객사정보 관리 start//////////////////////////////////////////////
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객사정보 관리 그리드
		 */
		@RequestMapping(value="/clientManagement/gridClientCompanyInfo.do")
		public ModelAndView gridClientCompanyInfo(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> gridClientCompanyInfo= clientManagementService.gridClientCompanyInfo(map.getMap());
			mv.addObject("rows", gridClientCompanyInfo);
			return mv;
		}
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객사정보 관리 update
		 */
		@RequestMapping(value="/clientManagement/updateClientCompanyInfo.do")
		public ModelAndView updateClientCompanyInfo(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.updateClientCompanyInfo(map.getMap(), request);
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		/**
		 * @author 	: 준이
		 * @Date		: 2017. 03. 17.
		 * @explain	: 고객사 및 고객개인정보 -> 고객사정보 insert : 테리토리 주석처리
		 */
		@RequestMapping(value="/clientManagement/insertClientCompanyInfo.do")
		public ModelAndView insertClientCompanyInfo(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			Map<String, Object> clientMap = clientManagementService.insertClientCompanyInfo(map.getMap(), request);
			mv.addObject("cnt", clientMap.get("cnt"));
			mv.addObject("filePK", clientMap.get("filePK"));
			mv.addObject("error", clientMap.get("error"));
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 27.
		 * @explain : 고객사정보 -> 프로젝트 관리 이력 insert
		 */
		@RequestMapping(value="/clientManagement/insertClientCompanyProjectMg.do")
		public ModelAndView insertClientCompanyProjectMg(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("cnt", clientManagementService.insertClientCompanyProjectMg(map.getMap()));
			return mv;
		}
		
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 27.
		 * @explain : 고객사정보 -> 프로젝트 관리 이력 update
		 */
		@RequestMapping(value="/clientManagement/selectTerritory.do")
		public ModelAndView selectTerritory(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("selectTerritory", clientManagementDAO.selectTerritory(map.getMap()));
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 27.
		 * @explain : 고객사정보 -> 프로젝트 관리 이력 상세보기
		 */
		@RequestMapping(value="/clientManagement/selectClientCompanyProjectMg.do")
		public ModelAndView selectClientCompanyProjectMg(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("selectClientCompanyProjectMg", clientManagementService.selectClientCompanyProjectMg(map.getMap()));
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 27.
		 * @explain : 고객사정보 -> 프로젝트 관리 이력 상세보기 ( 프로젝트 인원 )
		 */
		@RequestMapping(value="/clientManagement/selectClientCompanyProjectMgPerson.do")
		public ModelAndView selectClientCompanyProjectMgPerson(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("rows", clientManagementService.selectClientCompanyProjectMgPerson(map.getMap()));
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 27.
		 * @explain : 고객사정보 -> 프로젝트 관리 이력 삭제 ( 프로젝트 인원 )
		 */
		@RequestMapping(value="/clientManagement/deleteClientCompanyProjectMgPerson.do")
		public ModelAndView deleteClientCompanyProjectMgPerson(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			mv.addObject("cnt", clientManagementService.deleteClientCompanyProjectMgPerson(map.getMap()));
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/deleteClientCompanyProject.do")
		public ModelAndView deleteClientCompanyProject(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			int cnt = clientManagementService.deleteClientCompanyProject(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/updateClientCompanyFile.do")
		public ModelAndView updateClientCompanyFile(CommandMap map, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.updateClientCompanyFile(map.getMap(), request);
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectAllIndustrySegmentCode.do")
		public ModelAndView selectAllIndustrySegmentCode(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> selectAllIndustrySegmentCode= clientManagementService.selectAllIndustrySegmentCode(map.getMap());
			mv.addObject("rows", selectAllIndustrySegmentCode);
			return mv;
		}
		
		
	    /**
	     * @author  : 민성기
	     * @Date    : 2017. 6. 12.
	     * @explain : 고객사 및 고객개인정보 -> 고객사 등록/수정 폼으로 이동
	     */
	    @RequestMapping(value="/clientManagement/clientCompanyInsertForm.do")
	    public ModelAndView clientCompanyInsertForm(CommandMap map, HttpServletRequest request) throws Exception{
	        ModelAndView mv = new ModelAndView("clientManagement/clientCompanyInsertForm");
	        mv.addObject("mode", map.get("mode"));
	        mv.addObject("pkNo", map.get("pkNo"));
	        return mv;
	    }
	    
	    /**
		 * @author  : 심
		 * @date : 2018. 8. 31.
		 * @explain : 고객사정보 -> 상세보기 -> IT정보
		 */
		@RequestMapping(value="/clientManagement/selectClientItInfo.do")
		public ModelAndView selectClientItInfo(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("clientCompanyItInfo", clientManagementDAO.selectClientItInfo(map.getMap()));
			
			return mv;
		}
		
	///////////////////////////////////////고객사정보 관리 end////////////////////////////////////////////////
	
		@RequestMapping(value="/clientManagement/gridClientCompanyProjectList.do")
		public ModelAndView gridClientCompanyProjectList(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String,Object>> clientCompanyProjectList= clientManagementService.gridClientCompanyProjectList(map.getMap());
			mv.addObject("rows", clientCompanyProjectList);
			return mv;
		}
	
		
		
		
		
		
	/**
	 * 
	 * 
	 * 작업중
	 * 	
	 */
		
		@RequestMapping(value="/clientManagement/insertSalesStatus.do")
		public ModelAndView insertSaleseStatus(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.insertSalesStatus(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/deleteSalesStatus.do")
		public ModelAndView deleteProjectIssue(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.deleteSalesStatus(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/gridSalesStatus.do")
		public ModelAndView gridSaleseStatus(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridSalesStatus(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectIndividualHistory.do")
		public ModelAndView selectIndividualHistory(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.selectIndividualHistory(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectIndividualDetail.do")
		public ModelAndView selectIndividualDetail(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.selectIndividualDetail(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
		
	///////////////////////////////////////고객개인정보 view start///////////////////////////////////////////
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객개인정보 View 첫 페이지
		 */
		
		@RequestMapping(value="/clientManagement/viewClientIndividualInfoGate.do")
		public ModelAndView viewClientIndividualInfoGate(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/clientIndividualInfoGate");
			
			mv.addObject("customerId", map.get("customer_id"));
			mv.addObject("companyId", map.get("company_id"));
			mv.addObject("searchDetail", map.get("search_detail"));
			
			return mv;
		}
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객개인정보 상세 상세페이지, 왼쪽 고객 목록
		 */
		
		@RequestMapping(value="/clientManagement/viewClientIndividualInfoDetail.do")
		public ModelAndView viewClientIndividualInfoDetail(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/clientIndividualInfoListDetail");

			/*if(map.get("customerId") == null){
				map.put("customerId", map.get("customer_id"));
				map.put("companyId", map.get("company_id"));
				map.put("customerName", map.get("search_detail"));
			}
			
			List<Map<String,Object>> selectClientIndividualHistory= clientManagementService.selectClientIndividualHistoryList(map.getMap());
			mv.addObject("ClientIndividualHistory", selectClientIndividualHistory);*/
			
			map.getMap().put("MEMBER_ID_NUM", map.getMap().get("global_member_id"));
			if(map.get("customer_id") != null) {
				mv.addObject("territoryConfirm", adminDAO.selectTerritoryMemberList(map.getMap()).size() > 0 ? 1 : 0);
			}
			
			mv.addObject("customerId", map.get("customer_id"));
			mv.addObject("companyId", map.get("company_id"));
			mv.addObject("searchDetail", map.get("search_detail"));
			
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectClientIndividualHistoryList.do")
		public ModelAndView selectClientIndividualHistoryList(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> selectClientIndividualHistory= clientManagementService.selectClientIndividualHistoryList(map.getMap());
			mv.addObject("ClientIndividualHistory", selectClientIndividualHistory);
			
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/searchIndividualHistory.do")
		public ModelAndView searchIndividualHistory(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> searchIndividualHistory = clientManagementService.searchIndividualHistory(map.getMap());
			String option = "";
			for(int i=0; i<searchIndividualHistory.size(); i++){
				if(searchIndividualHistory.size()-1 == i){
					option += searchIndividualHistory.get(i).get("CUSTOMER_ID") +":"+ searchIndividualHistory.get(i).get("COMPANY_NAME") + " " + searchIndividualHistory.get(i).get("DIVISION") + " " + searchIndividualHistory.get(i).get("CUSTOMER_NAME") + " " + searchIndividualHistory.get(i).get("POSITION");
				}else{
					option += searchIndividualHistory.get(i).get("CUSTOMER_ID") +":"+ searchIndividualHistory.get(i).get("COMPANY_NAME") + " " + searchIndividualHistory.get(i).get("DIVISION") + " " + searchIndividualHistory.get(i).get("CUSTOMER_NAME") + " " + searchIndividualHistory.get(i).get("POSITION") +";";
				}
			}
			
			mv.addObject("searchIndividualHistory", option);
			
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/insertIndividualHistory.do")
		public ModelAndView insertIndividualHistory(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.insertIndividualHistory(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/deleteIndividualHistory.do")
		public ModelAndView deleteIndividualHistory(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.deleteIndividualHistory(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/updateClientIndividualUseYN.do")
		public ModelAndView updateClientIndividualUseYN(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.updateClientIndividualUseYN(map.getMap());
			mv.addObject("cnt", cnt);
			return mv;
		}
		
		
		/**
		 * @author 	: 욱
		 * @Date		: 2017. 03. 06.
		 * @explain	: 고객관리 -> 상세보기 -> 기본정보
		 */
		@RequestMapping(value="/clientManagement/selectCustomerInfo.do")
		public ModelAndView selectCustomerInfo(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("defaultInfo", clientManagementService.gridClientIndividualDetail(map.getMap()));
			mv.addObject("defaultPhoto", clientManagementService.clientIndividualPhotoList(map.getMap()));
			mv.addObject("imagePath", imagePath);
			return mv;
		}
		
		/**
		 * @author 	: 욱
		 * @Date		: 2017. 03. 06.
		 * @explain	: 고객관리 -> 상세보기 -> 개인정보
		 */
		@RequestMapping(value="/clientManagement/selectIndividualInfo.do")
		public ModelAndView selectIndividualInfo(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("defaultInfo", clientManagementService.gridClientIndividualDetail(map.getMap()));
			return mv;
		}
		
		/**
		 * @author 	: 준이
		 * @Date		: 2017. 03. 21.
		 * @explain	: 고객관리 -> 상세보기 -> 프로젝트관련이력
		 */
		@RequestMapping(value="/clientManagement/selectCustomerProjectMg.do")
		public ModelAndView selectCustomerProjectMg(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("salesList", clientManagementService.gridSalesStatus(map.getMap()));
			return mv;
		}
		
		/**
		 * @author 	: 욱
		 * @Date		: 2017. 03. 06.
		 * @explain	: 고객관리 -> 상세보기 -> 컨택이력
		 */
		@RequestMapping(value="/clientManagement/selectCustomerContact.do")
		public ModelAndView selectCustomerContact(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			map.put("searchCustomerId", map.get("customerId"));
			
			if (device.isMobile()) { // 모바일은 컨택리스트만 조회한다. 2017.06.14 
			    log.debug("******************************* selectCustomerContact");
			    map.put("searchCustomerId", map.get("customerId"));
			    
			    String listCount = String.valueOf(clientSalesActiveDAO.selectClientContactCount(map.getMap()).get("listCount"));
			    mv.addObject("totalCnt", listCount);
    			mv.addObject("clientContactList", clientSalesActiveDAO.selectClientContactList(map.getMap()));
    			
                log.debug("******************************* clientContact end");
			} else {
				//컨택이력 기존 쿼리 사용
    			String listCount = String.valueOf(clientSalesActiveDAO.selectClientContactCount(map.getMap()).get("listCount"));
    			//페이징이 먼저 실행 되어야 한다.
    			mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
    			mv.addObject("clientContact", clientSalesActiveDAO.selectClientContactList(map.getMap()));
    			
    			mv.addObject("individualContactHistory", clientManagementService.selectIndividualContactHistory(map.getMap()));
    			
    			//검색값 유지
    			mv.addObject("searchContactSubject",map.get("searchContactSubject"));
    			mv.addObject("searchReportName",map.get("searchReportName"));
    			mv.addObject("searchContactStartDate",map.get("searchContactStartDate"));
    			mv.addObject("searchContactEndDate",map.get("searchContactEndDate"));
    			mv.addObject("searchActionStatus",map.get("searchActionStatus"));
			}
			return mv;
		}
		
		/**
		 * @author 	: 욱
		 * @Date		: 2017. 03. 06.
		 * @explain	: 고객관리 -> 상세보기 -> 소속 고객정보
		 */
		@RequestMapping(value="/clientManagement/selectCustomerCompanyList.do")
		public ModelAndView selectCustomerCompanyList(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			map.put("companyId", map.get("companyId"));
			
			if(device.isMobile()){
				map.put("companyId", map.get("companyId"));
				mv.addObject("clientCompany",clientManagementDAO.gridCompanyClient(map.getMap()));
				mv.addObject("totalCnt", clientManagementDAO.selectCompanyClientCount(map.getMap()));
				mv.addObject("clientCompanyList", clientManagementService.gridCompanyClient(map.getMap()));
			}else{
				mv.addObject("clientCompany",clientManagementDAO.gridCompanyClient(map.getMap()));
				mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),clientManagementDAO.selectCompanyClientCount(map.getMap())));
				mv.addObject("clientCompanyList", clientManagementService.gridCompanyClient(map.getMap()));
			
			//검색값 유지
			mv.addObject("textSearchClient",map.getMap().get("textSearchClient"));
			}

			return mv;
		}

		/**
		 * @author 	: 욱
		 * @Date		: 2017. 03. 06.
		 * @explain	: 고객관리 -> 상세보기 -> 이전회사 정보
		 */
		@RequestMapping(value="/clientManagement/selectCustomerHistory.do")
		public ModelAndView selectCustomerHistory(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("individualHistory", clientManagementService.selectIndividualHistory(map.getMap()));
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 28.
		 * @explain : 고객사정보 -> 상세보기 -> 고객사정보
		 */
		@RequestMapping(value="/clientManagement/selectCompanyInfo.do")
		public ModelAndView selectCompanyInfo(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			mv.addObject("gridClientCompanyInfo", clientManagementService.gridClientCompanyInfoView3(map.getMap()));
			mv.addObject("companyOrganizationChart", clientManagementService.companyOrganizationChart(map.getMap()));
			mv.addObject("imagePath", imagePath);
									
			if (device.isMobile()) {
				String listCount = String.valueOf(clientManagementDAO.selectCompanyClientCount(map.getMap()));
				mv.addObject("totalCnt", listCount);
				mv.addObject("clientCompanyList", clientManagementService.gridCompanyClient(map.getMap()));
			}else{
				// IT 정보 추가
				//mv.addObject("clientCompanyItInfo", clientManagementDAO.selectClientItInfo(map.getMap()));

				// 소속 고객개인 리스트
				//페이징이 먼저 실행 되어야 한다.
				mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),clientManagementDAO.selectCompanyClientCount(map.getMap())));
				mv.addObject("clientCompanyList", clientManagementService.gridCompanyClient(map.getMap()));
			
				//검색값 유지
    			mv.addObject("textSearchClient",map.getMap().get("textSearchClient"));
			}
			
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 28.
		 * @explain : 고객사정보 -> 상세보기 -> 영업기회
		 */
		@RequestMapping(value="/clientManagement/selectCompanyOpp.do")
		public ModelAndView selectCompanyOpp(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			if(device.isMobile()){
				//기존소스
				//mv.addObject("listPaging", clientSalesActiveDAO.selectOpportunityCount(map.getMap()));
				
				//변경소스
				Map<String, Object> pageMap = clientSalesActiveDAO.selectOpportunityCount(map.getMap());
				//map.getMap().put("rowCount", pageMap.get("listCount"));
				
				mv.addObject("totalCnt", pageMap.get("listCount"));
				
				//기존소스
				mv.addObject("currentOpportunity", clientSalesActiveDAO.gridOpportunity(map.getMap()));
			}else{
			//영업기회 기존 쿼리 사용
			String listCount = String.valueOf(clientSalesActiveDAO.selectOpportunityCount(map.getMap()).get("listCount"));
			//페이징이 먼저 실행 되어야 한다.
			mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
			mv.addObject("currentOpportunity", clientSalesActiveDAO.gridOpportunity(map.getMap()));
			
			//검색값 유지
			mv.addObject("searchTitle",map.getMap().get("searchTitle"));
			mv.addObject("searchOwner",map.getMap().get("searchOwner"));
			mv.addObject("searchContractAmount",map.getMap().get("searchContractAmount"));
			mv.addObject("searchForecast",map.getMap().get("searchForecast"));
			mv.addObject("searchSalesCycle",map.getMap().get("searchSalesCycle"));
			mv.addObject("searchContractStartDate",map.getMap().get("searchContractStartDate"));
			mv.addObject("searchContractEndDate",map.getMap().get("searchContractEndDate"));
			}
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 28.
		 * @explain : 고객사정보 -> 상세보기 -> 고객이슈
		 */
		@RequestMapping(value="/clientManagement/selectCompanyIssue.do")
		public ModelAndView selectCompanyIssue(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			map.put("searchClientCompanyID", map.get("companyId"));
			if(device.isMobile()){
				String listCount = String.valueOf(clientSatisfactionDAO.selectIssueCount(map.getMap()).get("listCount"));
				//페이징이 먼저 실행 되어야 한다.
				//mv.addObject("listPaging", clientSatisfactionDAO.selectIssueCount(map.getMap()));
				mv.addObject("totalCnt", listCount);
				mv.addObject("clientIssue", clientSatisfactionDAO.selectClientIssueList(map.getMap()));
			}else{
				//이슈 기존 쿼리 사용
				String listCount = String.valueOf(clientSatisfactionDAO.selectIssueCount(map.getMap()).get("listCount"));
				//페이징이 먼저 실행 되어야 한다.
				mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
				mv.addObject("clientIssue", clientSatisfactionDAO.selectClientIssueList(map.getMap()));
				
				//검색값 유지
				mv.addObject("searchActionStatus",map.get("searchActionStatus"));
				mv.addObject("detailSearchStatus",map.get("detailSearchStatus"));
			}
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 28.
		 * @explain : 고객사정보 -> 상세보기 -> 컨택이력
		 */
		@RequestMapping(value="/clientManagement/selectCompanyContact.do")
		public ModelAndView selectCompanyContact(CommandMap map, Device device) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			map.put("searchCompany", map.get("companyId"));
			
			if(device.isMobile()){
				String listCount = String.valueOf(clientSalesActiveDAO.selectClientContactCount(map.getMap()).get("listCount"));
				mv.addObject("totalCnt", listCount);
				
				//mv.addObject("listPaging", clientSalesActiveDAO.selectClientContactCount(map.getMap()));
				mv.addObject("clientContactList", clientSalesActiveDAO.selectClientContactList(map.getMap()));
			}else{
				//컨택이력 기존 쿼리 사용
				String listCount = String.valueOf(clientSalesActiveDAO.selectClientContactCount(map.getMap()).get("listCount"));
				//페이징이 먼저 실행 되어야 한다.
				mv.addObject("listPaging", CommonUtils.pagingSum(map.getMap(),Integer.parseInt(listCount)));
				mv.addObject("clientContactList", clientSalesActiveDAO.selectClientContactList(map.getMap()));
				
				//검색값 유지
				mv.addObject("searchContactSubject",map.get("searchContactSubject"));
				mv.addObject("searchReportName",map.get("searchReportName"));
				mv.addObject("searchContactStartDate",map.get("searchContactStartDate"));
				mv.addObject("searchContactEndDate",map.get("searchContactEndDate"));
				mv.addObject("searchActionStatus",map.get("searchActionStatus"));
			}
			
			return mv;
		}
		
		/**
		 * @author  : 욱
		 * @date : 2017. 2. 28.
		 * @explain : 고객사정보 -> 상세보기 -> 첨부파일
		 */
		@RequestMapping(value="/clientManagement/selectCompanyFile.do")
		public ModelAndView selectCompanyFile(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			map.getMap().put("datatype", "json");
			mv.addObject("fileList", clientManagementService.selectClientCompanyFileList(map.getMap()));
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectClientCompanyFileList.do")
		public ModelAndView selectClientCompanyFileList(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> selectClientCompanyFileList= clientManagementService.selectClientCompanyFileList(map.getMap());
			mv.addObject("fileList", selectClientCompanyFileList);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/gridClientIndividualInfoList2.do")
		public ModelAndView gridClientIndividualInfoList2(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> gridClientIndividualInfo= clientManagementService.gridClientIndividualInfoList(map.getMap());
			mv.addObject("rows", gridClientIndividualInfo);
			return mv;
		}
		
		/**
		 * @author 	: 김진욱
		 * @Date		: 2016. 8. 03.
		 * @explain	: 고객관리 -> 고객개인정보 card view detail 왼쪽 리스트
		 */
		@RequestMapping(value="/clientManagement/selectClientIndividualInfoLeftList.do")
		public ModelAndView selectClientIndividualInfoLeftList(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> gridClientIndividualInfo= clientManagementService.gridClientIndividualInfoList(map.getMap());
			mv.addObject("rows", gridClientIndividualInfo);
			return mv;
		}
		
	///////////////////////////////////////고객개인정보 view end/////////////////////////////////////////////
		
		
		
		//EX//
		@RequestMapping(value="/clientManagement/testList.do")
		public ModelAndView listClientIndividualInfo2(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/test1");
//			Map<String,Object> searchDetailGroup = clientManagementService.clientIndividualInfoSearchDetailGroup(map.getMap());
//			mv.addObject("searchDetailGroup", searchDetailGroup);
			return mv;
		}
		 
		@RequestMapping(value="/clientManagement/testListDedatil.do")
		public ModelAndView listClientIndividualInfo3(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/test2");
//			Map<String,Object> searchDetailGroup = clientManagementService.clientIndividualInfoSearchDetailGroup(map.getMap());
//			mv.addObject("searchDetailGroup", searchDetailGroup);
			return mv;
		}
	
		
		
		
	///////////////////////////////////////고객사정보 view start////////////////////////////////////////////
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객사정보 첫 페이지
		 */
		
		@RequestMapping(value="/clientManagement/viewClientCompanyInfoGate.do")
		public ModelAndView viewClientCompanyGate(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/clientCompanyInfoGate");
			Map<String,Object> searchDetailGroup = clientManagementService.clientCompanyInfoViewSearchDetailGroup(map.getMap());
			mv.addObject("searchDetailGroup", searchDetailGroup);
			return mv;
		}
	
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 7. 17.
		 * @explain	: 고객관리 -> 고객사정보 관리 그리드
		 */
		@RequestMapping(value="/clientManagement/gridClientCompanyInfoView.do")
		public ModelAndView gridClientCompanyInfoView(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String,Object>> gridClientCompanyInfo= clientManagementService.gridClientCompanyInfoView(map.getMap());
			mv.addObject("rows", gridClientCompanyInfo);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/gridClientCompanyInfoView2.do")
		public ModelAndView gridClientCompanyInfoView2(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String,Object>> gridClientCompanyInfo= clientManagementService.gridClientCompanyInfoView2(map.getMap());
			mv.addObject("rows", gridClientCompanyInfo);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/selectClientCompanySearchList.do")
		public ModelAndView selectClientCompanySearchList(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			List<Map<String,Object>> gridClientIndividualInfo= clientManagementService.gridClientCompanyInfoView(map.getMap());
			mv.addObject("rows", gridClientIndividualInfo);
			return mv;
		}
		
		@RequestMapping(value="/clientManagement/viewClientCompanyInfoDetail.do")
		public ModelAndView viewClientCompanyInfoDetail(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("/clientManagement/clientCompanyInfoDetail");
			//mv.addObject("customerId", map.get("customer_id"));
			
			map.getMap().put("MEMBER_ID_NUM", map.getMap().get("global_member_id"));
			if(map.get("company_id") != null) {
				mv.addObject("territoryConfirm", adminDAO.selectTerritoryMemberList(map.getMap()).size() > 0 ? 1 : 0);
			}
			mv.addObject("companyId", map.get("company_id"));
			mv.addObject("searchDetail", map.get("searchDetail"));
			return mv;
		}

		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 소속고객정보 그리그
		 */
		@RequestMapping(value="/clientManagement/gridCompanyClient.do")
		public ModelAndView gridCompanyClient(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridCompanyClient(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
	
	
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 진행중인 영업활동(영업기회) 그리드
		 */
		@RequestMapping(value="/clientManagement/gridCurrentOpportunity.do")
		public ModelAndView gridCurrentOpportunity(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridCurrentOpportunity(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
	
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 진행중인 영업활동(고객이슈) 그리드
		 */
		/*
		@RequestMapping(value="/clientManagement/gridClientIssueView.do")
		public ModelAndView gridClientIssueView(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridClientIssueView(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
	*/
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 진행중인 영업활동(서비스프로젝트) 그리드
		 */
		@RequestMapping(value="/clientManagement/gridServiceProject.do")
		public ModelAndView gridServiceProject(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridServiceProject(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
	
	
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 진행중인 영업활동(고객컨택) 그리드 : 고객개인정보 보기에서 호출
		 */
		@RequestMapping(value="/clientManagement/gridClientContactView.do")
		public ModelAndView gridClientContactView(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridClientContactView(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
		
		/**
		 * @author 	: 장성훈
		 * @Date		: 2016. 6. 7.
		 * @explain	: 고객관리 -> 고객사정보 view _ 진행중인 영업활동(고객컨택) 그리드 : 고객개인정보 보기에서 호출
		 */
		@RequestMapping(value="/clientManagement/gridClientContactView2.do")
		public ModelAndView gridClientContactView2(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			List<Map<String, Object>> list = clientManagementService.gridClientContactView2(map.getMap());
			mv.addObject("rows", list);
			return mv;
		}
	
	///////////////////////////////////////고객사정보 View end///////////////////////////////////////////////
	
	
		
	
		/**
		 * @author 	: 준이
		 * @Date		: 2017. 03. 20.
		 * @explain	: 고객사 및 고객개인정보 -> 고객사정보 상세보기 -> 영업기회 바로가기 링크 전 권한 확인(공통(common)으로 빼야 되나?)
		 */
		@RequestMapping(value="/clientManagement/selectRoleCheck.do")
		public ModelAndView selectRoleCheck(CommandMap map) throws Exception{
			ModelAndView mv = new ModelAndView();
			if(map.get("datatype").equals("html")){
				log.info((String)map.get("jsp"));
				mv.setViewName((String)map.get("jsp"));
			}else{
				mv.setViewName("jsonView");
			}
			
			int cnt = clientManagementService.selectRoleCheck(map.getMap());
			mv.addObject("cnt", cnt);
			
			return mv;
		}
		
        /**
         * @author  : 민성기
         * @Date    : 2017. 6. 14.
         * @explain : 고객사 및 고객개인정보 -> 고객 등록/수정 폼으로 이동
         */
        @RequestMapping(value="/clientManagement/clientIndividualInsertForm.do")
        public ModelAndView clientIndividualInsertForm(CommandMap map, HttpServletRequest request) throws Exception{
            ModelAndView mv = new ModelAndView("clientManagement/clientIndividualInsertForm");
            mv.addObject("mode", map.get("mode"));
            mv.addObject("pkNo", map.get("pkNo"));
            return mv;
        }   
		
	

    	//테리토리
    	@RequestMapping(value="/clientManagement/infoMemberManage.do")
    	public ModelAndView infoMemberManage(CommandMap map) throws Exception{
    		ModelAndView mv = new ModelAndView();
    		if(map.get("datatype").equals("html")){
    			log.info((String)map.get("jsp"));
    			mv.setViewName((String)map.get("jsp"));
    		}else{
    			mv.setViewName("jsonView");
    		}
    		List<Map<String,Object>> selelctAllInfoDivisionList = adminService.selelctAllInfoDivisionList(map.getMap());
    		List<Map<String,Object>> selelctAllInfoTeamList = adminService.selelctInfoTeamList(map.getMap());
    		mv.addObject("selelctAllInfoDivisionList", selelctAllInfoDivisionList);
    		mv.addObject("selelctAllInfoTeamList", selelctAllInfoTeamList);
    		return mv;
    	}
    	
	/*@RequestMapping(value="/clientManagement/gridPartnerSales.do")
	public ModelAndView gridProjectMGMT(CommandMap map) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String,Object>> gridProjectMGMT= clientManagementService.gridProjectMGMT(map.getMap());
		mv.addObject("rows", gridProjectMGMT);
		return mv;
	}*/
	
	////////////////////////////////////////파트너영업 end ////////////////////////////////////////////////
}