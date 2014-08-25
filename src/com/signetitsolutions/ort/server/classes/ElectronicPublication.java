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
public class ElectronicPublication {
	private long reportInputFormId;
	private int cdAmount;
	private int dvdAmount;
	private int floppyDiskAmount;
	private int webAmount;
	private int socialMediaAmount;
	private int others;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * @param reportInputFormId
	 * @param cdAmount
	 * @param dvdAmount
	 * @param floppyDiskAmount
	 * @param webAmount
	 * @param socialMediaAmount
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ElectronicPublication(long reportInputFormId, int cdAmount,
			int dvdAmount, int floppyDiskAmount, int webAmount,
			int socialMediaAmount,int others,int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.cdAmount = cdAmount;
		this.dvdAmount = dvdAmount;
		this.floppyDiskAmount = floppyDiskAmount;
		this.webAmount = webAmount;
		this.socialMediaAmount = socialMediaAmount;
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
	 * @return the cdAmount
	 */
	public int getCdAmount() {
		return cdAmount;
	}
	/**
	 * @param cdAmount the cdAmount to set
	 */
	public void setCdAmount(int cdAmount) {
		this.cdAmount = cdAmount;
	}
	/**
	 * @return the dvdAmount
	 */
	public int getDvdAmount() {
		return dvdAmount;
	}
	/**
	 * @param dvdAmount the dvdAmount to set
	 */
	public void setDvdAmount(int dvdAmount) {
		this.dvdAmount = dvdAmount;
	}
	/**
	 * @return the floppyDiskAmount
	 */
	public int getFloppyDiskAmount() {
		return floppyDiskAmount;
	}
	/**
	 * @param floppyDiskAmount the floppyDiskAmount to set
	 */
	public void setFloppyDiskAmount(int floppyDiskAmount) {
		this.floppyDiskAmount = floppyDiskAmount;
	}
	/**
	 * @return the webAmount
	 */
	public int getWebAmount() {
		return webAmount;
	}
	/**
	 * @param webAmount the webAmount to set
	 */
	public void setWebAmount(int webAmount) {
		this.webAmount = webAmount;
	}
	/**
	 * @return the socialMediaAmount
	 */
	public int getSocialMediaAmount() {
		return socialMediaAmount;
	}
	/**
	 * @param socialMediaAmount the socialMediaAmount to set
	 */
	public void setSocialMediaAmount(int socialMediaAmount) {
		this.socialMediaAmount = socialMediaAmount;
	}
	
	
	
	/**
	 * @return the others
	 */
	public int getOthers() {
		return others;
	}
	/**
	 * @param others the others to set
	 */
	public void setOthers(int others) {
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
			String sqlStr = "insert into tbl_electronic_publication values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getCdAmount());
			pStmt.setInt(3, this.getDvdAmount());
			pStmt.setInt(4, this.getFloppyDiskAmount());
			pStmt.setInt(5, this.getWebAmount());
			pStmt.setInt(6, this.getSocialMediaAmount());
			pStmt.setInt(7, this.getOthers());
			pStmt.setInt(8, this.getModifiedBy());
			pStmt.setDate(9, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ElectronicPublication electronicPublication){
		try {
			String sqlStr = "update tbl_electronic_publication set cd_amount = ?, dvd_amount = ?,"+
		"floppy_disk_amount = ?, web_amount = ?, social_media_amount = ?, others = ?,"+
		"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, electronicPublication.getCdAmount());
			pStmt.setInt(2, electronicPublication.getDvdAmount());
			pStmt.setInt(3, electronicPublication.getFloppyDiskAmount());
			pStmt.setInt(4, electronicPublication.getWebAmount());
			pStmt.setInt(5, electronicPublication.getSocialMediaAmount());
			pStmt.setInt(6, electronicPublication.getOthers());
			pStmt.setInt(7, electronicPublication.getModifiedBy());
			pStmt.setDate(8, electronicPublication.getModificationDate());
			pStmt.setLong(9, electronicPublication.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_electronic_publication where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ElectronicPublication> getAllElectronicPublications(){
		List<ElectronicPublication> list = new ArrayList<ElectronicPublication>();
		ElectronicPublication electronicPublication = null;
		try {
			String query = "select * from tbl_electronic_publication";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				electronicPublication = new ElectronicPublication(rSet.getLong("report_input_form_id"), rSet.getInt("cd_amount"), rSet.getInt("dvd_amount"), 
						rSet.getInt("floppy_disk_amount"), rSet.getInt("web_amount"), rSet.getInt("social_media_amount"),rSet.getInt("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(electronicPublication);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ElectronicPublication getElectronicPublication(long reportInputFormId){
		ElectronicPublication electronicPublication = null;
		try {
			String query = "select * from tbl_electronic_publication where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				electronicPublication = new ElectronicPublication(rSet.getLong("report_input_form_id"), rSet.getInt("cd_amount"), rSet.getInt("dvd_amount"), 
						rSet.getInt("floppy_disk_amount"), rSet.getInt("web_amount"), rSet.getInt("social_media_amount"),rSet.getInt("others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return electronicPublication;
	}
}//end class
