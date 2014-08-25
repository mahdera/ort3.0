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
 * @author TOSHIBA
 * 
 */
public class UmbudsmanReportingOffice {
	private int id;
	private String reportingOfficeName;
	private String description;
	private int branchId;
	private int modifiedBy;
	private Date modificationDate;

	

	/**
	 * 
	 */
	public UmbudsmanReportingOffice() {
	}
	
	

	/**
	 * @param reportingOfficeName
	 * @param description
	 * @param branchId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public UmbudsmanReportingOffice(String reportingOfficeName,
			String description, int branchId, int modifiedBy,
			Date modificationDate) {
		this.reportingOfficeName = reportingOfficeName;
		this.description = description;
		this.branchId = branchId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	

	/**
	 * @param id
	 * @param reportingOfficeName
	 * @param description
	 * @param branchId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public UmbudsmanReportingOffice(int id, String reportingOfficeName,
			String description, int branchId, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.reportingOfficeName = reportingOfficeName;
		this.description = description;
		this.branchId = branchId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}



	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the reportingOfficeName
	 */
	public String getReportingOfficeName() {
		return reportingOfficeName;
	}

	/**
	 * @param reportingOfficeName
	 *            the reportingOfficeName to set
	 */
	public void setReportingOfficeName(String reportingOfficeName) {
		this.reportingOfficeName = reportingOfficeName;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the branchId
	 */
	public int getBranchId() {
		return branchId;
	}

	/**
	 * @param branchId
	 *            the branchId to set
	 */
	public void setBranchId(int branchId) {
		this.branchId = branchId;
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
			String sqlStr = "insert into tbl_umbudsman_reporting_office values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getReportingOfficeName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getBranchId());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(UmbudsmanReportingOffice umbudsmanReportingOffice) {
		try {
			String sqlStr = "update tbl_umbudsman_reporting_office set reporting_office_name = ?,"+
				"description = ?, branch_id = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, umbudsmanReportingOffice.getReportingOfficeName());
			pStmt.setString(2, umbudsmanReportingOffice.getDescription());
			pStmt.setInt(3, umbudsmanReportingOffice.getBranchId());
			pStmt.setInt(4, umbudsmanReportingOffice.getModifiedBy());
			pStmt.setDate(5, umbudsmanReportingOffice.getModificationDate());
			pStmt.setInt(6, umbudsmanReportingOffice.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_umbudsman_reporting_office where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<UmbudsmanReportingOffice> getAllllUmbudsmanReportingOffices() {
		List<UmbudsmanReportingOffice> list = new ArrayList<UmbudsmanReportingOffice>();
		UmbudsmanReportingOffice umbudsmanReprtingOffice = null;
		try {
			String query = "select * from tbl_umbudsman_reporting_office order by reporting_office_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				umbudsmanReprtingOffice = new UmbudsmanReportingOffice(
						rSet.getInt("id"),
						rSet.getString("reporting_office_name"),
						rSet.getString("description"), rSet.getInt("branch_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(umbudsmanReprtingOffice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static UmbudsmanReportingOffice getUmbudsmanReportingOffice(int id) {
		UmbudsmanReportingOffice umbudsmanReprtingOffice = null;
		try {
			String query = "select * from tbl_umbudsman_reporting_office where id = "
					+ id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while (rSet.next()) {
				umbudsmanReprtingOffice = new UmbudsmanReportingOffice(
						rSet.getInt("id"),
						rSet.getString("reporting_office_name"),
						rSet.getString("description"), rSet.getInt("branch_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return umbudsmanReprtingOffice;
	}
}// end class
