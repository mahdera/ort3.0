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
public class Branch {
	private int id;
	private String branchName;
	private String description;
	private int regionId;
	private int modifiedBy;
	private Date modificationDate;

	

	/**
	 * 
	 */
	public Branch() {
	}
	
	

	/**
	 * @param branchName
	 * @param description
	 * @param regionId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Branch(String branchName, String description, int regionId,
			int modifiedBy, Date modificationDate) {
		this.branchName = branchName;
		this.description = description;
		this.regionId = regionId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}


	

	/**
	 * @param id
	 * @param branchName
	 * @param description
	 * @param regionId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Branch(int id, String branchName, String description, int regionId,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.branchName = branchName;
		this.description = description;
		this.regionId = regionId;
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
	 * @return the branchName
	 */
	public String getBranchName() {
		return branchName;
	}

	/**
	 * @param branchName
	 *            the branchName to set
	 */
	public void setBranchName(String branchName) {
		this.branchName = branchName;
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
	 * @return the regionId
	 */
	public int getRegionId() {
		return regionId;
	}

	/**
	 * @param regionId
	 *            the regionId to set
	 */
	public void setRegionId(int regionId) {
		this.regionId = regionId;
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
			String sqlStr = "insert into tbl_branch values(?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getBranchName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getRegionId());
			pStmt.setInt(5, this.getModifiedBy());
			pStmt.setDate(6, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Branch branch) {
		try {
			String sqlStr = "update tbl_branch set branch_name = ?, description= ?, region_id = ?,"+
		 " modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, branch.getBranchName());
			pStmt.setString(2, branch.getDescription());
			pStmt.setInt(3, branch.getRegionId());
			pStmt.setInt(4, branch.getModifiedBy());
			pStmt.setDate(5, branch.getModificationDate());
			pStmt.setInt(6, branch.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_branch where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Branch> getAllBranchs() {
		List<Branch> list = new ArrayList<Branch>();
		Branch branch = null;
		try {
			String query = "select * from tbl_branch order by branch_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				branch = new Branch(rSet.getInt("id"),rSet.getString("branch_name"),rSet.getString("description"),
						rSet.getInt("region_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(branch);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Branch getBranch(int id) {
		Branch branch = null;
		try {
			String query = "select * from tbl_branch where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				branch = new Branch(rSet.getInt("id"),rSet.getString("branch_name"),rSet.getString("description"),
						rSet.getInt("region_id"),rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return branch;
	}
}// end class
