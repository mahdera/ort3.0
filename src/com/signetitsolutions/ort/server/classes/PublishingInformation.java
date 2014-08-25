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
public class PublishingInformation {
	private long reportInputFormId;
	private int yearlyNumberOfPublication;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * @param reportInputFormId
	 * @param yearlyNumberOfPublication
	 */
	public PublishingInformation(long reportInputFormId,
			int yearlyNumberOfPublication,int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.yearlyNumberOfPublication = yearlyNumberOfPublication;
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
	 * @param reportInputFormId
	 *            the reportInputFormId to set
	 */
	public void setReportInputFormId(long reportInputFormId) {
		this.reportInputFormId = reportInputFormId;
	}

	/**
	 * @return the yearlyNumberOfPublication
	 */
	public int getYearlyNumberOfPublication() {
		return yearlyNumberOfPublication;
	}

	/**
	 * @param yearlyNumberOfPublication
	 *            the yearlyNumberOfPublication to set
	 */
	public void setYearlyNumberOfPublication(int yearlyNumberOfPublication) {
		this.yearlyNumberOfPublication = yearlyNumberOfPublication;
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
			String sqlStr = "insert into tbl_publishing_information values(?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getYearlyNumberOfPublication());
			pStmt.setInt(3, this.getModifiedBy());
			pStmt.setDate(4, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(PublishingInformation publishingInformation) {
		try {
			String sqlStr = "update tbl_publishing_information set yearly_number_of_publication = ?,"+
		"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, publishingInformation.getYearlyNumberOfPublication());
			pStmt.setInt(2, publishingInformation.getModifiedBy());
			pStmt.setDate(3, publishingInformation.getModificationDate());
			pStmt.setLong(4, publishingInformation.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_publishing_information where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PublishingInformation> getAllPublishingInformations() {
		List<PublishingInformation> list = new ArrayList<PublishingInformation>();
		PublishingInformation publishingInformation = null;
		try {
			String query = "select * from tbl_publishing_information";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publishingInformation = new PublishingInformation(rSet.getLong("report_input_form_id"), rSet.getInt("yearly_number_of_publication"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(publishingInformation);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PublishingInformation getPublishingInformation(long reportInputFormId) {
		PublishingInformation publishingInformation = null;
		try {
			String query = "select * from tbl_publishing_information where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publishingInformation = new PublishingInformation(rSet.getLong("report_input_form_id"), rSet.getInt("yearly_number_of_publication"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return publishingInformation;
	}
}// end class
