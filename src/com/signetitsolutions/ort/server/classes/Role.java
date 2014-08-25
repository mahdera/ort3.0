/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;





/**
 * @author mahder
 *
 */
public class Role {
	 	private int id;
	    private int accountId;
	    private boolean readable;
	    private boolean writable;
	    private boolean updateable;
	    private boolean deletable;
	    private int functionalityId;
	    private int modifiedBy;
	    private Date modificationDate;

	    public Role() {
	    }

	    public Role(int accountId, boolean readable, boolean writable, boolean updateable, boolean deletable, int functionalityId,
	    		int modifiedBy,Date modificationDate) {
	        this.accountId = accountId;
	        this.readable = readable;
	        this.writable = writable;
	        this.updateable = updateable;
	        this.deletable = deletable;
	        this.functionalityId = functionalityId;
	        this.modifiedBy = modifiedBy;
	        this.modificationDate = modificationDate;
	    }

	    public Role(int id, int accountId, boolean readable, boolean writable, boolean updateable, boolean deletable, int functionalityId,
	    		int modifiedBy,Date modificationDate) {
	        this.id = id;
	        this.accountId = accountId;
	        this.readable = readable;
	        this.writable = writable;
	        this.updateable = updateable;
	        this.deletable = deletable;
	        this.functionalityId = functionalityId;
	        this.modifiedBy = modifiedBy;
	        this.modificationDate = modificationDate;
	    }

	    public int getAccountId() {
	        return accountId;
	    }

	    public void setAccountId(int accountId) {
	        this.accountId = accountId;
	    }

	    public boolean isDeletable() {
	        return deletable;
	    }

	    public void setDeletable(boolean deletable) {
	        this.deletable = deletable;
	    }

	    

	    /**
		 * @return the functionalityId
		 */
		public int getFunctionalityId() {
			return functionalityId;
		}

		/**
		 * @param functionalityId the functionalityId to set
		 */
		public void setFunctionalityId(int functionalityId) {
			this.functionalityId = functionalityId;
		}

		public boolean isReadable() {
	        return readable;
	    }

	    public void setReadable(boolean readable) {
	        this.readable = readable;
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

		public boolean isUpdateable() {
	        return updateable;
	    }

	    public void setUpdateable(boolean updateable) {
	        this.updateable = updateable;
	    }

	    public boolean isWritable() {
	        return writable;
	    }

	    public void setWritable(boolean writable) {
	        this.writable = writable;
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
	            String sqlStr = "INSERT INTO tbl_role VALUES(?,?,?,?,?,?,?,?,?)";	            
	            PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
	            pStmt.setInt(1, 0);
	            pStmt.setInt(2, this.getAccountId());
	            pStmt.setBoolean(3, this.isReadable());
	            pStmt.setBoolean(4, this.isWritable());
	            pStmt.setBoolean(5, this.isUpdateable());
	            pStmt.setBoolean(6, this.isDeletable());
	            pStmt.setInt(7, this.getFunctionalityId());
	            pStmt.setInt(8, this.getModifiedBy());
	            pStmt.setDate(9, this.getModificationDate());
	            DBConnection.writeToDatabase(pStmt);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	    }

	    public static void delete(int id) {
	        try {
	            String sqlStr = "DELETE FROM tbl_role WHERE id = ?";
	            PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
	            pStmt.setInt(1, id);
	            DBConnection.writeToDatabase(pStmt);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	    }
	    
	    public static void deleteRoleForAccount(int accountId){
	    	try {
	            String sqlStr = "DELETE FROM tbl_role WHERE account_id = ?";
	            PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
	            pStmt.setInt(1, accountId);
	            DBConnection.writeToDatabase(pStmt);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	    }

	    public static void update(Role role) {
	        try {
	            String sqlStr  = "UPDATE tbl_role SET can_read = ?, can_write = ?, can_update = ?, can_delete = ?,"+
	        "modified_by = ?, modification_date = ? WHERE role_id = ?";
	            PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
	            	pStmt.setBoolean(1, role.isReadable());
	            	pStmt.setBoolean(2, role.isWritable());
	            	pStmt.setBoolean(3, role.isUpdateable());
	            	pStmt.setBoolean(4, role.isDeletable());
	            	pStmt.setInt(5, role.getModifiedBy());
	            	pStmt.setDate(6, role.getModificationDate());
	            	pStmt.setInt(7, role.getId());
	            	DBConnection.writeToDatabase(pStmt);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	    }

	    public static List<Role> getAllRoles() {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            String query = "SELECT * FROM tbl_role";
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	                role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	                list.add(role);
	            }	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        
	        return list;
	    }

	    public static List<Role> getAllRolesForAccount(Account acct) {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + acct.getAccountId();
	            System.out.println("inside all roles for acct : "+query);
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	            	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	                list.add(role);
	            }	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	        
	        return list;
	    }
	    
	    public static void createBlankRoleUplonMemberApproval(int acctId)
	    {
	        Role role = null;
	        try{	            
	            List<Functionality> functionalityList = Functionality.getAllFunctionalities();
	            Iterator<Functionality> functionalityItr = functionalityList.iterator(); 
	            
	            while(functionalityItr.hasNext()){
	            	Functionality functionality = functionalityItr.next();
	                int functionalityId = functionality.getId();                
	                role = new Role(acctId, false, false, false, false, functionalityId, 0,null);
	                role.save();
	            }//end while loop
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }

	    public static List<Role> getAllUntouchedRoles(List<Role> roleList) {
	        Role role = null;
	        List<Role> list = new ArrayList<Role>();
	        try {
	            if (roleList != null) {
	                Iterator<Role> roleItr = roleList.iterator();
	                while(roleItr.hasNext())
	                {
	                    Role r = roleItr.next();
	                    int roleId = r.getId();
	                    int functionalityId = r.getFunctionalityId();	                    
	                    String query = "SELECT * FROM tbl_functionality WHERE id != "+functionalityId;
	                    ResultSet rSet = DBConnection.readFromDatabase(query);
	                    while(rSet.next())
	                    {
	                    	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	    	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	                        list.add(role);
	                    }//end while rSet
	                }//end while itr
	                
	            }
	            else{
	                String query = "SELECT * FROM tbl_operation";
	                ResultSet rSet = DBConnection.readFromDatabase(query);
	                while(rSet.next())
	                {
	                	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
		                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	                    list.add(role);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return list;
	    }

	    public static Role getRole(int id) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE id = " + id;
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	            	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	            }
	            DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        	DBConnection.disconnectDatabase();
	        }
	        return role;
	    }

	    public static Role getRoleForAccount(Account account) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + account.getAccountId();
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	            	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	            }
	            DBConnection.disconnectDatabase();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	        return role;
	    }

	    public static Role getRole(int accountId, int functionalityId) {
	        Role role = null;
	        try {
	            String query = "SELECT * FROM tbl_role WHERE account_id = " + accountId + " AND functionality_id = " + functionalityId;
	            System.out.println("mahder : " + query);
	            ResultSet rSet = DBConnection.readFromDatabase(query);
	            while (rSet.next()) {
	            	role = new Role(rSet.getInt("role_id"), rSet.getInt("account_id"), rSet.getBoolean("can_read"), rSet.getBoolean("can_write"), rSet.getBoolean("can_update"), rSet.getBoolean("can_delete"), rSet.getInt("functionality_id"),
	                		rSet.getInt("modified_by"),rSet.getDate("modification_date"));
	            }	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	        		DBConnection.disconnectDatabase();
	        }
	        return role;
	    }
	    
	    public static void createBlankRoleUponUserCreation(int acctId,int modifiedBy, Date modificationDate)
	    {
	        Role role = null;
	        try{	            
	            List<Functionality> functionalityList = Functionality.getAllFunctionalities();
	            Iterator<Functionality> functionalityItr = functionalityList.iterator(); 
	            
	            while(functionalityItr.hasNext()){
	            	Functionality functionality = functionalityItr.next();
	                int functionalityId = functionality.getId();                
	                role = new Role(acctId, false, false, false, false, functionalityId,modifiedBy,modificationDate);
	                role.save();
	            }//end while loop
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }

	    @Override
	    public String toString() {
	        return "Role{" + "roleId=" + id + ", accountId=" + accountId + ", readable=" + readable + ", writable=" + writable + ", updateable=" + updateable + ", deletable=" + deletable + ", functionalityId=" + functionalityId + '}';
	    }
}//end class
