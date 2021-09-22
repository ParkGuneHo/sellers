package com.uni.sellers.clientmanagement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.uni.sellers.datasource.AbstractDAO;
import com.uni.sellers.datasource.CommandMap;

@Repository("clientManagementDAO")
public class ClientManagementDAO extends AbstractDAO{

	//=======================================고객개인정보 관리===============================================
	@SuppressWarnings("unchecked")
	public Map<String, Object> clientIndividualInfoSearchDetailGroup(Map<String, Object> map) throws Exception{
		Map<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("event_category",selectList("clientManagement.clientIndividualInfoSearchDetailGroup", map));
		/*groupMap.put("company_name",selectList("clientManagement.clientIndividualInfoSearchDetailGroup", map));*/
		return groupMap;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientIndividualInfoManage(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientIndividualInfoManage", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientIndividualInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientIndividualInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> clientIndividualPhotoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.clientIndividualPhotoList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientIndividualNameCard(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientIndividualNameCard", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTerritory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectTerritory", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientIndividualPhoto(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientIndividualPhoto", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientIndividualInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientIndividualInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteClientIndividualPhoto(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteIndividualPhoto", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateClientIndividualInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.updateClientIndividualInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertClientIndividualInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertClientIndividualInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteClientIndividualInfo(Map<String, Object> map) {
		return (int)delete("clientManagement.deleteClientIndividualInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertSalesStatus(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertSalesStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesStatus(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteSalesStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesStatus(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.updateSalesStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridSalesStatus(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridSalesStatus", map);
	}
	
	//=======================================고객사정보 관리===============================================
	@SuppressWarnings("unchecked")
	public Map<String, Object> clientCompanyInfoSearchDetailGroup(Map<String, Object> map) throws Exception{
		Map<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("event_category",selectList("clientManagement.clientCompanyInfoSearchDetailGroup", map));
		/*groupMap.put("company_name",selectList("clientManagement.clientIndividualInfoSearchDetailGroup", map));*/
		return groupMap;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientCompanyInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientCompanyInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateClientCompanyInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.updateClientCompanyInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertClientCompanyInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertClientCompanyInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertClientCompanyITInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertClientCompanyITInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertSalesTerritoryAlignMap(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertSalesTerritoryAlignMap", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesTerritoryAlignMap(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteSalesTerritoryAlignMap", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientCompanyOrganizationChart(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientCompanyOrganizationChart", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientCompanyInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientCompanyInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllIndustrySegmentCode(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectAllIndustrySegmentCode", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientCompanyProjectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientCompanyProjectList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientCompanyProjectListCount(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientCompanyProjectListCount", map);
	}
	
	////////////////////////////////////////////고객개인정보 view/////////////////////////////////////////
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientIndividualDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientIndividualDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientIndividualInfoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientIndividualInfoList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientIndividualInfoList2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientIndividualInfoList2", map);
	}
	
	////////////////////////////////////////////고객사정보 view///////////////////////////////////////////
	@SuppressWarnings("unchecked")
	public Map<String, Object> clientCompanyInfoViewSearchDetailGroup(Map<String, Object> map) throws Exception{
		Map<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("event_category",selectList("clientManagement.clientCompanyInfoSearchDetailGroup", map));
		/*groupMap.put("company_name",selectList("clientManagement.clientIndividualInfoSearchDetailGroup", map));*/
		return groupMap;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientCompanyInfoView(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientCompanyInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientCompanyInfoView2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientCompanyInfo2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientCompanyInfoView3(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientCompanyInfo3", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridCompanyClient(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridCompanyClient", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectCompanyClientCount(Map<String, Object> map) throws Exception{
		return (int)selectOne("clientManagement.selectCompanyClientCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> companyOrganizationChart(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.companyOrganizationChart", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridCurrentOpportunity(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridCurrentOpportunity", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridServiceProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridServiceProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientCompanyFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectClientCompanyFileList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientContactView(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientContactView", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridClientContactView2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.gridClientContactView2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientIndividualHistoryList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectClientIndividualHistoryList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIndividualHistory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectIndividualHistory", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIndividualContactHistory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectIndividualContactHistory", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchIndividualHistory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.searchIndividualHistory", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectIndividualDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectIndividualDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertIndividualHistory(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertIndividualHistory", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateIndividualHistory2(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateIndividualHistory2", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateIndividualHistory3(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateIndividualHistory3", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateClientIndividualUseYN(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateClientIndividualUseYN", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteIndividualAllHistory(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteIndividualAllHistory", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteIndividualHistory(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteIndividualHistory", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBeforeIndividualHistory(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectBeforeIndividualHistory", map);
	}
	
	
	
	
	//태원
	@SuppressWarnings("unchecked")
	public int slectClientCompanyMaxId(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.slectClientCompanyMaxId", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertSalesTerritoryAlignAllMap(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertSalesTerritoryAlignAllMap", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllMemberIdNum() throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectAllMemberIdNum");
	}
	
	@SuppressWarnings("unchecked")
	public int deleteClientCompanyProjectList(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteClientCompanyProjectList", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> 상세보기 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientCompanyProjectMg(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientCompanyProjectMg", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> 상세보기 ( 프로젝트 인원 ) 
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientCompanyProjectMgPerson(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectClientCompanyProjectMgPerson", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> insert 
	 */
	@SuppressWarnings("unchecked")
	public int insertClientCompanyProjectMg(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertClientCompanyProjectMg", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> update 
	 */
	@SuppressWarnings("unchecked")
	public int updateClientCompanyProjectMg(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateClientCompanyProjectMg", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> 프로젝트 인원 insert 
	 */
	@SuppressWarnings("unchecked")
	public int insertClientCompanyProjectMgPerson(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.insertClientCompanyProjectMgPerson", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 2. 27.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> 프로젝트 인원 update
	 */
	@SuppressWarnings("unchecked")
	public int updateClientCompanyProjectMgPerson(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateClientCompanyProjectMgPerson", map);
	}
	
	/**
	 * @author  : 욱이
	 * @date : 2017. 03. 06.
	 * @explain : 고객사정보 -> 프로젝트 관리 이력 -> 프로젝트 인원 delete
	 */
	@SuppressWarnings("unchecked")
	public int deleteClientCompanyProjectMgPerson(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteClientCompanyProjectMgPerson", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteClientCompanyProject(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteClientCompanyProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientCompanyProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectClientCompanyProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteClientCompanySeqProject(Map<String, Object> map) throws Exception{
		return (int)delete("clientManagement.deleteClientCompanySeqProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateClientIndividualSequenceInfo(Map<String, Object> map) throws Exception{
		return (int)insert("clientManagement.updateClientIndividualSequenceInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectClientCompanyCnt(Map<String, Object> map) throws Exception{
		return (int)selectOne("clientManagement.selectClientCompanyCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectClientIndividualCnt(Map<String, Object> map) throws Exception{
		return (int)selectOne("clientManagement.selectClientIndividualCnt", map);
	}

	/**
	 * @author  : 준이
	 * @date : 2017. 03. 20.
	 * @explain : 고객사정보 -> 영업기회탭 -> 리스트 클릭시 권한 조회
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRoleCheck(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientManagement.selectRoleCheck", map);
	}
	
	/**
	 * @author  : 심
	 * @date : 2018. 08. 31.
	 * @explain : 고객사정보 -> 영업기회탭 -> 리스트 클릭시 권한 조회
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientItInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientManagement.selectClientItInfo", map);
	}
	
	/**
	 * @author  : 현경
	 * @date : 2018. 09. 05.
	 * @explain 고객사정보 -> 정보수정 -> IT 정보 update
	 */
	@SuppressWarnings("unchecked")
	public int updateClientCompanyITInfo(Map<String, Object> map) throws Exception{
		return (int)update("clientManagement.updateClientCompanyITInfo", map);
	}
	
	/**
	 * @date : 2019. 11. 28.
	 * @explain 고객사정보 -> 고객사명 중복검사
	 */
	public int validateClient(Map<String, Object> map) throws Exception{
		return (int) selectOne("clientManagement.validateClient", map);
	}
}

