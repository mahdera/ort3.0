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
public class InformationServiceAdminCost {
	private long reportInputFormId;
	private float costOfServingInformationRequest;
	private float costOfPublishingInformation;
	private float revenueCollectedFromUsersCoverAdminCost;
	private int numberOfInformationRequestServedFreeOfCharge;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * @param reportInputFormId
	 * @param costOfServingInformationRequest
	 * @param costOfPublishingInformation
	 * @param revenueCollectedFromUsersCoverAdminCost
	 * @param numberOfInformationRequestServedFreeOfCharge
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public InformationServiceAdminCost(long reportInputFormId,
			float costOfServingInformationRequest,
			float costOfPublishingInformation,
			float revenueCollectedFromUsersCoverAdminCost,
			int numberOfInformationRequestServedFreeOfCharge,int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.costOfServingInformationRequest = costOfServingInformationRequest;
		this.costOfPublishingInformation = costOfPublishingInformation;
		this.revenueCollectedFromUsersCoverAdminCost = revenueCollectedFromUsersCoverAdminCost;
		this.numberOfInformationRequestServedFreeOfCharge = numberOfInformationRequestServedFreeOfCharge;
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
	 * @return the costOfServingInformationRequest
	 */
	public float getCostOfServingInformationRequest() {
		return costOfServingInformationRequest;
	}
	/**
	 * @param costOfServingInformationRequest the costOfServingInformationRequest to set
	 */
	public void setCostOfServingInformationRequest(
			float costOfServingInformationRequest) {
		this.costOfServingInformationRequest = costOfServingInformationRequest;
	}
	/**
	 * @return the costOfPublishingInformation
	 */
	public float getCostOfPublishingInformation() {
		return costOfPublishingInformation;
	}
	/**
	 * @param costOfPublishingInformation the costOfPublishingInformation to set
	 */
	public void setCostOfPublishingInformation(float costOfPublishingInformation) {
		this.costOfPublishingInformation = costOfPublishingInformation;
	}
	/**
	 * @return the revenueCollectedFromUsersCoverAdminCost
	 */
	public float getRevenueCollectedFromUsersCoverAdminCost() {
		return revenueCollectedFromUsersCoverAdminCost;
	}
	/**
	 * @param revenueCollectedFromUsersCoverAdminCost the revenueCollectedFromUsersCoverAdminCost to set
	 */
	public void setRevenueCollectedFromUsersCoverAdminCost(
			float revenueCollectedFromUsersCoverAdminCost) {
		this.revenueCollectedFromUsersCoverAdminCost = revenueCollectedFromUsersCoverAdminCost;
	}
	/**
	 * @return the numberOfInformationRequestServedFreeOfCharge
	 */
	public int getNumberOfInformationRequestServedFreeOfCharge() {
		return numberOfInformationRequestServedFreeOfCharge;
	}
	/**
	 * @param numberOfInformationRequestServedFreeOfCharge the numberOfInformationRequestServedFreeOfCharge to set
	 */
	public void setNumberOfInformationRequestServedFreeOfCharge(
			int numberOfInformationRequestServedFreeOfCharge) {
		this.numberOfInformationRequestServedFreeOfCharge = numberOfInformationRequestServedFreeOfCharge;
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
			String sqlStr = "insert into tbl_information_service_admin_cost values(?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setFloat(2, this.getCostOfServingInformationRequest());
			pStmt.setFloat(3, this.getCostOfPublishingInformation());
			pStmt.setFloat(4, this.getRevenueCollectedFromUsersCoverAdminCost());
			pStmt.setInt(5, this.getNumberOfInformationRequestServedFreeOfCharge());
			pStmt.setInt(6, this.getModifiedBy());
			pStmt.setDate(7, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(InformationServiceAdminCost informationServiceAdminCost){
		try {
			String sqlStr = "update tbl_information_service_admin_cost set cost_of_serving_information_request = ?,"+
		"cost_of_publishing_information = ?, revenue_collected_from_users_cover_admin_cost = ?,"+
		"number_of_information_request_served_free_of_charge = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setFloat(1, informationServiceAdminCost.getCostOfServingInformationRequest());
			pStmt.setFloat(2, informationServiceAdminCost.getCostOfPublishingInformation());
			pStmt.setFloat(3, informationServiceAdminCost.getRevenueCollectedFromUsersCoverAdminCost());
			pStmt.setInt(4, informationServiceAdminCost.getNumberOfInformationRequestServedFreeOfCharge());
			pStmt.setInt(5, informationServiceAdminCost.getModifiedBy());
			pStmt.setDate(6, informationServiceAdminCost.getModificationDate());
			pStmt.setLong(7, informationServiceAdminCost.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_information_service_admin_cost where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<InformationServiceAdminCost> getAllInformationServiceAdminCosts(){
		List<InformationServiceAdminCost> list = new ArrayList<InformationServiceAdminCost>();
		InformationServiceAdminCost informationServiceAdminCost = null;
		try {
			String query = "select * from tbl_information_service_admin_cost";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				informationServiceAdminCost = new InformationServiceAdminCost(rSet.getLong("report_input_form_id"), 
						rSet.getFloat("cost_of_serving_information_request"), rSet.getFloat("cost_of_publishing_information"), 
						rSet.getFloat("revenue_collected_from_users_cover_admin_cost"), rSet.getInt("number_of_information_request_served_free_of_charge"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(informationServiceAdminCost);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static InformationServiceAdminCost getInformationServiceAdminCost(long reportInputFormId){
		InformationServiceAdminCost informationServiceAdminCost = null;
		try {
			String query = "select * from tbl_information_service_admin_cost where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				informationServiceAdminCost = new InformationServiceAdminCost(rSet.getLong("report_input_form_id"), 
						rSet.getFloat("cost_of_serving_information_request"), rSet.getFloat("cost_of_publishing_information"), 
						rSet.getFloat("revenue_collected_from_users_cover_admin_cost"), rSet.getInt("number_of_information_request_served_free_of_charge"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return informationServiceAdminCost;
	}
	
	public static List<InformationServiceAdminCost> getAllInformationServiceAdminCostsForThisReportForm(long reportInputFormId){
		List<InformationServiceAdminCost> list = new ArrayList<InformationServiceAdminCost>();
		InformationServiceAdminCost informationServiceAdminCost = null;
		try{
			String query = "select * from tbl_information_service_admin_cost where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				informationServiceAdminCost = new InformationServiceAdminCost(rSet.getLong("report_input_form_id"), 
						rSet.getFloat("cost_of_serving_information_request"), rSet.getFloat("cost_of_publishing_information"), 
						rSet.getFloat("revenue_collected_from_users_cover_admin_cost"), rSet.getInt("number_of_information_request_served_free_of_charge"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(informationServiceAdminCost);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
