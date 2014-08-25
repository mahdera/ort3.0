/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mahder on macbook Pro
 *
 */
public class Signature {
	private int id;
	private int userId;
	private FileInputStream fis;
	private InputStream ins;
	private int modifiedBy;
	private Date modificationDate;
	/**
	 * @param userId
	 * @param fis
	 * @param ins
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Signature(int userId, FileInputStream fis, InputStream ins,
			int modifiedBy,Date modificationDate) {
		this.userId = userId;
		this.fis = fis;
		this.ins = ins;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	public Signature(int userId, FileInputStream fis,int modifiedBy,Date modificationDate) {
		this.userId = userId;
		this.fis = fis;		
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	public Signature(int userId,InputStream ins, int modifiedBy, Date modificationDate) {
		this.userId = userId;		
		this.ins = ins;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	/**
	 * @param id
	 * @param userId
	 * @param fis
	 * @param ins
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public Signature(int id, int userId, FileInputStream fis, InputStream ins,
			int modifiedBy, Date modificationDate) {
		this.id = id;
		this.userId = userId;
		this.fis = fis;
		this.ins = ins;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	public Signature(int id, int userId, FileInputStream fis, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.userId = userId;
		this.fis = fis;		
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}
	
	public Signature(int id, int userId, InputStream ins, int modifiedBy,
			Date modificationDate) {
		this.id = id;
		this.userId = userId;		
		this.ins = ins;
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
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the fis
	 */
	public FileInputStream getFis() {
		return fis;
	}

	/**
	 * @param fis the fis to set
	 */
	public void setFis(FileInputStream fis) {
		this.fis = fis;
	}

	/**
	 * @return the ins
	 */
	public InputStream getIns() {
		return ins;
	}

	/**
	 * @param ins the ins to set
	 */
	public void setIns(InputStream ins) {
		this.ins = ins;
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

	public void addSignature() {
		try {
			java.sql.Connection connection = DBConnection.getDatabaseConnection();
			java.sql.PreparedStatement pst = connection.prepareStatement("INSERT INTO tbl_signature VALUES(?,?,?,?,?)");

			pst.setInt(1, 0);
			pst.setInt(2, this.getUserId());			
			pst.setBinaryStream(3, (InputStream) getFis(),(int) (getFis().available()));
			pst.setInt(4, this.getModifiedBy());
			pst.setDate(5, this.getModificationDate());
			
			int sucess = pst.executeUpdate();
			if (sucess != 0)
				System.out.println("hurray mahder");
			else
				System.out.println("shoke mahder");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void updateSignature(int id,FileInputStream signatureImage, int modifiedBy, Date modificationDate) {
		try {
			java.sql.Connection connection = DBConnection.getDatabaseConnection();
			java.sql.PreparedStatement pst = connection.prepareStatement("UPDATE tbl_signature SET signature_image = ?, modified_by = ?, modification_date = ? WHERE id = ?");
			
			pst.setBinaryStream(1, (InputStream) signatureImage,(int) (signatureImage.available()));
			pst.setInt(2, id);			
			pst.setInt(3, modifiedBy);
			pst.setDate(4, modificationDate);
			
			int sucess = pst.executeUpdate();
			if (sucess != 0)
				System.out.println("hurray mahder");
			else
				System.out.println("shoke mahder");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void deleteSignature(int id){
		try{
			String command = "delete from tbl_signature where id = "+id;
			DBConnection.writeToDatabase(command);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
	}
	
	public static Signature getSignature(int id){
		Signature signature = null;
		try{
			String query = "select * from tbl_signature where id = "+id;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				signature = new Signature(rSet.getInt("id"),rSet.getInt("user_id"),rSet.getBinaryStream("signature_image"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return signature;
	}
	
	public static List<Signature> getAllSignatures(){
		List<Signature> list = new ArrayList<Signature>();
		Signature signature = null;
		try{
			String query = "select * from tbl_signature";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				signature = new Signature(rSet.getInt("id"),rSet.getInt("user_id"),rSet.getBinaryStream("signature_image"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(signature);
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static Signature getSignatureForThisUser(int userId){
		Signature signature = null;
		try{
			String query = "select * from tbl_signature where user_id = "+userId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				signature = new Signature(rSet.getInt("id"),rSet.getInt("user_id"),rSet.getBinaryStream("signature_image"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return signature;
	}
}//end class
