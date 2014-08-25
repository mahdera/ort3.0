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
public class PaperPublication {
	private long reportInputFormId;
	private int brochureAmount;
	private int magazineAmount;
	private int pamphletAmount;
	private int newsPaperAmount;
	private int othersAmount;
	private float brochureAmountCost;
	private float magazineAmountCost;
	private float pamphletAmountCost;
	private float newsPaperAmountCost;
	private float othersAmountCost;
	private int modifiedBy;
	private Date modificationDate;

	/**
	 * @param reportInputFormId
	 * @param brochureAmount
	 * @param magazineAmount
	 * @param pamphletAmount
	 * @param newsPaperAmount
	 * @param othersAmount
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public PaperPublication(long reportInputFormId, int brochureAmount,
			int magazineAmount, int pamphletAmount, int newsPaperAmount,
			int othersAmount,float brochureAmountCost,float magazineAmountCost,
			float pamphletAmountCost,float newsPaperAmountCost,float othersAmountCost,
			int modifiedBy, Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.brochureAmount = brochureAmount;
		this.magazineAmount = magazineAmount;
		this.pamphletAmount = pamphletAmount;
		this.newsPaperAmount = newsPaperAmount;
		this.othersAmount = othersAmount;
		this.brochureAmountCost = brochureAmountCost;
		this.magazineAmountCost = magazineAmountCost;
		this.pamphletAmountCost = pamphletAmountCost;
		this.newsPaperAmountCost = newsPaperAmountCost;
		this.othersAmountCost = othersAmountCost;
		this.modifiedBy = modifiedBy;
		this.modificationDate = modificationDate;
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
	 * @return the brochureAmount
	 */
	public int getBrochureAmount() {
		return brochureAmount;
	}

	/**
	 * @param brochureAmount
	 *            the brochureAmount to set
	 */
	public void setBrochureAmount(int brochureAmount) {
		this.brochureAmount = brochureAmount;
	}

	/**
	 * @return the magazineAmount
	 */
	public int getMagazineAmount() {
		return magazineAmount;
	}

	/**
	 * @param magazineAmount
	 *            the magazineAmount to set
	 */
	public void setMagazineAmount(int magazineAmount) {
		this.magazineAmount = magazineAmount;
	}

	/**
	 * @return the pamphletAmount
	 */
	public int getPamphletAmount() {
		return pamphletAmount;
	}

	/**
	 * @param pamphletAmount
	 *            the pamphletAmount to set
	 */
	public void setPamphletAmount(int pamphletAmount) {
		this.pamphletAmount = pamphletAmount;
	}

	/**
	 * @return the newsPaperAmount
	 */
	public int getNewsPaperAmount() {
		return newsPaperAmount;
	}

	/**
	 * @param newsPaperAmount
	 *            the newsPaperAmount to set
	 */
	public void setNewsPaperAmount(int newsPaperAmount) {
		this.newsPaperAmount = newsPaperAmount;
	}

	/**
	 * @return the othersAmount
	 */
	public int getOthersAmount() {
		return othersAmount;
	}

	/**
	 * @param othersAmount
	 *            the othersAmount to set
	 */
	public void setOthersAmount(int othersAmount) {
		this.othersAmount = othersAmount;
	}
	public float getBrochureAmountCost(){
		return brochureAmountCost;
	}
	public void setBrochureAmountCost(float brochureAmountCost){
		this.brochureAmountCost = brochureAmountCost;
	}
	public float getMagazineAmountCost(){
		return magazineAmountCost;
	}
	public void setMagazineAmountCost(float magazineAmountCost){
		this.magazineAmountCost = magazineAmountCost;
	}
	public float getPamphletAmountCost(){
		return pamphletAmountCost;
	}
	public void setPamphletAmountCost(float pamphletAmountCost){
		this.pamphletAmountCost = pamphletAmountCost;
	}
	public float getNewsPaperAmountCost(){
		return newsPaperAmountCost;
	}
	public void setNewsPaperAmountCost(float newsPaperAmountCost){
		this.newsPaperAmountCost = newsPaperAmountCost;
	}
	public float getOthersAmountCost(){
		return othersAmountCost;
	}
	public void setOthersAmountCost(float othersAmountCost){
		this.othersAmountCost = othersAmountCost;
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
			String sqlStr = "insert into tbl_paper_publication values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getBrochureAmount());
			pStmt.setInt(3, this.getMagazineAmount());
			pStmt.setInt(4, this.getPamphletAmount());
			pStmt.setInt(5, this.getNewsPaperAmount());
			pStmt.setInt(6, this.getOthersAmount());
			pStmt.setFloat(7, this.getBrochureAmountCost());
			pStmt.setFloat(8, this.getMagazineAmountCost());
			pStmt.setFloat(9, this.getPamphletAmountCost());
			pStmt.setFloat(10, this.getNewsPaperAmountCost());
			pStmt.setFloat(11, this.getOthersAmountCost());
			pStmt.setInt(12, this.getModifiedBy());
			pStmt.setDate(13, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void update(PaperPublication paperPublication) {
		try {
			String sqlStr = "update tbl_paper_publication set brochure_amount = ?, magazine_amount = ?,"+
		"pamphlet_amount = ?, news_paper_amount = ?, others_amount = ?, cost_of_brochure = ?,"+
		"cost_of_magazine_amount = ?, cost_of_pamphlet_amount = ?, cost_of_newsPaper_amount = ?,"+
		"cost_of_others = ?, modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, paperPublication.getBrochureAmount());
			pStmt.setInt(2, paperPublication.getMagazineAmount());
			pStmt.setInt(3, paperPublication.getPamphletAmount());
			pStmt.setInt(4, paperPublication.getNewsPaperAmount());
			pStmt.setInt(5, paperPublication.getOthersAmount());
			pStmt.setFloat(6, paperPublication.getBrochureAmountCost());
			pStmt.setFloat(7, paperPublication.getMagazineAmountCost());
			pStmt.setFloat(8, paperPublication.getPamphletAmountCost());
			pStmt.setFloat(9, paperPublication.getNewsPaperAmountCost());
			pStmt.setFloat(10, paperPublication.getOthersAmountCost());
			pStmt.setInt(11, paperPublication.getModifiedBy());
			pStmt.setDate(12, paperPublication.getModificationDate());
			pStmt.setLong(13, paperPublication.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static void delete(long reportInputFormId) {
		try {
			String sqlStr = "delete from tbl_paper_publication where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}

	public static List<PaperPublication> getAllPaperPublication() {
		List<PaperPublication> list = new ArrayList<PaperPublication>();
		PaperPublication paperPublication = null;
		try {
			String query = "select * from tbl_paper_publication";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				paperPublication = new PaperPublication(rSet.getLong("report_input_form_id"), rSet.getInt("brochure_amount"), 
						rSet.getInt("magazine_amount"), rSet.getInt("pamphlet_amount"), rSet.getInt("news_paper_amount"), 
						rSet.getInt("others_amount"),rSet.getFloat("cost_of_brochure"),rSet.getFloat("cost_of_magazine_amount"),
						rSet.getFloat("cost_of_pamphlet_amount"),rSet.getFloat("cost_of_newsPaper_amount"),rSet.getFloat("cost_of_others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
				list.add(paperPublication);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}

	public static PaperPublication getPaperPublication(long reportInputFormId) {
		PaperPublication paperPublication = null;
		try {
			String query = "select * from tbl_paper_publication where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				paperPublication = new PaperPublication(rSet.getLong("report_input_form_id"), rSet.getInt("brochure_amount"), 
						rSet.getInt("magazine_amount"), rSet.getInt("pamphlet_amount"), rSet.getInt("news_paper_amount"), 
						rSet.getInt("others_amount"),rSet.getFloat("cost_of_brochure"),rSet.getFloat("cost_of_magazine_amount"),
						rSet.getFloat("cost_of_pamphlet_amount"),rSet.getFloat("cost_of_newsPaper_amount"),rSet.getFloat("cost_of_others"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return paperPublication;
	}
}// end class
