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
public class ClassifiedInformationCategory {
	private long reportInputFormId;
	private int thirdPartyRelatedPrivateInformation;
	private int thirdPartyRelatedCommercialInformation;
	private int thirdPartyRelatedTrustedInformation;
	private int privateSaftyAndPropertyRelatedInformation;
	private int lawEnforcementAndJusticeRelatedInformation;
	private int classifiedInformationDuringInvestigation;
	private int defenseSecurityAndInternationalRelationInformation;
	private int cabineDocuments;
	private int countryRelatedInformation;
	private int governmentWorkDocuments;
	private int modifiedBy;
	private Date modificationDate;
	
	
	

	/**
	 * @param reportInputFormId
	 * @param thirdPartyRelatedPrivateInformation
	 * @param thirdPartyRelatedCommercialInformation
	 * @param thirdPartyRelatedTrustedInformation
	 * @param privateSaftyAndPropertyRelatedInformation
	 * @param lawEnforcementAndJusticeRelatedInformation
	 * @param classifiedInformationDuringInvestigation
	 * @param defenseSecurityAndInternationalRelationInformation
	 * @param cabineDocuments
	 * @param countryRelatedInformation
	 * @param governmentWorkDocuments
	 * @param modifiedBy
	 * @param modificationDate
	 */
	public ClassifiedInformationCategory(long reportInputFormId,
			int thirdPartyRelatedPrivateInformation,
			int thirdPartyRelatedCommercialInformation,
			int thirdPartyRelatedTrustedInformation,
			int privateSaftyAndPropertyRelatedInformation,
			int lawEnforcementAndJusticeRelatedInformation,
			int classifiedInformationDuringInvestigation,
			int defenseSecurityAndInternationalRelationInformation,
			int cabineDocuments, int countryRelatedInformation,
			int governmentWorkDocuments,int modifiedBy,Date modificationDate) {
		this.reportInputFormId = reportInputFormId;
		this.thirdPartyRelatedPrivateInformation = thirdPartyRelatedPrivateInformation;
		this.thirdPartyRelatedCommercialInformation = thirdPartyRelatedCommercialInformation;
		this.thirdPartyRelatedTrustedInformation = thirdPartyRelatedTrustedInformation;
		this.privateSaftyAndPropertyRelatedInformation = privateSaftyAndPropertyRelatedInformation;
		this.lawEnforcementAndJusticeRelatedInformation = lawEnforcementAndJusticeRelatedInformation;
		this.classifiedInformationDuringInvestigation = classifiedInformationDuringInvestigation;
		this.defenseSecurityAndInternationalRelationInformation = defenseSecurityAndInternationalRelationInformation;
		this.cabineDocuments = cabineDocuments;
		this.countryRelatedInformation = countryRelatedInformation;
		this.governmentWorkDocuments = governmentWorkDocuments;
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
	 * @param reportInputFormId the reportInputFormId to set
	 */
	public void setReportInputFormId(long reportInputFormId) {
		this.reportInputFormId = reportInputFormId;
	}



	/**
	 * @return the thirdPartyRelatedPrivateInformation
	 */
	public int getThirdPartyRelatedPrivateInformation() {
		return thirdPartyRelatedPrivateInformation;
	}



	/**
	 * @param thirdPartyRelatedPrivateInformation the thirdPartyRelatedPrivateInformation to set
	 */
	public void setThirdPartyRelatedPrivateInformation(
			int thirdPartyRelatedPrivateInformation) {
		this.thirdPartyRelatedPrivateInformation = thirdPartyRelatedPrivateInformation;
	}



	/**
	 * @return the thirdPartyRelatedCommercialInformation
	 */
	public int getThirdPartyRelatedCommercialInformation() {
		return thirdPartyRelatedCommercialInformation;
	}



	/**
	 * @param thirdPartyRelatedCommercialInformation the thirdPartyRelatedCommercialInformation to set
	 */
	public void setThirdPartyRelatedCommercialInformation(
			int thirdPartyRelatedCommercialInformation) {
		this.thirdPartyRelatedCommercialInformation = thirdPartyRelatedCommercialInformation;
	}



	/**
	 * @return the thirdPartyRelatedTrustedInformation
	 */
	public int getThirdPartyRelatedTrustedInformation() {
		return thirdPartyRelatedTrustedInformation;
	}



	/**
	 * @param thirdPartyRelatedTrustedInformation the thirdPartyRelatedTrustedInformation to set
	 */
	public void setThirdPartyRelatedTrustedInformation(
			int thirdPartyRelatedTrustedInformation) {
		this.thirdPartyRelatedTrustedInformation = thirdPartyRelatedTrustedInformation;
	}



	/**
	 * @return the privateSaftyAndPropertyRelatedInformation
	 */
	public int getPrivateSaftyAndPropertyRelatedInformation() {
		return privateSaftyAndPropertyRelatedInformation;
	}



	/**
	 * @param privateSaftyAndPropertyRelatedInformation the privateSaftyAndPropertyRelatedInformation to set
	 */
	public void setPrivateSaftyAndPropertyRelatedInformation(
			int privateSaftyAndPropertyRelatedInformation) {
		this.privateSaftyAndPropertyRelatedInformation = privateSaftyAndPropertyRelatedInformation;
	}



	/**
	 * @return the lawEnforcementAndJusticeRelatedInformation
	 */
	public int getLawEnforcementAndJusticeRelatedInformation() {
		return lawEnforcementAndJusticeRelatedInformation;
	}



	/**
	 * @param lawEnforcementAndJusticeRelatedInformation the lawEnforcementAndJusticeRelatedInformation to set
	 */
	public void setLawEnforcementAndJusticeRelatedInformation(
			int lawEnforcementAndJusticeRelatedInformation) {
		this.lawEnforcementAndJusticeRelatedInformation = lawEnforcementAndJusticeRelatedInformation;
	}



	/**
	 * @return the classifiedInformationDuringInvestigation
	 */
	public int getClassifiedInformationDuringInvestigation() {
		return classifiedInformationDuringInvestigation;
	}



	/**
	 * @param classifiedInformationDuringInvestigation the classifiedInformationDuringInvestigation to set
	 */
	public void setClassifiedInformationDuringInvestigation(
			int classifiedInformationDuringInvestigation) {
		this.classifiedInformationDuringInvestigation = classifiedInformationDuringInvestigation;
	}



	/**
	 * @return the defenseSecurityAndInternationalRelationInformation
	 */
	public int getDefenseSecurityAndInternationalRelationInformation() {
		return defenseSecurityAndInternationalRelationInformation;
	}



	/**
	 * @param defenseSecurityAndInternationalRelationInformation the defenseSecurityAndInternationalRelationInformation to set
	 */
	public void setDefenseSecurityAndInternationalRelationInformation(
			int defenseSecurityAndInternationalRelationInformation) {
		this.defenseSecurityAndInternationalRelationInformation = defenseSecurityAndInternationalRelationInformation;
	}



	/**
	 * @return the cabineDocuments
	 */
	public int getCabineDocuments() {
		return cabineDocuments;
	}



	/**
	 * @param cabineDocuments the cabineDocuments to set
	 */
	public void setCabineDocuments(int cabineDocuments) {
		this.cabineDocuments = cabineDocuments;
	}



	/**
	 * @return the countryRelatedInformation
	 */
	public int getCountryRelatedInformation() {
		return countryRelatedInformation;
	}



	/**
	 * @param countryRelatedInformation the countryRelatedInformation to set
	 */
	public void setCountryRelatedInformation(int countryRelatedInformation) {
		this.countryRelatedInformation = countryRelatedInformation;
	}



	/**
	 * @return the governmentWorkDocuments
	 */
	public int getGovernmentWorkDocuments() {
		return governmentWorkDocuments;
	}



	/**
	 * @param governmentWorkDocuments the governmentWorkDocuments to set
	 */
	public void setGovernmentWorkDocuments(int governmentWorkDocuments) {
		this.governmentWorkDocuments = governmentWorkDocuments;
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
			String sqlStr = "insert into tbl_classified_information_category values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, this.getReportInputFormId());
			pStmt.setInt(2, this.getThirdPartyRelatedPrivateInformation());
			pStmt.setInt(3, this.getThirdPartyRelatedCommercialInformation());
			pStmt.setInt(4, this.getThirdPartyRelatedTrustedInformation());
			pStmt.setInt(5, this.getPrivateSaftyAndPropertyRelatedInformation());
			pStmt.setInt(6, this.getLawEnforcementAndJusticeRelatedInformation());
			pStmt.setInt(7, this.getClassifiedInformationDuringInvestigation());
			pStmt.setInt(8, this.getDefenseSecurityAndInternationalRelationInformation());
			pStmt.setInt(9, this.getCabineDocuments());
			pStmt.setInt(10, this.getCountryRelatedInformation());
			pStmt.setInt(11, this.getGovernmentWorkDocuments());
			pStmt.setInt(12, this.getModifiedBy());
			pStmt.setDate(13, this.getModificationDate());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void update(ClassifiedInformationCategory classifiedInformationCategory){
		try {
			String sqlStr = "update tbl_classified_information_category set third_party_related_private_information = ?,"+
		" third_party_related_commercial_information = ?, third_party_related_trusted_information = ?,"+
		" private_safty_and_property_related_information = ?, law_enforcment_and_justice_related_information = ?,"+
		" classified_information_during_investigation = ?, defense_security_and_international_relation_information = ?,"+
		" cabine_documents = ?, country_related_information = ?, government_work_documents = ?,"+
		" modified_by = ?, modification_date = ? where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setInt(1, classifiedInformationCategory.getThirdPartyRelatedPrivateInformation());
			pStmt.setInt(2, classifiedInformationCategory.getThirdPartyRelatedCommercialInformation());
			pStmt.setInt(3, classifiedInformationCategory.getThirdPartyRelatedTrustedInformation());
			pStmt.setInt(4, classifiedInformationCategory.getPrivateSaftyAndPropertyRelatedInformation());
			pStmt.setInt(5, classifiedInformationCategory.getLawEnforcementAndJusticeRelatedInformation());
			pStmt.setInt(6, classifiedInformationCategory.getClassifiedInformationDuringInvestigation());
			pStmt.setInt(7, classifiedInformationCategory.getDefenseSecurityAndInternationalRelationInformation());
			pStmt.setInt(8, classifiedInformationCategory.getCabineDocuments());
			pStmt.setInt(9, classifiedInformationCategory.getCountryRelatedInformation());
			pStmt.setInt(10, classifiedInformationCategory.getGovernmentWorkDocuments());
			pStmt.setInt(11, classifiedInformationCategory.getModifiedBy());
			pStmt.setDate(12, classifiedInformationCategory.getModificationDate());
			pStmt.setLong(13, classifiedInformationCategory.getReportInputFormId());
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static void delete(long reportInputFormId){
		try {
			String sqlStr = "delete from tbl_classified_information_category where report_input_form_id = ?";
			PreparedStatement pStmt = DBConnection.getPreparedStatement(sqlStr);
			pStmt.setLong(1, reportInputFormId);
			DBConnection.writeToDatabase(pStmt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
	}
	
	public static List<ClassifiedInformationCategory> getAllClassifiedInformationCategories(){
		List<ClassifiedInformationCategory> list = new ArrayList<ClassifiedInformationCategory>();
		ClassifiedInformationCategory classifiedInformationCategory = null;
		try {
			String query = "select * from tbl_classified_information_category";
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				classifiedInformationCategory = new ClassifiedInformationCategory(rSet.getLong("report_input_form_id"), 
						rSet.getInt("third_party_related_private_information"), rSet.getInt("third_party_related_commercial_information"), 
						rSet.getInt("third_party_related_trusted_information"), rSet.getInt("private_safty_and_property_related_information"), 
						rSet.getInt("law_enforcement_and_justice_related_information"), rSet.getInt("classified_information_during_investigation"), 
						rSet.getInt("defense_security_and_international_relation_information"), rSet.getInt("cabine_documents"), 
						rSet.getInt("country_related_information"), rSet.getInt("government_work_documents"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(classifiedInformationCategory);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return list;
	}
	
	public static ClassifiedInformationCategory getClassifiedInformationCategory(long reportInputFormId){
		ClassifiedInformationCategory classifiedInformationCategory = null;
		try {
			String query = "select * from tbl_classified_information_category where report_input_form_id = "+reportInputFormId;			
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				classifiedInformationCategory = new ClassifiedInformationCategory(rSet.getLong("report_input_form_id"), 
						rSet.getInt("third_party_related_private_information"), rSet.getInt("third_party_related_commercial_information"), 
						rSet.getInt("third_party_related_trusted_information"), rSet.getInt("private_safty_and_property_related_information"), 
						rSet.getInt("law_enforcment_and_justice_related_information"), rSet.getInt("classified_information_during_investigation"), 
						rSet.getInt("defense_security_and_international_relation_information"), rSet.getInt("cabine_documents"), 
						rSet.getInt("country_related_information"), rSet.getInt("government_work_documents"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.disconnectDatabase();
		}
		return classifiedInformationCategory;
	}
	
	public static List<ClassifiedInformationCategory> getAllClassifiedInformationCategoriesForThisReportForm(long reportInputFormId){
		List<ClassifiedInformationCategory> list = new ArrayList<ClassifiedInformationCategory>();
		ClassifiedInformationCategory classifiedInformationCategory = null;
		try{
			String query = "select * from tbl_classified_information_category where report_input_form_id = "+reportInputFormId;
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				classifiedInformationCategory = new ClassifiedInformationCategory(rSet.getLong("report_input_form_id"), 
						rSet.getInt("third_party_related_private_information"), rSet.getInt("third_party_related_commercial_information"), 
						rSet.getInt("third_party_related_trusted_information"), rSet.getInt("private_safty_and_property_related_information"), 
						rSet.getInt("law_enforcement_and_justice_related_information"), rSet.getInt("classified_information_during_investigation"), 
						rSet.getInt("defense_security_and_international_relation_information"), rSet.getInt("cabine_documents"), 
						rSet.getInt("country_related_information"), rSet.getInt("government_work_documents"),
						rSet.getInt("modified_by"),rSet.getDate("modification_date"));
				list.add(classifiedInformationCategory);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return list;
	}
}//end class
