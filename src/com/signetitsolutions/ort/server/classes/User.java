/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mahder
 * 
 */
public class User {
	private int id;
	private String firstName;	
	private String lastName;
	private String userType;
	private int prId;
	private int ombudsmanReportingOfficeId;
	private int modifiedBy;
	private Date modificationDate;
	

	/**
	 * 
	 */
	public User() {
	}
	
	

	/**
	 * @param firstName
	 * @param lastName
	 * @param userType
	 * @param prId
	 * @param ombudsmanReportingOfficeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public User(String firstName, String lastName, String userType, int prId,
			int ombudsmanReportingOfficeId, int modifiedBy,
			Date modificationDate) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.userType = userType;
		this.prId = prId;
		this.ombudsmanReportingOfficeId = ombudsmanReportingOfficeId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	/**
	 * @param id
	 * @param firstName
	 * @param lastName
	 * @param userType
	 * @param prId
	 * @param ombudsmanReportingOfficeId
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public User(int id, String firstName, String lastName, String userType,
			int prId, int ombudsmanReportingOfficeId, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userType = userType;
		this.prId = prId;
		this.ombudsmanReportingOfficeId = ombudsmanReportingOfficeId;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}



	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
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
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	

	/**
	 * @return the prId
	 */
	public int getPrId() {
		return prId;
	}



	/**
	 * @param prId the prId to set
	 */
	public void setPrId(int prId) {
		this.prId = prId;
	}



	/**
	 * @return the ombudsmanReportingOfficeId
	 */
	public int getOmbudsmanReportingOfficeId() {
		return ombudsmanReportingOfficeId;
	}



	/**
	 * @param ombudsmanReportingOfficeId the ombudsmanReportingOfficeId to set
	 */
	public void setOmbudsmanReportingOfficeId(int ombudsmanReportingOfficeId) {
		this.ombudsmanReportingOfficeId = ombudsmanReportingOfficeId;
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
			String command = null;
			if(getUserType().equalsIgnoreCase("Public Relation Officer")){
				command = "insert into tbl_user(id,first_name,last_name,user_type,pr_id,modified_by,modification_date) values(0,'"+this.getFirstName()+"','"+this.getLastName()+"','"+
				this.getUserType()+"',"+this.getPrId()+","+this.getModifiedBy()+",'"+this.getModificationDate()+"')";
			}else if(getUserType().equalsIgnoreCase("Umbudsman Reporting Officer")){
				command = "insert into tbl_user(id,first_name,last_name,user_type,ombudsman_reporting_office_id,modified_by,modification_date) values(0,'"+this.getFirstName()+"','"+this.getLastName()+"','"+
				this.getUserType()+"',"+this.getOmbudsmanReportingOfficeId()+","+this.getModifiedBy()+",'"+this.getModificationDate()+"')";
			}else if(getUserType().equalsIgnoreCase("System Administrator")){
				command = "insert into tbl_user(id,first_name,last_name,user_type,modified_by,modification_date) values(0,'"+this.getFirstName()+"','"+this.getLastName()+"','"+
				this.getUserType()+"',"+this.getModifiedBy()+",'"+this.getModificationDate()+"')";
			}			
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateUser(int id,String firstName,
			String fatherName,String userType,int prId,int umbudsmanOfficeId) {
		try {
			String command = "update tbl_user set first_name='"+
			firstName+"', last_name='"+fatherName+"', user_type = '"+userType+"', pr_id="+prId+", ombudsman_reporting_office_id = "+umbudsmanOfficeId+" where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void updateUser(int userId,String firstName,String lastName,String userType){
		try{
			String command = "update tbl_user set first_name='"+firstName+"', last_name='"+
		lastName+"', user_type = '"+userType+"' where id = "+userId;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}

	public static void deleteUser(int id) {
		try {
			String command = "delete from tbl_user where id = "+id;
			DBConnection.writeToDatabase(command);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<User> getAllUsers() {
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static User getUser(int id) {
		User user = null;
		try {
			String query = "select * from tbl_user where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static User getUserWith(String firstName,String fatherName,String grandFatherName,String userType) {
		User user = null;
		try {
			String query = "select * from tbl_user where first_name='"+firstName+"' and "+
			"middle_name='"+fatherName+"' and last_name='"+grandFatherName+"' and user_type='"+userType+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static User getUserWith(String firstName,String fatherName,String userType) {
		User user = null;
		try {
			String query = "select * from tbl_user where first_name='"+firstName+"' and "+
			"last_name='"+fatherName+"' and user_type='"+userType+"'";
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return user;
	}
	
	public static List<User> getAllUsersWithUserType(String userType){
		List<User> list = new ArrayList<User>();
		User user = null;
		try {
			String query = "select * from tbl_user where user_type = '"+userType+"'";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static List<User> getAllUsersWithThisUserTypeInThisBranch(String userType,int branchId){
		List<User> list = new ArrayList<User>();
		User user = null;
		try{
			String query = "select * from tbl_user where user_type='"+userType+"' and branch_id="+branchId;
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				user = new User(rSet.getInt("id"),rSet.getString("first_name"),
						rSet.getString("last_name"),rSet.getString("user_type"),rSet.getInt("pr_id"),rSet.getInt("ombudsman_reporting_office_id"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}// end class
