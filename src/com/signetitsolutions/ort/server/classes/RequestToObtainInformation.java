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
public class RequestToObtainInformation {
	private long reportInputFormId;
	private int yearlyInformationRequestMale;
	private int yearlyInformationRequestFemale;
	private int yearlyInformationRequestBoth;
	private int yearlyInformationRequestOrganization;
	private int fullyAcceptedInformationRequest;
	private int partiallyAcceptedInformationRequest;
	private int fullyRejectedInformationRequest;
	private int modifiedBy;
	private Date modificationDate;
	
	
	/**
	 * @param reportInputFormId
	 * @param yearlyInformationRequestMale
	 * @param yearlyInformationRequestFemale
	 * @param yearlyInformationRequestBoth
	 * @param yearlyInformationRequestOrganization
	 * @param fullyAcceptedInformationRequest
	 * @param partiallyAcceptedInformationRequest
	 * @param fullyRejectedInformationRequest
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RequestToObtainInformation(long reportInputFormId,
			int yearlyInformationRequestMale,
			int yearlyInformationRequestFemale,
			int yearlyInformationRequestBoth,
			int yearlyInformationRequestOrganization,
			int fullyAcceptedInformationRequest,
			int partiallyAcceptedInformationRequest,
			int fullyRejectedInformationRequest,int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.yearlyInformationRequestMale = yearlyInformationRequestMale;
		this.yearlyInformationRequestFemale = yearlyInformationRequestFemale;
		this.yearlyInformationRequestBoth = yearlyInformationRequestBoth;
		this.yearlyInformationRequestOrganization = yearlyInformationRequestOrganization;
		this.fullyAcceptedInformationRequest = fullyAcceptedInformationRequest;
		this.partiallyAcceptedInformationRequest = partiallyAcceptedInformationRequest;
		this.fullyRejectedInformationRequest = fullyRejectedInformationRequest;
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
	 * @return the yearlyInformationRequestMale
	 */
	public int getYearlyInformationRequestMale() {
		return yearlyInformationRequestMale;
	}



	/**
	 * @param yearlyInformationRequestMale the yearlyInformationRequestMale to set
	 */
	public void setYearlyInformationRequestMale(int yearlyInformationRequestMale) {
		this.yearlyInformationRequestMale = yearlyInformationRequestMale;
	}



	/**
	 * @return the yearlyInformationRequestFemale
	 */
	public int getYearlyInformationRequestFemale() {
		return yearlyInformationRequestFemale;
	}



	/**
	 * @param yearlyInformationRequestFemale the yearlyInformationRequestFemale to set
	 */
	public void setYearlyInformationRequestFemale(int yearlyInformationRequestFemale) {
		this.yearlyInformationRequestFemale = yearlyInformationRequestFemale;
	}



	/**
	 * @return the yearlyInformationRequestBoth
	 */
	public int getYearlyInformationRequestBoth() {
		return yearlyInformationRequestBoth;
	}



	/**
	 * @param yearlyInformationRequestBoth the yearlyInformationRequestBoth to set
	 */
	public void setYearlyInformationRequestBoth(int yearlyInformationRequestBoth) {
		this.yearlyInformationRequestBoth = yearlyInformationRequestBoth;
	}



	/**
	 * @return the yearlyInformationRequestOrganization
	 */
	public int getYearlyInformationRequestOrganization() {
		return yearlyInformationRequestOrganization;
	}



	/**
	 * @param yearlyInformationRequestOrganization the yearlyInformationRequestOrganization to set
	 */
	public void setYearlyInformationRequestOrganization(
			int yearlyInformationRequestOrganization) {
		this.yearlyInformationRequestOrganization = yearlyInformationRequestOrganization;
	}



	/**
	 * @return the fullyAcceptedInformationRequest
	 */
	public int getFullyAcceptedInformationRequest() {
		return fullyAcceptedInformationRequest;
	}



	/**
	 * @param fullyAcceptedInformationRequest the fullyAcceptedInformationRequest to set
	 */
	public void setFullyAcceptedInformationRequest(
			int fullyAcceptedInformationRequest) {
		this.fullyAcceptedInformationRequest = fullyAcceptedInformationRequest;
	}



	/**
	 * @return the partiallyAcceptedInformationRequest
	 */
	public int getPartiallyAcceptedInformationRequest() {
		return partiallyAcceptedInformationRequest;
	}



	/**
	 * @param partiallyAcceptedInformationRequest the partiallyAcceptedInformationRequest to set
	 */
	public void setPartiallyAcceptedInformationRequest(
			int partiallyAcceptedInformationRequest) {
		this.partiallyAcceptedInformationRequest = partiallyAcceptedInformationRequest;
	}



	/**
	 * @return the fullyRejectedInformationRequest
	 */
	public int getFullyRejectedInformationRequest() {
		return fullyRejectedInformationRequest;
	}



	/**
	 * @param fullyRejectedInformationRequest the fullyRejectedInformationRequest to set
	 */
	public void setFullyRejectedInformationRequest(
			int fullyRejectedInformationRequest) {
		this.fullyRejectedInformationRequest = fullyRejectedInformationRequest;
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
			String sqlStr = "insert into tbl_request_to_obtain_information values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getYearlyInformationRequestMale());
			pStmt.setInt(3, this.getYearlyInformationRequestFemale());
			pStmt.setInt(4, this.getYearlyInformationRequestBoth());
			pStmt.setInt(5, this.getYearlyInformationRequestOrganization());
			pStmt.setInt(6, this.getFullyAcceptedInformationRequest());
			pStmt.setInt(7, this.getPartiallyAcceptedInformationRequest());
			pStmt.setInt(8, this.getFullyRejectedInformationRequest());
			pStmt.setInt(9, this.getModifiedBy());
			pStmt.setDate(10, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(RequestToObtainInformation requestToObtainInformation){
		try {
			String sqlStr = "update tbl_request_to_obtain_information set yearly_information_request_male = ?,"+
		"yearly_information_request_female = ?, yearly_information_request_both = ?,"+
		"yearly_information_request_organization = ?, fully_accepted_information_request	= ?,"+
		"partially_accepted_information_request = ?, fully_rejected_information_request = ?,"+
		"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, requestToObtainInformation.getYearlyInformationRequestMale());
			pStmt.setInt(2, requestToObtainInformation.getYearlyInformationRequestFemale());
			pStmt.setInt(3, requestToObtainInformation.getYearlyInformationRequestBoth());
			pStmt.setInt(4, requestToObtainInformation.getYearlyInformationRequestOrganization());
			pStmt.setInt(5, requestToObtainInformation.getFullyAcceptedInformationRequest());
			pStmt.setInt(6, requestToObtainInformation.getPartiallyAcceptedInformationRequest());
			pStmt.setInt(7, requestToObtainInformation.getFullyRejectedInformationRequest());
			pStmt.setInt(8, requestToObtainInformation.getModifiedBy());
			pStmt.setDate(9, requestToObtainInformation.getModificationDate());
			pStmt.setLong(10, requestToObtainInformation.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String command = "delete from tbl_request_to_obtain_information where report_input_form_id = "+reportInputFormId;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<RequestToObtainInformation> getAllRequestToObtainInformation(){
		List<RequestToObtainInformation> list = new ArrayList<RequestToObtainInformation>();
		RequestToObtainInformation requestToObtainInformation = null;
		try {
			String query = "select * from tbl_request_to_obtain_information";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				requestToObtainInformation = new RequestToObtainInformation(rSet.getLong("report_input_form_id"), rSet.getInt("yearly_information_request_male"),
						rSet.getInt("yearly_information_request_female"), rSet.getInt("yearly_information_request_both"), rSet.getInt("yearly_information_request_organization"), 
						rSet.getInt("fully_accepted_information_request"), rSet.getInt("partially_accepted_information_request"), rSet.getInt("fully_rejected_information_request"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(requestToObtainInformation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static RequestToObtainInformation getRequestToObtainInformation(long reportInputFormId){
		RequestToObtainInformation requestToObtainInformation = null;
		try {
			String query = "select * from tbl_request_to_obtain_information where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				requestToObtainInformation = new RequestToObtainInformation(rSet.getLong("report_input_form_id"), rSet.getInt("yearly_information_request_male"),
						rSet.getInt("yearly_information_request_female"), rSet.getInt("yearly_information_request_both"), rSet.getInt("yearly_information_request_organization"), 
						rSet.getInt("fully_accepted_information_request"), rSet.getInt("partially_accepted_information_request"), rSet.getInt("fully_rejected_information_request"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return requestToObtainInformation;
	}
	
	public static List<RequestToObtainInformation> getAllRequestToObtainInformationForThisReportForm(long reportInputFormId){
		List<RequestToObtainInformation> list = new ArrayList<RequestToObtainInformation>();
		RequestToObtainInformation requestToObtainInformation = null;
		try{
			String query = "select * from tbl_request_to_obtain_information where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				requestToObtainInformation = new RequestToObtainInformation(rSet.getLong("report_input_form_id"), rSet.getInt("yearly_information_request_male"),
						rSet.getInt("yearly_information_request_female"), rSet.getInt("yearly_information_request_both"), rSet.getInt("yearly_information_request_organization"), 
						rSet.getInt("fully_accepted_information_request"), rSet.getInt("partially_accepted_information_request"), rSet.getInt("fully_rejected_information_request"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(requestToObtainInformation);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
