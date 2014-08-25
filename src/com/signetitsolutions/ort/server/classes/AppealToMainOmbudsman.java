/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 *
 */
public class AppealToMainOmbudsman {
	private long reportInputFormId;
	private int numberOfAppeal;
	private int numberOfRequestRejectedByHead;
	private int numberOfRequestApprovedByHead;
	private int numberOfRequestImprovedByHead;
	private int numberOfDecisionInProgress;
	private int modifiedBy;
	private Date modificationDate;
	
	
	
	/**
	 * @param reportInputFormId
	 * @param numberOfAppeal
	 * @param numberOfRequestRejectedByHead
	 * @param numberOfRequestApprovedByHead
	 * @param numberOfRequestImprovedByHead
	 * @param numberOfDecisionInProgress
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public AppealToMainOmbudsman(long reportInputFormId, int numberOfAppeal,
			int numberOfRequestRejectedByHead,
			int numberOfRequestApprovedByHead,
			int numberOfRequestImprovedByHead, int numberOfDecisionInProgress,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.numberOfAppeal = numberOfAppeal;
		this.numberOfRequestRejectedByHead = numberOfRequestRejectedByHead;
		this.numberOfRequestApprovedByHead = numberOfRequestApprovedByHead;
		this.numberOfRequestImprovedByHead = numberOfRequestImprovedByHead;
		this.numberOfDecisionInProgress = numberOfDecisionInProgress;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * 
	 */
	public AppealToMainOmbudsman() {
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
	 * @return the numberOfRequestRejectedByHead
	 */
	public int getNumberOfRequestRejectedByHead() {
		return numberOfRequestRejectedByHead;
	}
	/**
	 * @param numberOfRequestRejectedByHead the numberOfRequestRejectedByHead to set
	 */
	public void setNumberOfRequestRejectedByHead(int numberOfRequestRejectedByHead) {
		this.numberOfRequestRejectedByHead = numberOfRequestRejectedByHead;
	}
	/**
	 * @return the numberOfRequestApprovedByHead
	 */
	public int getNumberOfRequestApprovedByHead() {
		return numberOfRequestApprovedByHead;
	}
	/**
	 * @param numberOfRequestApprovedByHead the numberOfRequestApprovedByHead to set
	 */
	public void setNumberOfRequestApprovedByHead(int numberOfRequestApprovedByHead) {
		this.numberOfRequestApprovedByHead = numberOfRequestApprovedByHead;
	}
	/**
	 * @return the numberOfRequestImprovedByHead
	 */
	public int getNumberOfRequestImprovedByHead() {
		return numberOfRequestImprovedByHead;
	}
	/**
	 * @param numberOfRequestImprovedByHead the numberOfRequestImprovedByHead to set
	 */
	public void setNumberOfRequestImprovedByHead(int numberOfRequestImprovedByHead) {
		this.numberOfRequestImprovedByHead = numberOfRequestImprovedByHead;
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
			String sqlStr = "insert into tbl_appeal_to_main_ombudsman values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getNumberOfAppeal());
			pStmt.setInt(3, this.getNumberOfRequestRejectedByHead());
			pStmt.setInt(4, this.getNumberOfRequestApprovedByHead());
			pStmt.setInt(5, this.getNumberOfRequestImprovedByHead());
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
	
	public static void update(AppealToMainOmbudsman appealToMainOmbudsman){
		try {
			String sqlStr = "update tbl_appeal_to_main_ombudsman set number_of_appeal = ?," +
					"number_of_request_rejected_by_head = ?," +
					"number_of_request_approved_by_head = ?," +
					"number_of_request_improved_by_head = ?," +
					"number_of_decision_in_progress = ?," +
					"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, appealToMainOmbudsman.getNumberOfAppeal());
			pStmt.setInt(2, appealToMainOmbudsman.getNumberOfRequestRejectedByHead());
			pStmt.setInt(3, appealToMainOmbudsman.getNumberOfRequestApprovedByHead());
			pStmt.setInt(4, appealToMainOmbudsman.getNumberOfRequestImprovedByHead());
			pStmt.setInt(5, appealToMainOmbudsman.getNumberOfDecisionInProgress());
			pStmt.setInt(6, appealToMainOmbudsman.getModifiedBy());
			pStmt.setDate(7, appealToMainOmbudsman.getModificationDate());
			pStmt.setLong(8, appealToMainOmbudsman.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_appeal_to_main_ombudsman where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<AppealToMainOmbudsman> getAllAppealToMainOmbudsmans(){
		List<AppealToMainOmbudsman> list = new ArrayList<AppealToMainOmbudsman>();
		AppealToMainOmbudsman appealToMainOmbudsman = null;
		try {
			String query = "select * from tbl_appeal_to_main_ombudsman";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToMainOmbudsman = new AppealToMainOmbudsman(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_appeal"), 
						rSet.getInt("number_of_request_rejected_by_head"), rSet.getInt("number_of_request_approved_by_head"), 
						rSet.getInt("number_of_request_improved_by_head"), rSet.getInt("number_of_decision_in_progress"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(appealToMainOmbudsman);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static AppealToMainOmbudsman getAppealToMainOmbudsman(long reportInputFormId){
		AppealToMainOmbudsman appealToMainOmbudsman = null;
		try {
			String query = "select * from tbl_appeal_to_main_ombudsman where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToMainOmbudsman = new AppealToMainOmbudsman(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_appeal"), 
						rSet.getInt("number_of_request_rejected_by_head"), rSet.getInt("number_of_request_approved_by_head"), 
						rSet.getInt("number_of_request_improved_by_head"), rSet.getInt("number_of_decision_in_progress"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return appealToMainOmbudsman;
	}
}//end class
