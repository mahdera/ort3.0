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
public class ServicePerformedByTheGivenTimeDuration {
	private long reportInputFormId;
	private float numberOfInformationRequestBetween30Days;
	private float numberOfDaysRequiredToServeRequestBetween30Days;
	private float numberOfInformationRequestTookMoreThan30Days;
	private float numberOfDaysRequiredToServeRequestTookMoreThan30Days;
	private float numberOfUrgentInformationRequestBetween10Days;
	private float numberOfDaysRequiredToServeUrgentRequestBetween10Days;
	private int modifiedBy;
	private Date modificationDate;
	

	/**
	 * @param reportInputFormId
	 * @param numberOfInformationRequestBetween30Days
	 * @param numberOfDaysRequiredToServeRequestBetween30Days
	 * @param numberOfInformationRequestTookMoreThan30Days
	 * @param numberOfDaysRequiredToServeRequestTookMoreThan30Days
	 * @param numberOfUrgentInformationRequestBetween10Days
	 * @param numberOfDaysRequiredToServeUrgentRequestBetween10Days
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ServicePerformedByTheGivenTimeDuration(long reportInputFormId,
			float numberOfInformationRequestBetween30Days,
			float numberOfDaysRequiredToServeRequestBetween30Days,
			float numberOfInformationRequestTookMoreThan30Days,
			float numberOfDaysRequiredToServeRequestTookMoreThan30Days,
			float numberOfUrgentInformationRequestBetween10Days,
			float numberOfDaysRequiredToServeUrgentRequestBetween10Days,
			int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.numberOfInformationRequestBetween30Days = numberOfInformationRequestBetween30Days;
		this.numberOfDaysRequiredToServeRequestBetween30Days = numberOfDaysRequiredToServeRequestBetween30Days;
		this.numberOfInformationRequestTookMoreThan30Days = numberOfInformationRequestTookMoreThan30Days;
		this.numberOfDaysRequiredToServeRequestTookMoreThan30Days = numberOfDaysRequiredToServeRequestTookMoreThan30Days;
		this.numberOfUrgentInformationRequestBetween10Days = numberOfUrgentInformationRequestBetween10Days;
		this.numberOfDaysRequiredToServeUrgentRequestBetween10Days = numberOfDaysRequiredToServeUrgentRequestBetween10Days;
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
	 * @return the numberOfInformationRequestBetween30Days
	 */
	public float getNumberOfInformationRequestBetween30Days() {
		return numberOfInformationRequestBetween30Days;
	}



	/**
	 * @param numberOfInformationRequestBetween30Days the numberOfInformationRequestBetween30Days to set
	 */
	public void setNumberOfInformationRequestBetween30Days(
			float numberOfInformationRequestBetween30Days) {
		this.numberOfInformationRequestBetween30Days = numberOfInformationRequestBetween30Days;
	}



	/**
	 * @return the numberOfDaysRequiredToServeRequestBetween30Days
	 */
	public float getNumberOfDaysRequiredToServeRequestBetween30Days() {
		return numberOfDaysRequiredToServeRequestBetween30Days;
	}



	/**
	 * @param numberOfDaysRequiredToServeRequestBetween30Days the numberOfDaysRequiredToServeRequestBetween30Days to set
	 */
	public void setNumberOfDaysRequiredToServeRequestBetween30Days(
			float numberOfDaysRequiredToServeRequestBetween30Days) {
		this.numberOfDaysRequiredToServeRequestBetween30Days = numberOfDaysRequiredToServeRequestBetween30Days;
	}



	/**
	 * @return the numberOfInformationRequestTookMoreThan30Days
	 */
	public float getNumberOfInformationRequestTookMoreThan30Days() {
		return numberOfInformationRequestTookMoreThan30Days;
	}



	/**
	 * @param numberOfInformationRequestTookMoreThan30Days the numberOfInformationRequestTookMoreThan30Days to set
	 */
	public void setNumberOfInformationRequestTookMoreThan30Days(
			float numberOfInformationRequestTookMoreThan30Days) {
		this.numberOfInformationRequestTookMoreThan30Days = numberOfInformationRequestTookMoreThan30Days;
	}



	/**
	 * @return the numberOfDaysRequiredToServeRequestTookMoreThan30Days
	 */
	public float getNumberOfDaysRequiredToServeRequestTookMoreThan30Days() {
		return numberOfDaysRequiredToServeRequestTookMoreThan30Days;
	}



	/**
	 * @param numberOfDaysRequiredToServeRequestTookMoreThan30Days the numberOfDaysRequiredToServeRequestTookMoreThan30Days to set
	 */
	public void setNumberOfDaysRequiredToServeRequestTookMoreThan30Days(
			float numberOfDaysRequiredToServeRequestTookMoreThan30Days) {
		this.numberOfDaysRequiredToServeRequestTookMoreThan30Days = numberOfDaysRequiredToServeRequestTookMoreThan30Days;
	}



	/**
	 * @return the numberOfUrgentInformationRequestBetween10Days
	 */
	public float getNumberOfUrgentInformationRequestBetween10Days() {
		return numberOfUrgentInformationRequestBetween10Days;
	}



	/**
	 * @param numberOfUrgentInformationRequestBetween10Days the numberOfUrgentInformationRequestBetween10Days to set
	 */
	public void setNumberOfUrgentInformationRequestBetween10Days(
			float numberOfUrgentInformationRequestBetween10Days) {
		this.numberOfUrgentInformationRequestBetween10Days = numberOfUrgentInformationRequestBetween10Days;
	}



	/**
	 * @return the numberOfDaysRequiredToServeUrgentRequestBetween10Days
	 */
	public float getNumberOfDaysRequiredToServeUrgentRequestBetween10Days() {
		return numberOfDaysRequiredToServeUrgentRequestBetween10Days;
	}



	/**
	 * @param numberOfDaysRequiredToServeUrgentRequestBetween10Days the numberOfDaysRequiredToServeUrgentRequestBetween10Days to set
	 */
	public void setNumberOfDaysRequiredToServeUrgentRequestBetween10Days(
			float numberOfDaysRequiredToServeUrgentRequestBetween10Days) {
		this.numberOfDaysRequiredToServeUrgentRequestBetween10Days = numberOfDaysRequiredToServeUrgentRequestBetween10Days;
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
			String sqlStr = "insert into tbl_service_performed_by_the_given_time_duration values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setFloat(2, this.getNumberOfInformationRequestBetween30Days());
			pStmt.setFloat(3, this.getNumberOfDaysRequiredToServeRequestBetween30Days());
			pStmt.setFloat(4, this.getNumberOfInformationRequestTookMoreThan30Days());
			pStmt.setFloat(5, this.getNumberOfDaysRequiredToServeRequestTookMoreThan30Days());
			pStmt.setFloat(6, this.getNumberOfUrgentInformationRequestBetween10Days());
			pStmt.setFloat(7, this.getNumberOfDaysRequiredToServeUrgentRequestBetween10Days());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration) {
		try {
			String sqlStr = "update tbl_service_performed_by_the_given_time_duration set number_of_information_request_between_30_days = ?,"+
					"number_of_days_required_to_serve_request_between_30_days = ?,"+
					"number_of_information_request_took_more_than_30_days = ?,"+
					"number_of_days_taken_to_serve_request_taking_more_than_30_days = ?,"+
					"number_of_urgent_information_request_between_10_days = ?,"+
					"number_of_days_required_to_serve_urgent_request_between_10_days = ?,"+
					"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setFloat(1, servicePerformedByTheGivenTimeDuration.getNumberOfInformationRequestBetween30Days());
			pStmt.setFloat(2, servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestBetween30Days());
			pStmt.setFloat(3, servicePerformedByTheGivenTimeDuration.getNumberOfInformationRequestTookMoreThan30Days());
			pStmt.setFloat(4, servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestTookMoreThan30Days());
			pStmt.setFloat(5, servicePerformedByTheGivenTimeDuration.getNumberOfUrgentInformationRequestBetween10Days());
			pStmt.setFloat(6, servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeUrgentRequestBetween10Days());
			pStmt.setInt(7, servicePerformedByTheGivenTimeDuration.getModifiedBy());
			pStmt.setDate(8, servicePerformedByTheGivenTimeDuration.getModificationDate());
			pStmt.setLong(9, servicePerformedByTheGivenTimeDuration.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_service_performed_by_the_given_time_duration where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<ServicePerformedByTheGivenTimeDuration> getAllServicePerformedByTheGivenTimeDuration() {
		List<ServicePerformedByTheGivenTimeDuration> list = new ArrayList<ServicePerformedByTheGivenTimeDuration>();
		ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = null;
		try {
			String query = "select * from tbl_service_performed_by_the_given_time_duration";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				servicePerformedByTheGivenTimeDuration = new ServicePerformedByTheGivenTimeDuration(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_information_request_between_30_days"), rSet.getFloat("number_of_days_required_to_serve_request_between_30_days"), 
						rSet.getInt("number_of_information_request_took_more_than_30_days"), rSet.getFloat("number_of_days_taken_to_serve_request_taking_more_than_30_days"), 
						rSet.getInt("number_of_urgent_information_request_between_10_days"), rSet.getFloat("number_of_days_required_to_serve_urgent_request_between_10_days"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(servicePerformedByTheGivenTimeDuration);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static ServicePerformedByTheGivenTimeDuration getServicePerformedByTheGivenTimeDuration(long reportInputFormId) {
		ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = null;
		try {
			String query = "select * from tbl_service_performed_by_the_given_time_duration where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				servicePerformedByTheGivenTimeDuration = new ServicePerformedByTheGivenTimeDuration(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_information_request_between_30_days"), rSet.getFloat("number_of_days_required_to_serve_request_between_30_days"), 
						rSet.getInt("number_of_information_request_took_more_than_30_days"), rSet.getFloat("number_of_days_taken_to_serve_request_taking_more_than_30_days"), 
						rSet.getInt("number_of_urgent_information_request_between_10_days"), rSet.getFloat("number_of_days_required_to_serve_urgent_request_between_10_days"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return servicePerformedByTheGivenTimeDuration;
	}
	
	public static List<ServicePerformedByTheGivenTimeDuration> getAllServicePerformedByTheGivenTimeDurationForThisReportForm(long reportInputFormId){
		List<ServicePerformedByTheGivenTimeDuration> list = new ArrayList<ServicePerformedByTheGivenTimeDuration>();
		ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = null;
		try{
			String query = "select * from tbl_service_performed_by_the_given_time_duration where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				servicePerformedByTheGivenTimeDuration = new ServicePerformedByTheGivenTimeDuration(rSet.getLong("report_input_form_id"), 
						rSet.getInt("number_of_information_request_between_30_days"), rSet.getFloat("number_of_days_required_to_serve_request_between_30_days"), 
						rSet.getInt("number_of_information_request_took_more_than_30_days"), rSet.getFloat("number_of_days_taken_to_serve_request_taking_more_than_30_days"), 
						rSet.getInt("number_of_urgent_information_request_between_10_days"), rSet.getFloat("number_of_days_required_to_serve_urgent_request_between_10_days"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(servicePerformedByTheGivenTimeDuration);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
}// end class
