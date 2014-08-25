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
public class BroadCast {
	private long reportInputFormId;
	private int radioAmount;
	private float radioAirUsage;
	private int televisionAmount;
	private float televisionAirUsage;
	private int othersAmount;
	private float othersAirUsage;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * @param reportInputFormId
	 * @param radioAmount
	 * @param radioAirUsage
	 * @param televisionAmount
	 * @param televisionAirUsage
	 * @param othersAmount
	 * @param othersAirUsage
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public BroadCast(long reportInputFormId, int radioAmount,
			float radioAirUsage, int televisionAmount,
			float televisionAirUsage, int othersAmount, float othersAirUsage,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.radioAmount = radioAmount;
		this.radioAirUsage = radioAirUsage;
		this.televisionAmount = televisionAmount;
		this.televisionAirUsage = televisionAirUsage;
		this.othersAmount = othersAmount;
		this.othersAirUsage = othersAirUsage;
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
	 * @return the radioAmount
	 */
	public int getRadioAmount() {
		return radioAmount;
	}
	/**
	 * @param radioAmount the radioAmount to set
	 */
	public void setRadioAmount(int radioAmount) {
		this.radioAmount = radioAmount;
	}
	/**
	 * @return the radioAirUsage
	 */
	public float getRadioAirUsage() {
		return radioAirUsage;
	}
	/**
	 * @param radioAirUsage the radioAirUsage to set
	 */
	public void setRadioAirUsage(float radioAirUsage) {
		this.radioAirUsage = radioAirUsage;
	}
	/**
	 * @return the televisionAmount
	 */
	public int getTelevisionAmount() {
		return televisionAmount;
	}
	/**
	 * @param televisionAmount the televisionAmount to set
	 */
	public void setTelevisionAmount(int televisionAmount) {
		this.televisionAmount = televisionAmount;
	}
	/**
	 * @return the televisionAirUsage
	 */
	public float getTelevisionAirUsage() {
		return televisionAirUsage;
	}
	/**
	 * @param televisionAirUsage the televisionAirUsage to set
	 */
	public void setTelevisionAirUsage(float televisionAirUsage) {
		this.televisionAirUsage = televisionAirUsage;
	}
	/**
	 * @return the othersAmount
	 */
	public int getOthersAmount() {
		return othersAmount;
	}
	/**
	 * @param othersAmount the othersAmount to set
	 */
	public void setOthersAmount(int othersAmount) {
		this.othersAmount = othersAmount;
	}
	/**
	 * @return the othersAirUsage
	 */
	public float getOthersAirUsage() {
		return othersAirUsage;
	}
	/**
	 * @param othersAirUsage the othersAirUsage to set
	 */
	public void setOthersAirUsage(float othersAirUsage) {
		this.othersAirUsage = othersAirUsage;
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
			String sqlStr = "insert into tbl_broadcast values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getRadioAmount());
			pStmt.setFloat(3, this.getRadioAirUsage());
			pStmt.setInt(4, this.getTelevisionAmount());
			pStmt.setFloat(5, this.getTelevisionAirUsage());
			pStmt.setInt(6, this.getOthersAmount());
			pStmt.setFloat(7, this.getOthersAirUsage());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(BroadCast broadCast){
		try {
			String sqlStr = "update tbl_broadcast set radio_amount = ?, radio_air_usage = ?, television_amount = ?,"+
		" television_air_usage = ?, others_amount = ?, others_air_usage = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, broadCast.getRadioAmount());
			pStmt.setFloat(2, broadCast.getRadioAirUsage());
			pStmt.setInt(3, broadCast.getTelevisionAmount());
			pStmt.setFloat(4, broadCast.getTelevisionAirUsage());
			pStmt.setInt(5, broadCast.getOthersAmount());
			pStmt.setFloat(6, broadCast.getOthersAirUsage());
			pStmt.setInt(7, broadCast.getModifiedBy());
			pStmt.setDate(8, broadCast.getModificationDate());
			pStmt.setLong(9, broadCast.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_broadcast where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<BroadCast> getAllBroadCast(){
		List<BroadCast> list = new ArrayList<BroadCast>();
		BroadCast broadcast = null;
		try {
			String query = "select * from tbl_broadcast";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				broadcast = new BroadCast(rSet.getLong("report_input_form_id"), rSet.getInt("radio_amount"), rSet.getFloat("radio_air_usage"), 
						rSet.getInt("television_amount"), rSet.getFloat("television_air_usage"), rSet.getInt("others_amount"), rSet.getFloat("others_air_usage"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(broadcast);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static BroadCast getBroadCast(long reportInputFormId){
		BroadCast broadcast = null;
		try {
			String query = "select * from tbl_broadcast where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				broadcast = new BroadCast(rSet.getLong("report_input_form_id"), rSet.getInt("radio_amount"), rSet.getFloat("radio_air_usage"), 
						rSet.getInt("television_amount"), rSet.getFloat("television_air_usage"), rSet.getInt("others_amount"), rSet.getFloat("others_air_usage"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return broadcast;
	}
}//end class
