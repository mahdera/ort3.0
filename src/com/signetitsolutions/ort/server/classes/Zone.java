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
public class Zone {
	private int id;
	private int regionId;
	private String zoneName;
	private int modifiedBy;
	private Date modificationDate;	
	/**
	 * 
	 */
	public Zone() {
	}
	
	/**
	 * @param regionId
	 * @param zoneName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Zone(int regionId, String zoneName, int modifiedBy,
			Date modificationDate) {
		this.regionId = regionId;
		this.zoneName = zoneName;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param regionId
	 * @param zoneName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Zone(int id, int regionId, String zoneName, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.regionId = regionId;
		this.zoneName = zoneName;
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
	 * @return the regionId
	 */
	public int getRegionId() {
		return regionId;
	}
	/**
	 * @param regionId the regionId to set
	 */
	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}
	/**
	 * @return the zoneName
	 */
	public String getZoneName() {
		return zoneName;
	}
	/**
	 * @param zoneName the zoneName to set
	 */
	public void setZoneName(String zoneName) {
		this.zoneName = zoneName;
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
			String sqlStr = "insert into tbl_zone values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getRegionId());
			pStmt.setString(3, this.getZoneName());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Zone zone){
		try {
			String sqlStr = "update tbl_zone set region_id = ?, zone_name = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, zone.getRegionId());
			pStmt.setString(2, zone.getZoneName());
			pStmt.setInt(3, zone.getModifiedBy());
			pStmt.setDate(4, zone.getModificationDate());
			pStmt.setInt(5, zone.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_zone where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Zone> getAllZones(){
		List<Zone> list = new ArrayList<Zone>();
		Zone zone = null;
		try {
			String query = "select * from tbl_zone order by zone_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				zone = new Zone(rSet.getInt("id"),rSet.getInt("region_id"),rSet.getString("zone_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(zone);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Zone> getAllZonesOfThisRegion(int regionId){
		List<Zone> list = new ArrayList<Zone>();
		Zone zone = null;
		try {
			String query = "select * from tbl_zone where region_id = "+regionId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				zone = new Zone(rSet.getInt("id"),rSet.getInt("region_id"),rSet.getString("zone_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(zone);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Zone getZone(int id){
		Zone zone = null;
		try {
			String query = "select * from tbl_zone where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				zone = new Zone(rSet.getInt("id"),rSet.getInt("region_id"),rSet.getString("zone_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return zone;
	}
}//end class
