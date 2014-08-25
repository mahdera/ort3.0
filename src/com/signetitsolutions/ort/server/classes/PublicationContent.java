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
public class PublicationContent {
	private long reportInputFormId;
	private String _951;
	private String _952;
	private String _953;
	private String _954;
	private String _955;
	private String _956;
	private String _957;
	private String _958;
	private String _959;
	private String others;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * @param reportInputFormId
	 * @param _951
	 * @param _952
	 * @param _953
	 * @param _954
	 * @param _955
	 * @param _956
	 * @param _957
	 * @param _958
	 * @param _959
	 * @param modified_by
	 * @param modificationDate
	 */
	public PublicationContent(long reportInputFormId, String _951,
			String _952, String _953, String _954, String _955,
			String _956, String _957, String _958, String _959,String others,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this._951 = _951;
		this._952 = _952;
		this._953 = _953;
		this._954 = _954;
		this._955 = _955;
		this._956 = _956;
		this._957 = _957;
		this._958 = _958;
		this._959 = _959;
		this.others = others;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
	}

	
	
	/**
	 * @return the others
	 */
	public String getOthers() {
		return others;
	}



	/**
	 * @param others the others to set
	 */
	public void setOthers(String others) {
		this.others = others;
	}



	/**
	 * @return the reportInputFormId
	 */
	public long getReportInputFormId() {
		return reportInputFormId;
	}

	/**
	 * @param reportInputFormId
	 *            the reportInputFormId to set
	 */
	public void setReportInputFormId(long reportInputFormId) {
		this.reportInputFormId = reportInputFormId;
	}

	

	/**
	 * @return the _951
	 */
	public String get_951() {
		return _951;
	}



	/**
	 * @param _951 the _951 to set
	 */
	public void set_951(String _951) {
		this._951 = _951;
	}



	/**
	 * @return the _952
	 */
	public String get_952() {
		return _952;
	}



	/**
	 * @param _952 the _952 to set
	 */
	public void set_952(String _952) {
		this._952 = _952;
	}



	/**
	 * @return the _953
	 */
	public String get_953() {
		return _953;
	}



	/**
	 * @param _953 the _953 to set
	 */
	public void set_953(String _953) {
		this._953 = _953;
	}



	/**
	 * @return the _954
	 */
	public String get_954() {
		return _954;
	}



	/**
	 * @param _954 the _954 to set
	 */
	public void set_954(String _954) {
		this._954 = _954;
	}



	/**
	 * @return the _955
	 */
	public String get_955() {
		return _955;
	}



	/**
	 * @param _955 the _955 to set
	 */
	public void set_955(String _955) {
		this._955 = _955;
	}



	/**
	 * @return the _956
	 */
	public String get_956() {
		return _956;
	}



	/**
	 * @param _956 the _956 to set
	 */
	public void set_956(String _956) {
		this._956 = _956;
	}



	/**
	 * @return the _957
	 */
	public String get_957() {
		return _957;
	}



	/**
	 * @param _957 the _957 to set
	 */
	public void set_957(String _957) {
		this._957 = _957;
	}



	/**
	 * @return the _958
	 */
	public String get_958() {
		return _958;
	}



	/**
	 * @param _958 the _958 to set
	 */
	public void set_958(String _958) {
		this._958 = _958;
	}



	/**
	 * @return the _959
	 */
	public String get_959() {
		return _959;
	}



	/**
	 * @param _959 the _959 to set
	 */
	public void set_959(String _959) {
		this._959 = _959;
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
			String sqlStr = "insert into tbl_publication_content values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setString(2, this.get_951());
			pStmt.setString(3, this.get_952());
			pStmt.setString(4, this.get_953());
			pStmt.setString(5, this.get_954());
			pStmt.setString(6, this.get_955());
			pStmt.setString(7, this.get_956());
			pStmt.setString(8, this.get_957());
			pStmt.setString(9, this.get_958());
			pStmt.setString(10, this.get_959());
			pStmt.setString(11, this.getOthers());
			pStmt.setInt(12, this.getModifiedBy());
			pStmt.setDate(13, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(PublicationContent publicationContent) {
		try {
			String sqlStr = "update tbl_publication_content set _951 = ?, _952 = ?, _953 = ?,"+
		" _954 = ?, _955 = ?, _956 = ?, _957 = ?, _958 = ?, _959 = ?, others = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setString(1, publicationContent.get_951());
			pStmt.setString(2, publicationContent.get_952());
			pStmt.setString(3, publicationContent.get_953());
			pStmt.setString(4, publicationContent.get_954());
			pStmt.setString(5, publicationContent.get_955());
			pStmt.setString(6, publicationContent.get_956());
			pStmt.setString(7, publicationContent.get_957());
			pStmt.setString(8, publicationContent.get_958());
			pStmt.setString(9, publicationContent.get_959());
			pStmt.setString(10, publicationContent.getOthers());
			pStmt.setInt(11, publicationContent.getModifiedBy());
			pStmt.setDate(12, publicationContent.getModificationDate());
			pStmt.setLong(13, publicationContent.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_publication_content where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PublicationContent> getAllPublicationContents() {
		List<PublicationContent> list = new ArrayList<PublicationContent>();
		PublicationContent publicationContent = null;
		try {
			String query = "select * from tbl_publication_content";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publicationContent = new PublicationContent(rSet.getLong("report_input_form_id"), rSet.getString("_951"), rSet.getString("_952"), 
						rSet.getString("_953"), rSet.getString("_954"), rSet.getString("_955"), rSet.getString("_956"), 
								rSet.getString("_957"), rSet.getString("_958"), rSet.getString("_959"), rSet.getString("others"),
								rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(publicationContent);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PublicationContent getPublicationContent(long reportInputFormId) {
		PublicationContent publicationContent = null;
		try {
			String query = "select * from tbl_publication_content where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				publicationContent = new PublicationContent(rSet.getLong("report_input_form_id"), rSet.getString("_951"), rSet.getString("_952"), 
						rSet.getString("_953"), rSet.getString("_954"), rSet.getString("_955"), rSet.getString("_956"), 
								rSet.getString("_957"), rSet.getString("_958"), rSet.getString("_959"), rSet.getString("others"),
								rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return publicationContent;
	}
}// end class
