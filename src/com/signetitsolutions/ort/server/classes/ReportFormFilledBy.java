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
 * @author TOSHIBA
 *
 */
public class ReportFormFilledBy {
	private long reportInputFormId;
	private int prId;
	private int organizationId;
	private Date reportDate;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * @param reportInputFormId
	 * @param prId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ReportFormFilledBy(long reportInputFormId, int prId,int organizationId,Date filledOn,
			int modifiedBy,Date modificationDate) {
		super();
		this.reportInputFormId = reportInputFormId;
		this.prId = prId;
		this.organizationId = organizationId;
		this.reportDate = filledOn;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	
	
	
	/**
	 * @return the organizationId
	 */
	public int getOrganizationId() {
		return organizationId;
	}




	/**
	 * @param organizationId the organizationId to set
	 */
	public void setOrganizationId(int organizationId) {
		this.organizationId = organizationId;
	}




	/**
	 * @return the reportDate
	 */
	public Date getReportDate() {
		return reportDate;
	}


	/**
	 * @param reportDate the reportDate to set
	 */
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}


	/**
	 * @param reportInputFormId
	 * @param prId
	 * @param reportDate
	 */
	public ReportFormFilledBy(long reportInputFormId, int prId, Date reportDate) {
		this.reportInputFormId = reportInputFormId;
		this.prId = prId;
		this.reportDate = reportDate;
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
	 * @return the prId
	 */
	public int getPrId() {
		return prId;
	}
	/**
	 * @param prId the prId to set
	 */
	public void setPrId(int prId) {
		this.prId = prId;
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
			String sqlStr = "insert into tbl_report_form_filled_by values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getPrId());
			pStmt.setInt(3, this.getOrganizationId());
			pStmt.setDate(4, this.getReportDate());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ReportFormFilledBy reportFormFilledBy){
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId,int prId){
		try {
			String sqlStr = "delete from tbl_report_form_filled_by where report_input_form_id = ? and "+
			"pr_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			pStmt.setInt(2, prId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ReportFormFilledBy> getallReportFormFilledBies(){
		List<ReportFormFilledBy> list = new ArrayList<ReportFormFilledBy>();
		ReportFormFilledBy reportFormFilledBy = null;
		try {
			String query = "select * from tbl_report_form_filled_by";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportFormFilledBy = new ReportFormFilledBy(rSet.getLong("report_input_form_id"), rSet.getInt("pr_id"),rSet.getInt("organization_id"),rSet.getDate("filled_on"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(reportFormFilledBy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<ReportFormFilledBy> getAllReportFormFilledByForThisOrganizationDuringThisPeriod(int organizationId,Date fromDate,Date toDate){
		List<ReportFormFilledBy> list = new ArrayList<ReportFormFilledBy>();
		ReportFormFilledBy reportFormFilledBy = null;
		try {
			String query = "select * from tbl_report_form_filled_by where organization_id = "+organizationId+" and filled_on between '"+fromDate+"' and '"+toDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportFormFilledBy = new ReportFormFilledBy(rSet.getLong("report_input_form_id"), rSet.getInt("pr_id"),rSet.getInt("organization_id"),rSet.getDate("filled_on"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(reportFormFilledBy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ReportFormFilledBy getreReportFormFilledBy(long reportInputFormId,int prId){
		ReportFormFilledBy reportFormFilledBy = null;
		try {
			String query = "select * from tbl_report_form_filled_by where report_input_form_id = "+reportInputFormId+" and pr_id = "+prId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportFormFilledBy = new ReportFormFilledBy(rSet.getLong("report_input_form_id"), rSet.getInt("pr_id"),rSet.getInt("organization_id"),rSet.getDate("filled_on"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return reportFormFilledBy;
	}
	
	public static List<ReportFormFilledBy> getAllReportFormsFilledByForThisGovernmentOrganization(int organizationId){
		List<ReportFormFilledBy> list = new ArrayList<ReportFormFilledBy>();
		ReportFormFilledBy reportFormFilledBy = null;
		try {
			String query = "select * from tbl_report_form_filled_by where organization_id = "+organizationId;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportFormFilledBy = new ReportFormFilledBy(rSet.getLong("report_input_form_id"), rSet.getInt("pr_id"),rSet.getInt("organization_id"),rSet.getDate("filled_on"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(reportFormFilledBy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
