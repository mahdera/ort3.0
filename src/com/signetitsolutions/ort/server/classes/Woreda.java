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
public class Woreda {
	private int id;
	private int zoneId;
	private String woredaName;
	private int modifiedBy;
	private Date modificationDate;
	
	
	
	/**
	 * 
	 */
	public Woreda() {
	}
	
	
	/**
	 * @param zoneId
	 * @param woredaName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Woreda(int zoneId, String woredaName, int modifiedBy,
			Date modificationDate) {
		this.zoneId = zoneId;
		this.woredaName = woredaName;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	


	/**
	 * @param id
	 * @param zoneId
	 * @param woredaName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Woreda(int id, int zoneId, String woredaName, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.zoneId = zoneId;
		this.woredaName = woredaName;
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
	 * @return the zoneId
	 */
	public int getZoneId() {
		return zoneId;
	}
	/**
	 * @param zoneId the zoneId to set
	 */
	public void setZoneId(int zoneId) {
		this.zoneId = zoneId;
	}
	/**
	 * @return the woredaName
	 */
	public String getWoredaName() {
		return woredaName;
	}
	/**
	 * @param woredaName the woredaName to set
	 */
	public void setWoredaName(String woredaName) {
		this.woredaName = woredaName;
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
			String sqlStr = "insert into tbl_woreda values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getZoneId());
			pStmt.setString(3, this.getWoredaName());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(Woreda woreda){
		try {
			String sqlStr = "update tbl_woreda set zone_id = ?, woreda_name = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, woreda.getZoneId());
			pStmt.setString(2, woreda.getWoredaName());
			pStmt.setInt(3, woreda.getModifiedBy());
			pStmt.setDate(4, woreda.getModificationDate());
			pStmt.setInt(5, woreda.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String command = "delete from tbl_woreda where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<Woreda> getAllWoredas(){
		List<Woreda> list = new ArrayList<Woreda>();
		Woreda woreda = null;
		try {
			String query = "select * from tbl_woreda order by woreda_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				woreda = new Woreda(rSet.getInt("id"),rSet.getInt("zone_id"),rSet.getString("woreda_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(woreda);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Woreda> getAllWoredasOfThisZone(int zoneId){
		List<Woreda> list = new ArrayList<Woreda>();
		Woreda woreda = null;
		try {
			String query = "select * from tbl_woreda where zone_id = "+zoneId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				woreda = new Woreda(rSet.getInt("id"),rSet.getInt("zone_id"),rSet.getString("woreda_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(woreda);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Woreda getWoreda(int id){
		Woreda woreda = null;
		try {
			String query = "select * from tbl_woreda where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				woreda = new Woreda(rSet.getInt("id"),rSet.getInt("zone_id"),rSet.getString("woreda_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return woreda;
	}
}//end class
