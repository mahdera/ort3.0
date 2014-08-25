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
public class ReportInputForm {
	private long id;
	private int governmentSectorOrganizationId;
	private int modifiedBy;
	private Date modificationDate;
	
	
	
	

	/**
	 * 
	 */
	public ReportInputForm() {
	}

	

	/**
	 * @param governmentSectorOrganizationId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ReportInputForm(int governmentSectorOrganizationId, int modifiedBy,
			Date modificationDate) {
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	

	/**
	 * @param id
	 * @param governmentSectorOrganizationId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ReportInputForm(long id, int governmentSectorOrganizationId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}



	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}



	/**
	 * @return the governmentSectorOrganizationId
	 */
	public int getGovernmentSectorOrganizationId() {
		return governmentSectorOrganizationId;
	}



	/**
	 * @param governmentSectorOrganizationId the governmentSectorOrganizationId to set
	 */
	public void setGovernmentSectorOrganizationId(int governmentSectorOrganizationId) {
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
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
			String sqlStr = "insert into tbl_report_input_form values(?,?,?,?)";		
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, 0);
			pStmt.setInt(2, this.getGovernmentSectorOrganizationId());
			pStmt.setInt(3, this.getModifiedBy());
			pStmt.setDate(4, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ReportInputForm reportInputForm){
		try {
			String sqlStr = "update tbl_report_input_form set government_section_organization_id = ?,"+
		"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, reportInputForm.getGovernmentSectorOrganizationId());
			pStmt.setInt(2, reportInputForm.getModifiedBy());
			pStmt.setDate(3, reportInputForm.getModificationDate());
			pStmt.setLong(4, reportInputForm.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long id){
		try {
			String sqlStr = "delete from tbl_report_input_form where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}	
	
	
	public static List<ReportInputForm> getAllReportInputForms(){
		List<ReportInputForm> list = new ArrayList<ReportInputForm>();
		ReportInputForm reportInputForm = null;
		try {
			String query = "select * from tbl_report_input_form";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportInputForm = new ReportInputForm(rSet.getLong("id"), rSet.getInt("government_sector_organization_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(reportInputForm);
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ReportInputForm getReportInputForm(long id){
		ReportInputForm reportInputForm = null;
		try {
			String query = "select * from tbl_report_input_form where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				reportInputForm = new ReportInputForm(rSet.getLong("id"), rSet.getInt("government_sector_organization_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}//end while loop
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return reportInputForm;
	}
	
	public static long getMaxReportInputFormIdForThisGovernmentSectorOrganization(int govtOrganizationId){
		long id = 0;
		try{
			String query = "select max(id) as I from tbl_report_input_form where government_sector_organization_id = "+govtOrganizationId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				id = rSet.getLong("I");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return id;
	}
}//end class
