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
public class AppealToCourt {
	private long reportInputFormId;
	private int govBodyNumberOfDecisionRejectingPreviousDecision;
	private int govBodyNumberOfDecisionApprovingPreviousDecision;
	private int govBodyNumberOfDecisionImprovingPreviousDecision;
	private int infoRequesterNumberOfDecisionRejectingPreviousDecision;
	private int infoRequesterNumberOfDecisionApprovingPreviousDecision;
	private int infoRequesterNumberOfDecisionImprovingPreviousDecision;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * 
	 */
	public AppealToCourt() {
	}
	
	

	/**
	 * @param reportInputFormId
	 * @param govBodyNumberOfDecisionRejectingPreviousDecision
	 * @param govBodyNumberOfDecisionApprovingPreviousDecision
	 * @param govBodyNumberOfDecisionImprovingPreviousDecision
	 * @param infoRequesterNumberOfDecisionRejectingPreviousDecision
	 * @param infoRequesterNumberOfDecisionApprovingPreviousDecision
	 * @param infoRequesterNumberOfDecisionImprovingPreviousDecision
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public AppealToCourt(long reportInputFormId,
			int govBodyNumberOfDecisionRejectingPreviousDecision,
			int govBodyNumberOfDecisionApprovingPreviousDecision,
			int govBodyNumberOfDecisionImprovingPreviousDecision,
			int infoRequesterNumberOfDecisionRejectingPreviousDecision,
			int infoRequesterNumberOfDecisionApprovingPreviousDecision,
			int infoRequesterNumberOfDecisionImprovingPreviousDecision,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.govBodyNumberOfDecisionRejectingPreviousDecision = govBodyNumberOfDecisionRejectingPreviousDecision;
		this.govBodyNumberOfDecisionApprovingPreviousDecision = govBodyNumberOfDecisionApprovingPreviousDecision;
		this.govBodyNumberOfDecisionImprovingPreviousDecision = govBodyNumberOfDecisionImprovingPreviousDecision;
		this.infoRequesterNumberOfDecisionRejectingPreviousDecision = infoRequesterNumberOfDecisionRejectingPreviousDecision;
		this.infoRequesterNumberOfDecisionApprovingPreviousDecision = infoRequesterNumberOfDecisionApprovingPreviousDecision;
		this.infoRequesterNumberOfDecisionImprovingPreviousDecision = infoRequesterNumberOfDecisionImprovingPreviousDecision;
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
	 * @param reportInputFormId
	 *            the reportInputFormId to set
	 */
	public void setReportInputFormId(long reportInputFormId) {
		this.reportInputFormId = reportInputFormId;
	}

	/**
	 * @return the govBodyNumberOfDecisionRejectingPreviousDecision
	 */
	public int getGovBodyNumberOfDecisionRejectingPreviousDecision() {
		return govBodyNumberOfDecisionRejectingPreviousDecision;
	}

	/**
	 * @param govBodyNumberOfDecisionRejectingPreviousDecision
	 *            the govBodyNumberOfDecisionRejectingPreviousDecision to set
	 */
	public void setGovBodyNumberOfDecisionRejectingPreviousDecision(
			int govBodyNumberOfDecisionRejectingPreviousDecision) {
		this.govBodyNumberOfDecisionRejectingPreviousDecision = govBodyNumberOfDecisionRejectingPreviousDecision;
	}

	/**
	 * @return the govBodyNumberOfDecisionApprovingPreviousDecision
	 */
	public int getGovBodyNumberOfDecisionApprovingPreviousDecision() {
		return govBodyNumberOfDecisionApprovingPreviousDecision;
	}

	/**
	 * @param govBodyNumberOfDecisionApprovingPreviousDecision
	 *            the govBodyNumberOfDecisionApprovingPreviousDecision to set
	 */
	public void setGovBodyNumberOfDecisionApprovingPreviousDecision(
			int govBodyNumberOfDecisionApprovingPreviousDecision) {
		this.govBodyNumberOfDecisionApprovingPreviousDecision = govBodyNumberOfDecisionApprovingPreviousDecision;
	}

	/**
	 * @return the govBodyNumberOfDecisionImprovingPreviousDecision
	 */
	public int getGovBodyNumberOfDecisionImprovingPreviousDecision() {
		return govBodyNumberOfDecisionImprovingPreviousDecision;
	}

	/**
	 * @param govBodyNumberOfDecisionImprovingPreviousDecision
	 *            the govBodyNumberOfDecisionImprovingPreviousDecision to set
	 */
	public void setGovBodyNumberOfDecisionImprovingPreviousDecision(
			int govBodyNumberOfDecisionImprovingPreviousDecision) {
		this.govBodyNumberOfDecisionImprovingPreviousDecision = govBodyNumberOfDecisionImprovingPreviousDecision;
	}

	/**
	 * @return the infoRequesterNumberOfDecisionRejectingPreviousDecision
	 */
	public int getInfoRequesterNumberOfDecisionRejectingPreviousDecision() {
		return infoRequesterNumberOfDecisionRejectingPreviousDecision;
	}

	/**
	 * @param infoRequesterNumberOfDecisionRejectingPreviousDecision
	 *            the infoRequesterNumberOfDecisionRejectingPreviousDecision to
	 *            set
	 */
	public void setInfoRequesterNumberOfDecisionRejectingPreviousDecision(
			int infoRequesterNumberOfDecisionRejectingPreviousDecision) {
		this.infoRequesterNumberOfDecisionRejectingPreviousDecision = infoRequesterNumberOfDecisionRejectingPreviousDecision;
	}

	/**
	 * @return the infoRequesterNumberOfDecisionApprovingPreviousDecision
	 */
	public int getInfoRequesterNumberOfDecisionApprovingPreviousDecision() {
		return infoRequesterNumberOfDecisionApprovingPreviousDecision;
	}

	/**
	 * @param infoRequesterNumberOfDecisionApprovingPreviousDecision
	 *            the infoRequesterNumberOfDecisionApprovingPreviousDecision to
	 *            set
	 */
	public void setInfoRequesterNumberOfDecisionApprovingPreviousDecision(
			int infoRequesterNumberOfDecisionApprovingPreviousDecision) {
		this.infoRequesterNumberOfDecisionApprovingPreviousDecision = infoRequesterNumberOfDecisionApprovingPreviousDecision;
	}

	/**
	 * @return the infoRequesterNumberOfDecisionImprovingPreviousDecision
	 */
	public int getInfoRequesterNumberOfDecisionImprovingPreviousDecision() {
		return infoRequesterNumberOfDecisionImprovingPreviousDecision;
	}

	/**
	 * @param infoRequesterNumberOfDecisionImprovingPreviousDecision
	 *            the infoRequesterNumberOfDecisionImprovingPreviousDecision to
	 *            set
	 */
	public void setInfoRequesterNumberOfDecisionImprovingPreviousDecision(
			int infoRequesterNumberOfDecisionImprovingPreviousDecision) {
		this.infoRequesterNumberOfDecisionImprovingPreviousDecision = infoRequesterNumberOfDecisionImprovingPreviousDecision;
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



	public void save() {
		try {
			String sqlStr = "insert into tbl_appeal_to_court values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getGovBodyNumberOfDecisionRejectingPreviousDecision());
			pStmt.setInt(3, this.getGovBodyNumberOfDecisionApprovingPreviousDecision());
			pStmt.setInt(4, this.getGovBodyNumberOfDecisionImprovingPreviousDecision());
			pStmt.setInt(5, this.getInfoRequesterNumberOfDecisionRejectingPreviousDecision());
			pStmt.setInt(6, this.getInfoRequesterNumberOfDecisionApprovingPreviousDecision());
			pStmt.setInt(7, this.getInfoRequesterNumberOfDecisionImprovingPreviousDecision());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(AppealToCourt appealToCourt) {
		try {
			String sqlStr = "update tbl_appeal_to_court set gov_body_number_of_decision_rejecting_previous_decision = ?," +
					"gov_body_number_of_decision_approving_previous_decision = ?," +
					"gov_body_number_of_decision_improving_previous_decision = ?," +
					"info_requester_number_of_decision_rejecting_previous_decision = ?," +
					"info_requester_number_of_decision_approving_previous_decision = ?," +
					"info_requester_number_of_decision_improving_previous_decision = ?," +
					"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, appealToCourt.getGovBodyNumberOfDecisionRejectingPreviousDecision());
			pStmt.setInt(2, appealToCourt.getGovBodyNumberOfDecisionApprovingPreviousDecision());
			pStmt.setInt(3, appealToCourt.getGovBodyNumberOfDecisionImprovingPreviousDecision());
			pStmt.setInt(4, appealToCourt.getInfoRequesterNumberOfDecisionRejectingPreviousDecision());
			pStmt.setInt(5, appealToCourt.getInfoRequesterNumberOfDecisionApprovingPreviousDecision());
			pStmt.setInt(6, appealToCourt.getInfoRequesterNumberOfDecisionImprovingPreviousDecision());
			pStmt.setInt(7, appealToCourt.getModifiedBy());
			pStmt.setDate(8, appealToCourt.getModificationDate());
			pStmt.setLong(9, appealToCourt.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_appeal_to_court where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<AppealToCourt> getAllAppealToCourts() {
		List<AppealToCourt> list = new ArrayList<AppealToCourt>();
		AppealToCourt appealToCourt = null;
		try {
			String query = "select * from tbl_appeal_to_court";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToCourt = new AppealToCourt(rSet.getLong("report_input_form_id"), rSet.getInt("gov_body_number_of_decision_rejecting_previous_decision"), 
						rSet.getInt("gov_body_number_of_decision_approving_previous_decision"), rSet.getInt("gov_body_number_of_decision_improving_previous_decision"), 
						rSet.getInt("info_requester_number_of_decision_rejecting_previous_decision"), rSet.getInt("info_requester_number_of_decision_approving_previous_decision"), 
						rSet.getInt("info_requester_number_of_decision_improving_previous_decision"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(appealToCourt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static AppealToCourt getAppealToCourt(long reportInputFormId) {
		AppealToCourt appealToCourt = null;
		try {
			String query = "select * from tbl_appeal_to_court where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				appealToCourt = new AppealToCourt(rSet.getLong("report_input_form_id"), rSet.getInt("gov_body_number_of_decision_rejecting_previous_decision"), 
						rSet.getInt("gov_body_number_of_decision_approving_previous_decision"), rSet.getInt("gov_body_number_of_decision_improving_previous_decision"), 
						rSet.getInt("info_requester_number_of_decision_rejecting_previous_decision"), rSet.getInt("info_requester_number_of_decision_approving_previous_decision"), 
						rSet.getInt("info_requester_number_of_decision_improving_previous_decision"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return appealToCourt;
	}
}// end class
