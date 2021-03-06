package com.uni.sellers.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.uni.sellers.datasource.AbstractDAO;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public int insertSendQ(Map<String, Object> map) throws Exception{
		return (int)insert("common.insertSendQ", map);
	}


	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginProccess(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.selectLoginProccess", map);
	}

	@SuppressWarnings("unchecked")
	public String selectLatelyUpdate(Map<String, Object> map) throws Exception{
		return (String)selectOne("common.selectLatelyUpdate", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAuthority(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectAuthority", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCompanyGroup() throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectCompanyGroup");
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchCompanyInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchCompanyInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchCustomerInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchCustomerInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchClientInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchClientInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchClientMaster(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchClientMaster", map);
	}

	//???????????? ??????
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchMemberInfo", map);
	}

	//???????????? ?????? ?????? ??????..
	@SuppressWarnings("unchecked")
	public Map<String, Object> searchMemberInfo2(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.searchMemberInfo2", map);
	}

	//???????????? ?????? insert
	//?????????????????????, PK, ????????????, ????????????
	@SuppressWarnings("unchecked")
	public int insertEmailShareLog(String tableName, int pkNo, String fromMemberId, String toMemberId) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reference_table_name",tableName);
		map.put("reference_id", pkNo);
		map.put("from_member_id", fromMemberId);
		map.put("to_member_id", toMemberId);
		return (int)insert("common.insertEmailShareLog", map);
	}


	//????????? ?????? ?????? ??????
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchCalendarMemberInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchCalendarMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInviteMemberInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectInviteMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchPartnerInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchPartnerInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchPartnerMemberInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchPartnerMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchInviteMemberInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchInviteMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPartnerInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectPartnerInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}

	@SuppressWarnings("unchecked")
	public int insertFile(Map<String, Object> map) throws Exception{
		return (int)insert("common.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public int deleteFile(Map<String, Object> map) throws Exception{
		return (int)delete("common.deleteFile", map);
	}

	@SuppressWarnings("unchecked")
	public int insertNotice(Map<String, Object> map) throws Exception{
		return (int)insert("common.insertNotice", map);
	}

	@SuppressWarnings("unchecked")
	public int selectNoticeCount(Map<String, Object> map) throws Exception{
		return (int)selectOne("common.selectNoticeCount", map);
	}
	
	@SuppressWarnings("unchecked")
	@Cacheable("commonCache")
	public List<Map<String, Object>> searchProductInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.searchProductInfo", map);
	}

	@SuppressWarnings("unchecked")
	@Cacheable("commonCache")
	public List<Map<String, Object>> selectCalendarAlarmInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectCalendarAlarmInfo", map);
	}

	@SuppressWarnings("unchecked")
	public int insertShareCalendarNotice(Map<String, Object> map) throws Exception{
		return (int)insert("common.insertShareCalendarNotice", map);
	}

	@SuppressWarnings("unchecked")
	public int updateNotice(Map<String, Object> map) throws Exception{
		return (int)update("common.updateNotice", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateProductividyRRuleEvent(Map<String, Object> map) throws Exception{
		return (int)update("common.updateProductividyRRuleEvent", map);
	}

	//????????? ?????? ????????? URL ??????
	@SuppressWarnings("unchecked")
	public  List<Map<String, Object>> selectRolesAndUrl() throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectRolesAndUrl");
	}

	@SuppressWarnings("unchecked")
	public int updatePassword(Map<String, Object> map) throws Exception{
		return (int)update("common.updatePassword", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeDetail(Map<String, Object> map) throws Exception{
		//update("common.updateNoticeConfirm", map);
		return (List<Map<String, Object>>)selectList("common.selectNoticeDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCalendarShareTable(Map<String, Object> map) throws Exception{
		//update("common.updateNoticeConfirm", map);
		return (List<Map<String, Object>>)selectList("common.selectCalendarShareTable", map);
	}

	@SuppressWarnings("unchecked")
	public int updateNoticeDetail(Map<String, Object> map) throws Exception{
		return (int)update("common.updateNoticeConfirm", map);
	}

	//Menu
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMenu(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectMenu", map);
	}
	//?????????... ?????? ?????? ????????????
	@SuppressWarnings("unchecked")
	public void updateFile(Map<String, Object> map) throws Exception{
		update("common.updateFile", map);
	}
	//?????????
	@SuppressWarnings("unchecked")
	public int deletePhoto(Map<String, Object> map) throws Exception{
		return (int)delete("common.deletePhoto", map);
	}
	
	@SuppressWarnings("unchecked")
	public void deleteNoticeDetail(Map<String, Object> map) throws Exception{
		delete("common.deleteNoticeDetail", map);
	}

	//Schedule(?????????)
	@SuppressWarnings("unchecked")
	public int callFaceTime(String currentDate) throws Exception{
		return (int)update("common.callFaceTime", currentDate);
	}

	//????????? ???????????? insert
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductividyRRuleEvent(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectProductividyRRuleEvent", map);
	}
	
	//Schedule(????????????)
	@SuppressWarnings("unchecked")
	public int callOpportunity() throws Exception{
		return (int)update("common.callOpportunity", null);
	}

	//????????? ?????? ????????????
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProductList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectProductList", map);
	}
	
	//????????? ??????
	@SuppressWarnings("unchecked")
	public int insertCoachingTalk(Map<String, Object> map) throws Exception{
		return (int)insert("common.insertCoachingTalk", map);
	}
	
	//????????? ??????
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCoachingTalk(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.selectCoachingTalk", map);
	}
	
	//????????? ????????????
	public void insertLoginHistory(Map<String, Object> map){
		insert("common.insertLoginHistory", map);
	}
	
	//???????????? ????????????
	public void updateLogoutHistory(Map<String, Object> map){
		update("common.updateLogoutHistory", map);
	}
	
	//????????? ?????? ??????
	public void insertPageContatct(Map<String, Object> map){
		insert("common.insertPageContatct", map);
	}
	
	//ERP Proejct ?????? ??????
	public void callErpDashboardCheckList(){
		update("common.callErpDashboardCheckList", null);
	}
	
	//???????????? sales cycle update
	public void callUpdateOpportunitySalesCycle(){
		update("common.callUpdateOpportunitySalesCycle", null);
	}
	
	//SLECT 1 ??????
	public void select1(){
		selectOne("common.select1", null);
	}
	
	//???????????? ?????? ??? ?????????
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reloadFile(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("common.reloadFile", map);
	}
	
	//
	@SuppressWarnings("unchecked")
	public int selectUserPageRowCount(Map<String, Object> map) throws Exception{
		return (int)selectOne("common.selectUserPageRowCount", map);
	}
	
	//????????? ???????????? ????????? ??????
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberFaceTime(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("common.selectMemberFaceTime", map);
	}
	
	//?????????  ????????? ?????????????????? ?????? 
	@SuppressWarnings("unchecked")
	public int updateMemberFaceTime(Map<String, Object> map) throws Exception{
		return (int)update("common.updateMemberFaceTime", map);
	}
	
	//????????? ????????? ??????
	@SuppressWarnings("unchecked")
	public int insertMemberFaceTime(Map<String, Object> map){
		return (int)insert("common.insertMemberFaceTime", map);
	}

	//?????????
	//???????????? ?????? ????????? ????????? ??????
	@SuppressWarnings("unchecked")
	public int deleteLogOutToken(Map<String, Object> map) throws Exception{
		return (int)delete("common.deleteLogOutToken", map);
	}
	
	@SuppressWarnings("unchecked")
	public int updateApkCnt(Map<String, Object> map) throws Exception{
		return (int)update("common.updateApkCnt", map);
	}}
