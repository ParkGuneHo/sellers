package com.uni.sellers.clientsalesactive;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.uni.sellers.datasource.AbstractDAO;

@Repository("clientSalesActiveDAO")
public class ClientSalesActiveDAO extends AbstractDAO{

	//============================================고객컨택==============================================
	
	//일단 주석 2017 03 16 김진욱
	/*@SuppressWarnings("unchecked")
	public Map<String, Object> clientContactSearchDetailGroup(Map<String, Object> map) throws Exception{
		Map<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("event_category",selectList("clientSalesActive.clientContactSearchDetailGroup1", map));
		groupMap.put("company_name",selectList("clientSalesActive.clientContactSearchDetailGroup2", map));
		return groupMap;
	}*/
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectClientContactCount(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectClientContactCount", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectContactDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectContactDetail", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectContactFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectContactFileList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> clientContactFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.clientContactFileList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridContactActionItems(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridContactActionItems", map);
	}
	@SuppressWarnings("unchecked")
	public int insertClientContact(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertClientContact", map);
	}
	@SuppressWarnings("unchecked")
	public int updateClientContact(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateClientContact", map);
	}
	@SuppressWarnings("unchecked")
	public int deleteClientContact(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteClientContact", map);
	}
	@SuppressWarnings("unchecked")
	public int insertContactActionItem(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertContactActionItem", map);
	}
	@SuppressWarnings("unchecked")
	public int updateContactActionItem(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateContactActionItem", map);
	}
	@SuppressWarnings("unchecked")
	public int deleteContactActionItem(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteContactActionItem", map);
	}
	@SuppressWarnings("unchecked")
	public int insertHiddenOpportunity(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertHiddenOpportunity", map);
	}
	@SuppressWarnings("unchecked")
	public int insertHiddenOpportunityActionPlan(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertHiddenOpportunityActionPlan", map);
	}
	@SuppressWarnings("unchecked")
	public int insertContactFollowUpAction(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertContactFollowUpAction", map);
	}
	@SuppressWarnings("unchecked")
	public int updateContactFollowUpAction(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateContactFollowUpAction", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridActionPlanContact(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridActionPlanContact", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactDashBoardDivision(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactDashBoardDivision", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactDashBoardTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactDashBoardTeam", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactDashBoardMember(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactDashBoardMember", map);
	}
	
	//고객컨택 대시보드_고객사
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactDashBoardCompanyGroup(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactDashBoardCompanyGroup", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClientContactDashBoardComapny(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectClientContactDashBoardComapny", map);
	}


	
	
	
	//============================================잠재기회==============================================
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunity(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunity", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityActionStatus(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityActionStatus", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectHiddenOpportunityCount(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectHiddenOpportunityCount", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectHiddenOpportunityDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectHiddenOpportunityDetail", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityFileList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridActionPlanHiddenOpportunity(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridActionPlanHiddenOpportunity", map);
	}
	@SuppressWarnings("unchecked")
	public int updateHiddenOpportunity(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateHiddenOpportunity", map);
	}
	@SuppressWarnings("unchecked")
	public int updateHiddenOpportunityActionPlan(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateHiddenOpportunityActionPlan", map);
	}
	@SuppressWarnings("unchecked")
	public int deleteActionPlanHiddenOpportunity(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteActionPlanHiddenOpportunity", map);
	}
	
	
	
	//============================================영업기회==============================================
	@SuppressWarnings("unchecked")
	@Cacheable("commonCache")
	public Map<String, Object> opportunitySearchDetailGroup(Map<String, Object> map) throws Exception{
		Map<String, Object> groupMap = new HashMap<String, Object>();
		groupMap.put("code_project",selectList("common.selectCode_project", map));
		groupMap.put("code_tpso",selectList("common.selectCode_tpso", map));
		//groupMap.put("division_group",selectList("clientSalesActive.opportunitySearchDetailGroup3", map));
		return groupMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOpportunityCount(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectOpportunityCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public String selectOpportunityLatelyUpdate(Map<String, Object> map) throws Exception{
		return (String)selectOne("clientSalesActive.selectOpportunityLatelyUpdate", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridOpportunity(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridOpportunity", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOpportunityDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectOpportunityDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityFileList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityProductSalesList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityProductSalesList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityProductPsList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityProductPsList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunitySalesPlan(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunitySalesPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunitySalesPlanList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunitySalesPlanList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunitySalesSplitList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunitySalesSplitList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSalesPlanCount(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectSalesPlanCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> opportunityFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.opportunityFileList", map);
	}
	
	@SuppressWarnings("unchecked")
	public int saleCount(Map<String, Object> map) throws Exception{
		return (int)selectOne("clientSalesActive.saleCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public int saleCountOwner(Map<String, Object> map) throws Exception{
		return (int)selectOne("clientSalesActive.saleCountOwner", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunity(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunity", map);
	};
	
	@SuppressWarnings("unchecked")
	public int insertCheckList(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertCheckList", map);
	};
	
	@SuppressWarnings("unchecked")
	public int insertCheckListOwner(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertCheckListOwner", map);
	};
	
	@SuppressWarnings("unchecked")
	public int insertOpportunityMilestone(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunityMilestone", map); 
	};
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunityMilestone(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunityMilestone", map); 
	};
	
	@SuppressWarnings("unchecked")
	public int updateOpportunityMilestone(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.updateOpportunityMilestone", map); 
	};
	
	@SuppressWarnings("unchecked")
	public int updateOpportunity(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateOpportunity", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertHistoryOpportunity(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertHistoryOpportunity", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunity(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunity", map);
	}

	@SuppressWarnings("unchecked")
	public int insertOpportunitySalesPlan(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunitySalesPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunitySalesPlan(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunitySalesPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunitySalesSplit(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunitySalesSplit", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunitySalesSplit(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunitySalesSplit", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertSalesCycleActionPlan(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertSalesCycleActionPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertSalesCycleWinPlan(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertSalesCycleWinPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesCycleWinPlan(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.updateSalesCycleWinPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesCycleActionPlan(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateSalesCycleActionPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesCycleActionPlan(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteSalesCycleActionPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesCycleWinPlan(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteSalesCycleWinPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int completeSaleCycle(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.completeSaleCycle", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSaleCycleClose(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateSaleCycleClose", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesCycleStep(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateSalesCycleStep", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesCheckList(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateSalesCheckList", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesCheckList(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteSalesCheckList", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteSalesWinList(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteSalesWinList", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateClientMasterErpCd(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateClientMasterErpCd", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateSalesCheckListOwner(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateSalesCheckListOwner", map);
	}
	
	@SuppressWarnings("unchecked")
	public String selectClientMasterErpCd(Map<String, Object> map) throws Exception{
		return (String)selectOne("clientSalesActive.selectClientMasterErpCd", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityMilestons(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityMilestons", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridSalesCheckList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridSalesCheckList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridSalesCheckListOwner(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridSalesCheckListOwner", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridOpportunityCheckList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridOpportunityCheckList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> gridSalesCycleWinPlan(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.gridSalesCycleWinPlan", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunitySalesActual(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunitySalesActual", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunitySalesActual(int opportunity_id) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunitySalesActual", opportunity_id);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunityProductSales(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunityProductSales", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunityProductPs(Map<String, Object> map) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunityProductPs", map);
	}
	
	@SuppressWarnings("unchecked")
	public int deleteOpportunityProductSales(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunityProductSales", map);
	}

	@SuppressWarnings("unchecked")
	public int deleteOpportunityProductPs(Map<String, Object> map) throws Exception{
		return (int)delete("clientSalesActive.deleteOpportunityProductPs", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateOppKeyDeal(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateOppKeyDeal", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateOppSalesCycle(Map<String, Object> map) throws Exception{
		return (int)update("clientSalesActive.updateOppSalesCycle", map);
	}
	
	@SuppressWarnings("unchecked")
	public int insertOpportunityScCheck(ArrayList<HashMap<String, Object>> list) throws Exception{
		return (int)insert("clientSalesActive.insertOpportunityScCheck", list);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityScCheckList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityScCheckList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityMilestonesList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityMilestonesList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOpportunitySum(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("clientSalesActive.selectOpportunitySum", map);
	}
	
	//영업기회 임시저장 카운트
	@SuppressWarnings("unchecked")
	public int selectTempCountOpp(Map<String, Object> map) throws Exception{
		Integer temp_cnt = (Integer) selectOne("clientSalesActive.selectTempCountOpp", map);
		temp_cnt = (temp_cnt == null) ? 0 : temp_cnt;
		return temp_cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//영업기회 대시보드 _ 본부
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityDashBoardDivision(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityDashBoardDivision", map);
	}
	
	//영업기회 대시보드 _ 팀
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityDashBoardTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityDashBoardTeam", map);
	}
	
	//영업기회 대시보드 _ 직원
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityDashBoardMember(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityDashBoardMember", map);
	}
	
	//영업기회 대시보드_고객사
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityDashBoardCompanyGroup(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityDashBoardCompanyGroup", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOpportunityDashBoardComapny(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectOpportunityDashBoardComapny", map);
	}
	
	//잠재영업기회 대시보드 _ 본부
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityDashBoardDivision(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityDashBoardDivision", map);
	}
	//잠재영업기회 대시보드 _ 팀
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityDashBoardTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityDashBoardTeam", map);
	}
	
	//잠재영업기회 대시보드 _ 직원
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityDashBoardMember(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityDashBoardMember", map);
	}
	
	//잠재영업기회 대시보드 _ 고객
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityDashBoardCompanyGroup(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityDashBoardCompanyGroup", map);
	}
	//잠재영업기회 대시보드 _ 고객
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHiddenOpportunityDashBoardCompany(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("clientSalesActive.selectHiddenOpportunityDashBoardCompany", map);
	}
	//고객명 복수 입력
	@SuppressWarnings("unchecked")
	public int insertClientList(Map<String, Object> map) throws Exception{
		delete("clientSalesActive.deleteClientList", map);
		return (int)insert("clientSalesActive.insertClientList", map);
	}
	
}
