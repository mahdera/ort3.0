package com.signetitsolutions.ort.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SectorCategory {
	private int id;
	private String sectorName;
	private String description;
	private int modifiedBy;
	private Date modificationDate;
	
	
	
	
	/**
	 * 
	 */
	public SectorCategory() {
	}
	
	
	
	
	/**
	 * @param sectorName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public SectorCategory(String sectorName, String description,
			int modifiedBy, Date modificationDate) {
		this.sectorName = sectorName;
		this.description = description;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	


	/**
	 * @param id
	 * @param sectorName
	 * @param description
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public SectorCategory(int id, String sectorName, String description,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.sectorName = sectorName;
		this.description = description;
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
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the sectorName
	 */
	public String getSectorName() {
		return sectorName;
	}
	/**
	 * @param sectorName the sectorName to set
	 */
	public void setSectorName(String sectorName) {
		this.sectorName = sectorName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
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
			String sqlStr = "insert into tbl_sector_category values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getSectorName());
			pStmt.setString(3, this.getDescription());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(SectorCategory sectorCategory){
		try {
			String sqlStr = "update tbl_sector_category set sector_name = ?, description = ?,"+
		"modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, sectorCategory.getSectorName());
			pStmt.setString(2, sectorCategory.getDescription());
			pStmt.setInt(3, sectorCategory.getModifiedBy());
			pStmt.setDate(4, sectorCategory.getModificationDate());
			pStmt.setInt(5, sectorCategory.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_sector_category where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<SectorCategory> getAllSectorCategories(){
		List<SectorCategory> list = new ArrayList<SectorCategory>();
		SectorCategory sectorCategory = null;
		try {
			String query = "select * from tbl_sector_category order by sector_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				sectorCategory = new SectorCategory(rSet.getInt("id"), rSet.getString("sector_name"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(sectorCategory);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static SectorCategory getSectorCategory(int id){
		SectorCategory sectorCategory = null;
		try {
			String query = "select * from tbl_sector_category where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				sectorCategory = new SectorCategory(rSet.getInt("id"), rSet.getString("sector_name"), rSet.getString("description"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return sectorCategory;
	}
}//end class
