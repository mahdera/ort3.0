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
public class Region {
	private int id;
	private String regionName;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param regionName
	 */
	public Region(String regionName,int modifiedBy,Date modificationDate) {
		super();
		this.regionName = regionName;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param regionName
	 */
	public Region(int id, String regionName,int modifiedBy,Date modificationDate) {
		super();
		this.id = id;
		this.regionName = regionName;
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
	 * @return the regionName
	 */
	public String getRegionName() {
		return regionName;
	}
	/**
	 * @param regionName the regionName to set
	 */
	public void setRegionName(String regionName) {
		this.regionName = regionName;
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
			String sqlStr = "insert into tbl_region values(?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getRegionName());
			pStmt.setInt(3, this.getModifiedBy());
			pStmt.setDate(4, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Region region){
		try {
			String sqlStr = "update tbl_region set region_name = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, region.getRegionName());
			pStmt.setInt(2, region.getModifiedBy());
			pStmt.setDate(3, region.getModificationDate());
			pStmt.setInt(4, region.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_region where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Region> getAllRegions(){
		List<Region> list = new ArrayList<Region>();
		Region region = null;
		try {
			String query = "select * from tbl_region order by region_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				region = new Region(rSet.getInt("id"),rSet.getString("region_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(region);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Region getRegion(int id){
		Region region = null;
		try {
			String query = "select * from tbl_region where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				region = new Region(rSet.getInt("id"),rSet.getString("region_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return region;
	}
}//end class
