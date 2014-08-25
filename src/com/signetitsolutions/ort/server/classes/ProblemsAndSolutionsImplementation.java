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
public class ProblemsAndSolutionsImplementation {
	private long reportInputFormId;
	private String lackOfUnderstandingAboutRights;
	private String lackOfAttentionAndSupportFromHead;
	private String lackOfITInfrastructure;
	private String lackOfBudgetAndInputProblem;
	private String lackOfFollowupAndSupportFromConcernedBody;
	private String others;
	private int modifiedBy;
	private Date modificationDate;
	
	
	/**
	 * @param reportInputFormId
	 * @param lackOfUnderstandingAboutRights
	 * @param lackOfAttentionAndSupportFromHead
	 * @param lackOfITInfrastructure
	 * @param lackOfBudgetAndInputProblem
	 * @param lackOfFollowupAndSupportFromConcernedBody
	 * @param others
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ProblemsAndSolutionsImplementation(long reportInputFormId,
			String lackOfUnderstandingAboutRights,
			String lackOfAttentionAndSupportFromHead,
			String lackOfITInfrastructure, String lackOfBudgetAndInputProblem,
			String lackOfFollowupAndSupportFromConcernedBody, String others,
			int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.lackOfUnderstandingAboutRights = lackOfUnderstandingAboutRights;
		this.lackOfAttentionAndSupportFromHead = lackOfAttentionAndSupportFromHead;
		this.lackOfITInfrastructure = lackOfITInfrastructure;
		this.lackOfBudgetAndInputProblem = lackOfBudgetAndInputProblem;
		this.lackOfFollowupAndSupportFromConcernedBody = lackOfFollowupAndSupportFromConcernedBody;
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
	 * @return the lackOfUnderstandingAboutRights
	 */
	public String getLackOfUnderstandingAboutRights() {
		return lackOfUnderstandingAboutRights;
	}



	/**
	 * @param lackOfUnderstandingAboutRights the lackOfUnderstandingAboutRights to set
	 */
	public void setLackOfUnderstandingAboutRights(
			String lackOfUnderstandingAboutRights) {
		this.lackOfUnderstandingAboutRights = lackOfUnderstandingAboutRights;
	}



	/**
	 * @return the lackOfAttentionAndSupportFromHead
	 */
	public String getLackOfAttentionAndSupportFromHead() {
		return lackOfAttentionAndSupportFromHead;
	}



	/**
	 * @param lackOfAttentionAndSupportFromHead the lackOfAttentionAndSupportFromHead to set
	 */
	public void setLackOfAttentionAndSupportFromHead(
			String lackOfAttentionAndSupportFromHead) {
		this.lackOfAttentionAndSupportFromHead = lackOfAttentionAndSupportFromHead;
	}



	/**
	 * @return the lackOfITInfrastructure
	 */
	public String getLackOfITInfrastructure() {
		return lackOfITInfrastructure;
	}



	/**
	 * @param lackOfITInfrastructure the lackOfITInfrastructure to set
	 */
	public void setLackOfITInfrastructure(String lackOfITInfrastructure) {
		this.lackOfITInfrastructure = lackOfITInfrastructure;
	}



	/**
	 * @return the lackOfBudgetAndInputProblem
	 */
	public String getLackOfBudgetAndInputProblem() {
		return lackOfBudgetAndInputProblem;
	}



	/**
	 * @param lackOfBudgetAndInputProblem the lackOfBudgetAndInputProblem to set
	 */
	public void setLackOfBudgetAndInputProblem(String lackOfBudgetAndInputProblem) {
		this.lackOfBudgetAndInputProblem = lackOfBudgetAndInputProblem;
	}



	/**
	 * @return the lackOfFollowupAndSupportFromConcernedBody
	 */
	public String getLackOfFollowupAndSupportFromConcernedBody() {
		return lackOfFollowupAndSupportFromConcernedBody;
	}



	/**
	 * @param lackOfFollowupAndSupportFromConcernedBody the lackOfFollowupAndSupportFromConcernedBody to set
	 */
	public void setLackOfFollowupAndSupportFromConcernedBody(
			String lackOfFollowupAndSupportFromConcernedBody) {
		this.lackOfFollowupAndSupportFromConcernedBody = lackOfFollowupAndSupportFromConcernedBody;
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
			String sqlStr = "insert into tbl_problems_and_solutions_implementation values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setString(2, this.getLackOfUnderstandingAboutRights());
			pStmt.setString(3, this.getLackOfAttentionAndSupportFromHead());
			pStmt.setString(4, this.getLackOfITInfrastructure());
			pStmt.setString(5, this.getLackOfBudgetAndInputProblem());
			pStmt.setString(6, this.getLackOfFollowupAndSupportFromConcernedBody());
			pStmt.setString(7, this.getOthers());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation){
		try {
			String sqlStr = "update tbl_problems_and_solutions_implementation set lack_of_understanding_about_rights = ?,"+
		"lack_of_attention_and_support_from_head = ?, lack_of_it_infrastructure = ?, lack_of_budget_and_input_problem = ?,"+
		"lack_of_followup_and_support_from_concerned_body = ?, others = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, problemsAndSolutionsImplementation.getLackOfUnderstandingAboutRights());
			pStmt.setString(2, problemsAndSolutionsImplementation.getLackOfAttentionAndSupportFromHead());
			pStmt.setString(3, problemsAndSolutionsImplementation.getLackOfITInfrastructure());
			pStmt.setString(4, problemsAndSolutionsImplementation.getLackOfBudgetAndInputProblem());
			pStmt.setString(5, problemsAndSolutionsImplementation.getLackOfFollowupAndSupportFromConcernedBody());
			pStmt.setString(6, problemsAndSolutionsImplementation.getOthers());
			pStmt.setInt(7, problemsAndSolutionsImplementation.getModifiedBy());
			pStmt.setDate(8, problemsAndSolutionsImplementation.getModificationDate());
			pStmt.setLong(9, problemsAndSolutionsImplementation.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_problems_and_solutions_implementation where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ProblemsAndSolutionsImplementation> getAllProblemsAndSolutionsImplementation(){
		List<ProblemsAndSolutionsImplementation> list = new ArrayList<ProblemsAndSolutionsImplementation>();
		ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = null;
		try {
			String query = "select * from tbl_problems_and_solutions_implementation";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				problemsAndSolutionsImplementation = new ProblemsAndSolutionsImplementation(rSet.getLong("report_input_form_id"), 
						rSet.getString("lack_of_understanding_about_rights"), rSet.getString("lack_of_attention_and_support_from_head"), 
						rSet.getString("lack_of_it_infrastructure"), rSet.getString("lack_of_budget_and_input_problem"), 
						rSet.getString("lack_of_followup_and_support_from_concerned_body"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(problemsAndSolutionsImplementation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ProblemsAndSolutionsImplementation getProblemsAndSolutionsImplementation(long reportInputFormId){
		ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = null;
		try {
			String query = "select * from tbl_problems_and_solutions_implementation where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				problemsAndSolutionsImplementation = new ProblemsAndSolutionsImplementation(rSet.getLong("report_input_form_id"), 
						rSet.getString("lack_of_understanding_about_rights"), rSet.getString("lack_of_attention_and_support_from_head"), 
						rSet.getString("lack_of_it_infrastructure"), rSet.getString("lack_of_budget_and_input_problem"), 
						rSet.getString("lack_of_followup_and_support_from_concerned_body"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return problemsAndSolutionsImplementation;
	}
	
	public static List<ProblemsAndSolutionsImplementation> getAllProblemsAndSolutionsImplementationForThisReportForm(long reportInputFormId){
		List<ProblemsAndSolutionsImplementation> list = new ArrayList<ProblemsAndSolutionsImplementation>();
		ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = null;
		try{
			String query = "select * from tbl_problems_and_solutions_implementation where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				problemsAndSolutionsImplementation = new ProblemsAndSolutionsImplementation(rSet.getLong("report_input_form_id"), 
						rSet.getString("lack_of_understanding_about_rights"), rSet.getString("lack_of_attention_and_support_from_head"), 
						rSet.getString("lack_of_it_infrastructure"), rSet.getString("lack_of_budget_and_input_problem"), 
						rSet.getString("lack_of_followup_and_support_from_concerned_body"), rSet.getString("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(problemsAndSolutionsImplementation);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
}//end class
