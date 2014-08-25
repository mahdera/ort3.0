/**
 * 
 */
package com.signetitsolutions.ort.server.classes;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.sql.Date;
/**
 * @author Mahder on macbook Pro
 *
 */
public class AppealToOrganizationHead {
	private long reportInputFormId;
	private int numberOfAppeal;
	private int numberOfRequestRejectedByPR;
	private int numberOfRequestApprovedByPR;
	private int numberOfRequestImprovedByPR;
	private int numberOfDecisionInProgress;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public AppealToOrganizationHead() {
	}
	
	
	
	/**
	 * @param reportInputFormId
	 * @param numberOfAppeal
	 * @param numberOfRequestRejectedByPR
	 * @param numberOfRequestApprovedByPR
	 * @param numberOfRequestImprovedByPR
	 * @param numberOfDecisionInProgress
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public AppealToOrganizationHead(long reportInputFormId, int numberOfAppeal,
			int numberOfRequestRejectedByPR, int numberOfRequestApprovedByPR,
			int numberOfRequestImprovedByPR, int numberOfDecisionInProgress,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.numberOfAppeal = numberOfAppeal;
		this.numberOfRequestRejectedByPR = numberOfRequestRejectedByPR;
		this.numberOfRequestApprovedByPR = numberOfRequestApprovedByPR;
		this.numberOfRequestImprovedByPR = numberOfRequestImprovedByPR;
		this.numberOfDecisionInProgress = numberOfDecisionInProgress;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}



	/**
	 * @return the reportInputFormId
	 */
	public long getReportInputFormId() {
		return reportInputFormId;
	}
	/**
	 * @param reportInputFormId the reportInputFormId to set
	 */
	public void setReportInputFormId(long reportInputFormId) {
		this.reportInputFormId = reportInputFormId;
	}
	/**
	 * @return the numberOfAppeal
	 */
	public int getNumberOfAppeal() {
		return numberOfAppeal;
	}
	/**
	 * @param numberOfAppeal the numberOfAppeal to set
	 */
	public void setNumberOfAppeal(int numberOfAppeal) {
		this.numberOfAppeal = numberOfAppeal;
	}
	/**
	 * @return the numberOfRequestRejectedByPR
	 */
	public int getNumberOfRequestRejectedByPR() {
		return numberOfRequestRejectedByPR;
	}
	/**
	 * @param numberOfRequestRejectedByPR the numberOfRequestRejectedByPR to set
	 */
	public void setNumberOfRequestRejectedByPR(int numberOfRequestRejectedByPR) {
		this.numberOfRequestRejectedByPR = numberOfRequestRejectedByPR;
	}
	/**
	 * @return the numberOfRequestApprovedByPR
	 */
	public int getNumberOfRequestApprovedByPR() {
		return numberOfRequestApprovedByPR;
	}
	/**
	 * @param numberOfRequestApprovedByPR the numberOfRequestApprovedByPR to set
	 */
	public void setNumberOfRequestApprovedByPR(int numberOfRequestApprovedByPR) {
		this.numberOfRequestApprovedByPR = numberOfRequestApprovedByPR;
	}
	/**
	 * @return the numberOfRequestImprovedByPR
	 */
	public int getNumberOfRequestImprovedByPR() {
		return numberOfRequestImprovedByPR;
	}
	/**
	 * @param numberOfRequestImprovedByPR the numberOfRequestImprovedByPR to set
	 */
	public void setNumberOfRequestImprovedByPR(int numberOfRequestImprovedByPR) {
		this.numberOfRequestImprovedByPR = numberOfRequestImprovedByPR;
	}
	/**
	 * @return the numberOfDecisionInProgress
	 */
	public int getNumberOfDecisionInProgress() {
		return numberOfDecisionInProgress;
	}
	/**
	 * @param numberOfDecisionInProgress the numberOfDecisionInProgress to set
	 */
	public void setNumberOfDecisionInProgress(int numberOfDecisionInProgress) {
		this.numberOfDecisionInProgress = numberOfDecisionInProgress;
	}
	
	
	
	/**
	 * @return the modifiedBy
	 */
	public int getModifiedBy() {
		return modifiedBy;
	}



	/**
	 * @param modifiedBy the modifiedBy to set
	 */
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}



	/**
	 * @return the modificationDate
	 */
	public Date getModificationDate() {
		return modificationDate;
	}



	/**
	 * @param modificationDate the modificationDate to set
	 */
	public void setModificationDate(Date modificationDate) {
		this.modificationDate = modificationDate;
	}



	public void save(){
		try {
			String sqlStr = "insert into tbl_appeal_to_organization_head values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getNumberOfAppeal());
			pStmt.setInt(3, this.getNumberOfRequestRejectedByPR());
			pStmt.setInt(4, this.getNumberOfRequestApprovedByPR());
			pStmt.setInt(5, this.getNumberOfRequestImprovedByPR());
			pStmt.setInt(6, this.getNumberOfDecisionInProgress());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(AppealToOrganizationHead appealToOrganizationHead){
		try {
			String sqlStr = "update tbl_appeal_to_organization_head set number_of_appeal = ?,"+
		"number_of_request_rejected_by_pr = ?, number_of_request_approved_by_pr = ?,"+
		"number_of_request_improved_by_pr = ?, number_of_decision_in_progress = ?, "+
		"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, appealToOrganizationHead.getNumberOfAppeal());
			pStmt.setInt(2, appealToOrganizationHead.getNumberOfRequestRejectedByPR());
			pStmt.setInt(3, appealToOrganizationHead.getNumberOfRequestApprovedByPR());
			pStmt.setInt(4, appealToOrganizationHead.getNumberOfRequestImprovedByPR());
			pStmt.setInt(5, appealToOrganizationHead.getNumberOfDecisionInProgress());
			pStmt.setInt(6, appealToOrganizationHead.getModifiedBy());
			pStmt.setDate(7, appealToOrganizationHead.getModificationDate());
			pStmt.setLong(8, appealToOrganizationHead.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_appeal_to_organization_head where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<AppealToOrganizationHead> getAllAppealToOrganizationHeads(){
		List<AppealToOrganizationHead> list = new ArrayList<AppealToOrganizationHead>();
		AppealToOrganizationHead appealToOrganizationHead = null;
		try {
			String query = "select * from tbl_appeal_to_organization_head";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToOrganizationHead = new AppealToOrganizationHead(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_appeal"), 
						rSet.getInt("number_of_request_rejected_by_pr"), rSet.getInt("number_of_request_approved_by_pr"), rSet.getInt("number_of_request_improved_by_pr"), 
						rSet.getInt("number_of_decision_in_progress"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));
				list.add(appealToOrganizationHead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static AppealToOrganizationHead getAppealToOrganizationHead(long reportInputFormId){
		AppealToOrganizationHead appealToOrganizationHead = null;
		try {
			String query = "select * from tbl_appeal_to_organization_head where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToOrganizationHead = new AppealToOrganizationHead(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_appeal"), 
						rSet.getInt("number_of_request_rejected_by_pr"), rSet.getInt("number_of_request_approved_by_pr"), rSet.getInt("number_of_request_improved_by_pr"), 
						rSet.getInt("number_of_decision_in_progress"),rSet.getInt("modified_by"),
						rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return appealToOrganizationHead;
	}
}//end class
