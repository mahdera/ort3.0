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
public class Kebele {
	private int id;
	private int woredaId;
	private String kebeleName;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * @param woredaId
	 * @param kebeleName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Kebele(int woredaId, String kebeleName,int modifiedBy,Date modificationDate) {
		this.woredaId = woredaId;
		this.kebeleName = kebeleName;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	/**
	 * @param id
	 * @param woredaId
	 * @param kebeleName
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Kebele(int id, int woredaId, String kebeleName, int modifiedBy, Date modificationDate) {
		this.id = id;
		this.woredaId = woredaId;
		this.kebeleName = kebeleName;
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
	 * @return the woredaId
	 */
	public int getWoredaId() {
		return woredaId;
	}

	/**
	 * @param woredaId
	 *            the woredaId to set
	 */
	public void setWoredaId(int woredaId) {
		this.woredaId = woredaId;
	}

	/**
	 * @return the kebeleName
	 */
	public String getKebeleName() {
		return kebeleName;
	}

	/**
	 * @param kebeleName
	 *            the kebeleName to set
	 */
	public void setKebeleName(String kebeleName) {
		this.kebeleName = kebeleName;
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
			String sqlStr = "insert into tbl_kebele values(?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setInt(2, this.getWoredaId());
			pStmt.setString(3, this.getKebeleName());
			pStmt.setInt(4, this.getModifiedBy());
			pStmt.setDate(5, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(Kebele kebele) {
		try {
			String sqlStr = "update tbl_kebele set woreda_id = ?, kebele_name = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, kebele.getWoredaId());
			pStmt.setString(2, kebele.getKebeleName());
			pStmt.setInt(3, kebele.getModifiedBy());
			pStmt.setDate(4, kebele.getModificationDate());
			pStmt.setInt(5, kebele.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(int id) {
		try {
			String sqlStr = "delete from tbl_kebele where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<Kebele> getAllKebeles() {
		List<Kebele> list = new ArrayList<Kebele>();
		Kebele kebele = null;
		try {
			String query = "select * from tbl_kebele order by kebele_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				kebele = new Kebele(rSet.getInt("id"), rSet.getInt("woreda_id"), rSet.getString("kebele_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(kebele);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<Kebele> getAllKebelesOfThisWoreda(int woredaId){
		List<Kebele> list = new ArrayList<Kebele>();
		Kebele kebele = null;
		try {
			String query = "select * from tbl_kebele where woreda_id = "+woredaId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				kebele = new Kebele(rSet.getInt("id"), rSet.getInt("woreda_id"), rSet.getString("kebele_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(kebele);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static Kebele getKebele(int id) {
		Kebele kebele = null;
		try {
			String query = "select * from tbl_kebele where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				kebele = new Kebele(rSet.getInt("id"), rSet.getInt("woreda_id"), rSet.getString("kebele_name"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return kebele;
	}
}// end class
