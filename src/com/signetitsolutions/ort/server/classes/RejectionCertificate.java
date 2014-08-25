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
public class RejectionCertificate {
	private long reportInputFormId;
	private int numberOfSecretInformationGivenRejectionCertificate;
	private int modifiedBy;
	private Date modificationDate;
	
	/**
	 * @param reportInputFormId
	 * @param numberOfSecretInformationGivenRejectionCertificate
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public RejectionCertificate(long reportInputFormId,
			int numberOfSecretInformationGivenRejectionCertificate,int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.numberOfSecretInformationGivenRejectionCertificate = numberOfSecretInformationGivenRejectionCertificate;
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
	 * @return the numberOfSecretInformationGivenRejectionCertificate
	 */
	public int getNumberOfSecretInformationGivenRejectionCertificate() {
		return numberOfSecretInformationGivenRejectionCertificate;
	}

	/**
	 * @param numberOfSecretInformationGivenRejectionCertificate
	 *            the numberOfSecretInformationGivenRejectionCertificate to set
	 */
	public void setNumberOfSecretInformationGivenRejectionCertificate(
			int numberOfSecretInformationGivenRejectionCertificate) {
		this.numberOfSecretInformationGivenRejectionCertificate = numberOfSecretInformationGivenRejectionCertificate;
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
			String sqlStr = "insert into tbl_rejection_certificate values(?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getNumberOfSecretInformationGivenRejectionCertificate());
			pStmt.setInt(3, this.getModifiedBy());
			pStmt.setDate(4, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(RejectionCertificate rejectionCertificate) {
		try {
			String sqlStr = "update tbl_rejection_certificate set number_of_secrete_information_given_rejection_certificate = ?,"+
		"modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, rejectionCertificate.getNumberOfSecretInformationGivenRejectionCertificate());
			pStmt.setInt(2, rejectionCertificate.getModifiedBy());
			pStmt.setDate(3, rejectionCertificate.getModificationDate());
			pStmt.setLong(4, rejectionCertificate.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_rejection_certificate where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<RejectionCertificate> getallRejectionCertificates() {
		List<RejectionCertificate> list = new ArrayList<RejectionCertificate>();
		RejectionCertificate rejectionCertificate = null;
		try {
			String query = "select * from tbl_rejection_certificate";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				rejectionCertificate = new RejectionCertificate(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_secrete_information_given_rejection_certificate"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(rejectionCertificate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static RejectionCertificate getRejectionCertificate(long reportInputFormId) {
		RejectionCertificate rejectionCertificate = null;
		try {
			String query = "select * from tbl_rejection_certificate where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				rejectionCertificate = new RejectionCertificate(rSet.getLong("report_input_form_id"), rSet.getInt("number_of_secrete_information_given_rejection_certificate"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return rejectionCertificate;
	}
}// end class
