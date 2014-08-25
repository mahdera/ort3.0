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
public class BasicInfoAboutReport {
	private long reportInputFormId;
	private int publishingInformation;
	private int organizingRecordOffice;
	private int trainingProvisionsForHeadsAndProfessionals;
	private int establishingSystemToServeInformationRequesters;
	private String others;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * 
	 */
	public BasicInfoAboutReport() {
	}

	

	/**
	 * @param reportInputFormId
	 * @param publishingInformation
	 * @param organizingRecordOffice
	 * @param trainingProvisionsForHeadsAndProfessionals
	 * @param establishingSystemToServeInformationRequesters
	 * @param others
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public BasicInfoAboutReport(long reportInputFormId,
			int publishingInformation, int organizingRecordOffice,
			int trainingProvisionsForHeadsAndProfessionals,
			int establishingSystemToServeInformationRequesters, String others,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.publishingInformation = publishingInformation;
		this.organizingRecordOffice = organizingRecordOffice;
		this.trainingProvisionsForHeadsAndProfessionals = trainingProvisionsForHeadsAndProfessionals;
		this.establishingSystemToServeInformationRequesters = establishingSystemToServeInformationRequesters;
		this.others = others;
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
	 * @return the publishingInformation
	 */
	public int getPublishingInformation() {
		return publishingInformation;
	}




	/**
	 * @param publishingInformation the publishingInformation to set
	 */
	public void setPublishingInformation(int publishingInformation) {
		this.publishingInformation = publishingInformation;
	}




	/**
	 * @return the organizingRecordOffice
	 */
	public int getOrganizingRecordOffice() {
		return organizingRecordOffice;
	}




	/**
	 * @param organizingRecordOffice the organizingRecordOffice to set
	 */
	public void setOrganizingRecordOffice(int organizingRecordOffice) {
		this.organizingRecordOffice = organizingRecordOffice;
	}




	/**
	 * @return the trainingProvisionsForHeadsAndProfessionals
	 */
	public int getTrainingProvisionsForHeadsAndProfessionals() {
		return trainingProvisionsForHeadsAndProfessionals;
	}




	/**
	 * @param trainingProvisionsForHeadsAndProfessionals the trainingProvisionsForHeadsAndProfessionals to set
	 */
	public void setTrainingProvisionsForHeadsAndProfessionals(
			int trainingProvisionsForHeadsAndProfessionals) {
		this.trainingProvisionsForHeadsAndProfessionals = trainingProvisionsForHeadsAndProfessionals;
	}




	/**
	 * @return the establishingSystemToServeInformationRequesters
	 */
	public int getEstablishingSystemToServeInformationRequesters() {
		return establishingSystemToServeInformationRequesters;
	}




	/**
	 * @param establishingSystemToServeInformationRequesters the establishingSystemToServeInformationRequesters to set
	 */
	public void setEstablishingSystemToServeInformationRequesters(
			int establishingSystemToServeInformationRequesters) {
		this.establishingSystemToServeInformationRequesters = establishingSystemToServeInformationRequesters;
	}




	/**
	 * @return the others
	 */
	public String getOthers() {
		return others;
	}




	/**
	 * @param others the others to set
	 */
	public void setOthers(String others) {
		this.others = others;
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
	public java.sql.Date getModificationDate() {
		return modificationDate;
	}



	/**
	 * @param modificationDate the modificationDate to set
	 */
	public void setModificationDate(java.sql.Date modificationDate) {
		this.modificationDate = modificationDate;
	}



	public void save(){
		try {
			String sqlStr = "insert into tbl_basic_info_about_report values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getPublishingInformation());
			pStmt.setInt(3, this.getOrganizingRecordOffice());
			pStmt.setInt(4, this.getTrainingProvisionsForHeadsAndProfessionals());
			pStmt.setInt(5, this.getEstablishingSystemToServeInformationRequesters());
			pStmt.setString(6, this.getOthers());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(BasicInfoAboutReport basicInfoAboutReport){
		try {
			String sqlStr = "update tbl_basic_info_about_report set publishing_information = ?," +
					"organizaing_record_office = ?, training_provisions_for_heads_and_professionals = ?," +
					"establishing_system_to_serve_information_requesters = ?," +
					"others = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, basicInfoAboutReport.getPublishingInformation());
			pStmt.setInt(2, basicInfoAboutReport.getOrganizingRecordOffice());
			pStmt.setInt(3, basicInfoAboutReport.getTrainingProvisionsForHeadsAndProfessionals());
			pStmt.setInt(4, basicInfoAboutReport.getEstablishingSystemToServeInformationRequesters());
			pStmt.setString(5, basicInfoAboutReport.getOthers());
			pStmt.setInt(6, basicInfoAboutReport.getModifiedBy());
			pStmt.setDate(7, basicInfoAboutReport.getModificationDate());
			pStmt.setLong(8, basicInfoAboutReport.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_basic_info_about_report where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<BasicInfoAboutReport> getAllBasicInfoAboutReport(){
		List<BasicInfoAboutReport> list = new ArrayList<BasicInfoAboutReport>();
		BasicInfoAboutReport basicInfoAboutReport = null;
		try {
			String query = "select * from tbl_basic_info_about_report";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				basicInfoAboutReport = new BasicInfoAboutReport(rSet.getLong("report_input_form_id"), rSet.getInt("publishing_information"), 
						rSet.getInt("organizaing_record_office"), rSet.getInt("training_provisions_for_heads_and_professionals"), 
						rSet.getInt("establishing_system_to_serve_information_requesters"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(basicInfoAboutReport);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<BasicInfoAboutReport> getAllBasicInfoAboutReportForThisOrganizationBetweenThisDateRange(int govtOrgId,Date fromDate,Date toDate){
		List<BasicInfoAboutReport> list = new ArrayList<BasicInfoAboutReport>();
		BasicInfoAboutReport basicInfoAboutReport = null;
		try {
			String query = "select * from tbl_basic_info_about_report where organization_id = "+govtOrgId+" and filled_on between '"+fromDate+"' and '"+toDate+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				basicInfoAboutReport = new BasicInfoAboutReport(rSet.getLong("report_input_form_id"), rSet.getInt("publishing_information"), 
						rSet.getInt("organizaing_record_office"), rSet.getInt("training_provisions_for_heads_and_professionals"), 
						rSet.getInt("establishing_system_to_serve_information_requesters"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(basicInfoAboutReport);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static BasicInfoAboutReport getBasicInfoAboutReport(long reportInputFormId){
		BasicInfoAboutReport basicInfoAboutReport = null;
		try {
			String query = "select * from tbl_basic_info_about_report where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				basicInfoAboutReport = new BasicInfoAboutReport(rSet.getLong("report_input_form_id"), rSet.getInt("publishing_information"), 
						rSet.getInt("organizaing_record_office"), rSet.getInt("training_provisions_for_heads_and_professionals"), 
						rSet.getInt("establishing_system_to_serve_information_requesters"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return basicInfoAboutReport;
	}
	
	public static List<BasicInfoAboutReport> getAllBasicInfoAboutReportForThisReportForm(long reportInputFormId){
		List<BasicInfoAboutReport> list = new ArrayList<BasicInfoAboutReport>();
		BasicInfoAboutReport basicInfoAboutReport = null;
		try{
			String query = "select * from tbl_basic_info_about_report where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				basicInfoAboutReport = new BasicInfoAboutReport(rSet.getLong("report_input_form_id"), rSet.getInt("publishing_information"), 
						rSet.getInt("organizaing_record_office"), rSet.getInt("training_provisions_for_heads_and_professionals"), 
						rSet.getInt("establishing_system_to_serve_information_requesters"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(basicInfoAboutReport);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
