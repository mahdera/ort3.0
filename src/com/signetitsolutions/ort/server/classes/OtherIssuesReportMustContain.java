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
public class OtherIssuesReportMustContain {
	private long reportInputFormId;
	private int numberOfTrainingsGivenToMaleHeadAndProfessionals;
	private int numberOfTrainingsGivenToFemaleHeadAndProfessionals;
	private String techniqueForFastResponse;
	private String itExperience;
	private int modifiedBy;
	private Date modificationDate;
	
	
	/**
	 * @param reportInputFormId
	 * @param numberOfTrainingsGivenToMaleHeadAndProfessionals
	 * @param numberOfTrainingsGivenToFemaleHeadAndProfessionals
	 * @param techniqueForFastResponse
	 * @param itExperience
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public OtherIssuesReportMustContain(long reportInputFormId,
			int numberOfTrainingsGivenToMaleHeadAndProfessionals,
			int numberOfTrainingsGivenToFemaleHeadAndProfessionals,
			String techniqueForFastResponse, String itExperience,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.numberOfTrainingsGivenToMaleHeadAndProfessionals = numberOfTrainingsGivenToMaleHeadAndProfessionals;
		this.numberOfTrainingsGivenToFemaleHeadAndProfessionals = numberOfTrainingsGivenToFemaleHeadAndProfessionals;
		this.techniqueForFastResponse = techniqueForFastResponse;
		this.itExperience = itExperience;
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
	 * @return the numberOfTrainingsGivenToMaleHeadAndProfessionals
	 */
	public int getNumberOfTrainingsGivenToMaleHeadAndProfessionals() {
		return numberOfTrainingsGivenToMaleHeadAndProfessionals;
	}



	/**
	 * @param numberOfTrainingsGivenToMaleHeadAndProfessionals the numberOfTrainingsGivenToMaleHeadAndProfessionals to set
	 */
	public void setNumberOfTrainingsGivenToMaleHeadAndProfessionals(
			int numberOfTrainingsGivenToMaleHeadAndProfessionals) {
		this.numberOfTrainingsGivenToMaleHeadAndProfessionals = numberOfTrainingsGivenToMaleHeadAndProfessionals;
	}



	/**
	 * @return the numberOfTrainingsGivenToFemaleHeadAndProfessionals
	 */
	public int getNumberOfTrainingsGivenToFemaleHeadAndProfessionals() {
		return numberOfTrainingsGivenToFemaleHeadAndProfessionals;
	}



	/**
	 * @param numberOfTrainingsGivenToFemaleHeadAndProfessionals the numberOfTrainingsGivenToFemaleHeadAndProfessionals to set
	 */
	public void setNumberOfTrainingsGivenToFemaleHeadAndProfessionals(
			int numberOfTrainingsGivenToFemaleHeadAndProfessionals) {
		this.numberOfTrainingsGivenToFemaleHeadAndProfessionals = numberOfTrainingsGivenToFemaleHeadAndProfessionals;
	}



	/**
	 * @return the techniqueForFastResponse
	 */
	public String getTechniqueForFastResponse() {
		return techniqueForFastResponse;
	}



	/**
	 * @param techniqueForFastResponse the techniqueForFastResponse to set
	 */
	public void setTechniqueForFastResponse(String techniqueForFastResponse) {
		this.techniqueForFastResponse = techniqueForFastResponse;
	}



	/**
	 * @return the itExperience
	 */
	public String getItExperience() {
		return itExperience;
	}



	/**
	 * @param itExperience the itExperience to set
	 */
	public void setItExperience(String itExperience) {
		this.itExperience = itExperience;
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
			String sqlStr = "insert into tbl_other_issues_report_must_contain values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getNumberOfTrainingsGivenToMaleHeadAndProfessionals());
			pStmt.setInt(3, this.getNumberOfTrainingsGivenToFemaleHeadAndProfessionals());
			pStmt.setString(4, this.getTechniqueForFastResponse());
			pStmt.setString(5, this.getItExperience());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(OtherIssuesReportMustContain otherIssuesReportMustContain){
		try {
			String sqlStr = "update tbl_other_issues_report_must_contain set number_of_trainings_given_to_male_head_and_professionals = ?,"+
		"number_of_trainings_given_to_female_head_and_professionals = ?,"+
		"technique_for_fast_response = ?, it_experience = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, otherIssuesReportMustContain.getNumberOfTrainingsGivenToMaleHeadAndProfessionals());
			pStmt.setInt(2, otherIssuesReportMustContain.getNumberOfTrainingsGivenToFemaleHeadAndProfessionals());
			pStmt.setString(3, otherIssuesReportMustContain.getTechniqueForFastResponse());
			pStmt.setString(4, otherIssuesReportMustContain.getItExperience());
			pStmt.setInt(5, otherIssuesReportMustContain.getModifiedBy());
			pStmt.setDate(6, otherIssuesReportMustContain.getModificationDate());
			pStmt.setLong(7, otherIssuesReportMustContain.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_other_issues_report_must_contain where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<OtherIssuesReportMustContain> getAllOtherIssuesReportMustContain(){
		List<OtherIssuesReportMustContain> list = new ArrayList<OtherIssuesReportMustContain>();
		OtherIssuesReportMustContain otherIssuesReportMustContain = null;
		try {
			String query = "select * from tbl_other_issues_report_must_contain";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				otherIssuesReportMustContain = new OtherIssuesReportMustContain(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_trainings_given_to_male_head_and_professionals"), rSet.getInt("number_of_trainings_given_to_female_head_and_professionals"), 
						rSet.getString("technique_for_fast_response"), rSet.getString("it_experience"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(otherIssuesReportMustContain);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static OtherIssuesReportMustContain getOtherIssuesReportMustContain(long reportInputFormId){
		OtherIssuesReportMustContain otherIssuesReportMustContain = null;
		try {
			String query = "select * from tbl_other_issues_report_must_contain where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				otherIssuesReportMustContain = new OtherIssuesReportMustContain(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_trainings_given_to_male_head_and_professionals"), rSet.getInt("number_of_trainings_given_to_female_head_and_professionals"), 
						rSet.getString("technique_for_fast_response"), rSet.getString("it_experience"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return otherIssuesReportMustContain;
	}
	
	public static List<OtherIssuesReportMustContain> getAllOtherIssuesReportMustContainForThisReportForm(long reportInputFormId){
		List<OtherIssuesReportMustContain> list = new ArrayList<OtherIssuesReportMustContain>();
		OtherIssuesReportMustContain otherIssuesReportMustContain = null;
		try{
			String query = "select * from tbl_other_issues_report_must_contain where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				otherIssuesReportMustContain = new OtherIssuesReportMustContain(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_trainings_given_to_male_head_and_professionals"), rSet.getInt("number_of_trainings_given_to_female_head_and_professionals"), 
						rSet.getString("technique_for_fast_response"), rSet.getString("it_experience"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(otherIssuesReportMustContain);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
