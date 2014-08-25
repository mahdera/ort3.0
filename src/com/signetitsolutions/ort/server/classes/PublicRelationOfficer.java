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
public class PublicRelationOfficer {
	private int id;
	private String fullName;
	private String mobilePhone;
	private String email;
	private int governmentSectorOrganizationId;
	public String pobox;
	public int modifiedBy;
	public Date modificationDate;
	
	
	
	/**
	 * 
	 */
	public PublicRelationOfficer() {
	}
	
	
	
	
	/**
	 * @param fullName
	 * @param mobilePhone
	 * @param email
	 * @param governmentSectorOrganizationId
	 * @param pobox
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public PublicRelationOfficer(String fullName, String mobilePhone,
			String email, int governmentSectorOrganizationId, String pobox,
			int modifiedBy, Date modificationDate) {
		this.fullName = fullName;
		this.mobilePhone = mobilePhone;
		this.email = email;
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
		this.pobox = pobox;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}


	/**
	 * @param id
	 * @param fullName
	 * @param mobilePhone
	 * @param email
	 * @param governmentSectorOrganizationId
	 * @param pobox
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public PublicRelationOfficer(int id, String fullName, String mobilePhone,
			String email, int governmentSectorOrganizationId, String pobox,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.fullName = fullName;
		this.mobilePhone = mobilePhone;
		this.email = email;
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
		this.pobox = pobox;
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
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}
	/**
	 * @param fullName the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	/**
	 * @return the mobilePhone
	 */
	public String getMobilePhone() {
		return mobilePhone;
	}
	/**
	 * @param mobilePhone the mobilePhone to set
	 */
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the governmentSectorOrganizationId
	 */
	public int getGovernmentSectorOrganizationId() {
		return governmentSectorOrganizationId;
	}
	/**
	 * @param governmentSectorOrganizationId the governmentSectorOrganizationId to set
	 */
	public void setGovernmentSectorOrganizationId(int governmentSectorOrganizationId) {
		this.governmentSectorOrganizationId = governmentSectorOrganizationId;
	}
	
	
	
	/**
	 * @return the pobox
	 */
	public String getPobox() {
		return pobox;
	}
	/**
	 * @param pobox the pobox to set
	 */
	public void setPobox(String pobox) {
		this.pobox = pobox;
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
			String sqlStr = "insert into tbl_public_relation_officer values(?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, 0);
			pStmt.setString(2, this.getFullName());
			pStmt.setString(3, this.getMobilePhone());
			pStmt.setString(4, this.getEmail());
			pStmt.setInt(5, this.getGovernmentSectorOrganizationId());
			pStmt.setString(6, this.getPobox());
			pStmt.setInt(7, this.getModifiedBy());
			pStmt.setDate(8, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(PublicRelationOfficer publicRelationOfficer){
		try {
			String sqlStr = "update tbl_public_relation_officer set full_name = ?, mobile_phone = ?,"+
			"email = ?, government_sector_organization_id = ?, pobox = ?, modified_by = ?, modification_date = ? where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, publicRelationOfficer.getFullName());
			pStmt.setString(2, publicRelationOfficer.getMobilePhone());
			pStmt.setString(3, publicRelationOfficer.getEmail());
			pStmt.setInt(4, publicRelationOfficer.getGovernmentSectorOrganizationId());
			pStmt.setString(5, publicRelationOfficer.getPobox());
			pStmt.setInt(6, publicRelationOfficer.getModifiedBy());
			pStmt.setDate(7, publicRelationOfficer.getModificationDate());
			pStmt.setInt(8, publicRelationOfficer.getId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(int id){
		try {
			String sqlStr = "delete from tbl_public_relation_officer where id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, id);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<PublicRelationOfficer> getAllPublicRelationOfficers(){
		List<PublicRelationOfficer> list = new ArrayList<PublicRelationOfficer>();
		PublicRelationOfficer publicRelationOfficer = null;
		try {
			String query = "select * from tbl_public_relation_officer order by full_name";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publicRelationOfficer = new PublicRelationOfficer(rSet.getInt("id"),rSet.getString("full_name"), 
						rSet.getString("mobile_phone"), rSet.getString("email"), rSet.getInt("government_sector_organization_id"),rSet.getString("pobox"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(publicRelationOfficer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static PublicRelationOfficer getpPublicRelationOfficer(int id){
		PublicRelationOfficer publicRelationOfficer = null;
		try {
			String query = "select * from tbl_public_relation_officer where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publicRelationOfficer = new PublicRelationOfficer(rSet.getInt("id"),rSet.getString("full_name"), 
						rSet.getString("mobile_phone"), rSet.getString("email"), rSet.getInt("government_sector_organization_id"),rSet.getString("pobox"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return publicRelationOfficer;
	}
	
		
	public static void updatePublicRelationOfficer(int id,String fullName,String mobilePhone,String email,int organizationId,String pobox){
		try{
			String command = "update tbl_public_relation_officer set full_name='"+fullName+"', mobile_phone ='"+mobilePhone+"', email='"+
		email+"', government_sector_organization_id="+organizationId+", pobox = '"+pobox+"' where id = "+id;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
}//end class
