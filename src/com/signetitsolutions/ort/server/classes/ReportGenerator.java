/**
 * 
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.ResultSet;
import java.util.Date;

/**
 * @author Mahder on macbook Pro
 *
 */
public class ReportGenerator {
	
	public static float getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector(String tableName,
			String columnName,String reportLevel,int value,Date fromDate,Date toDate,int organizationId){
		String filteredFieldName = null;
		if(reportLevel.equalsIgnoreCase("regionLevel"))
			filteredFieldName = "region_id";
		else if(reportLevel.equalsIgnoreCase("woredaLevel"))
			filteredFieldName = "woreda_id";
		else if(reportLevel.equalsIgnoreCase("kebeleLevel"))
			filteredFieldName = "kebele_id";
		else if(reportLevel.equalsIgnoreCase("zoneLevel"))
			filteredFieldName = "zone_id";
		
		float sumOfField = 0.0f;
		try{
			String query = "select sum("+columnName+") as sumOfField from "+tableName+", tbl_government_sector_organization,"+
		"tbl_report_form_filled_by where "+tableName+".report_input_form_id = tbl_report_form_filled_by.report_input_form_id and "+
					"tbl_report_form_filled_by.organization_id = tbl_government_sector_organization.id and tbl_government_sector_organization.id = "+organizationId+" and date(filled_on) between '"+fromDate+"' and '"+toDate+"' and "+
		 filteredFieldName+"="+value+" group by("+filteredFieldName+")";		
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				sumOfField = rSet.getInt("sumOfField");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return sumOfField;
	}
	
	public static float getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(String tableName, 
			String fieldName,String reportLevel,int value,Date fromDate,Date toDate){
		String filteredFieldName = null;
		if(reportLevel.equalsIgnoreCase("regionLevel"))
			filteredFieldName = "region_id";
		else if(reportLevel.equalsIgnoreCase("woredaLevel"))
			filteredFieldName = "woreda_id";
		else if(reportLevel.equalsIgnoreCase("kebeleLevel"))
			filteredFieldName = "kebele_id";
		else if(reportLevel.equalsIgnoreCase("zoneLevel"))
			filteredFieldName = "zone_id";
		
		float sumOfField = 0.0f;
		try{
			String query = "select sum("+fieldName+") as sumOfField from "+tableName+", tbl_government_sector_organization,"+
		"tbl_report_form_filled_by where "+tableName+".report_input_form_id = tbl_report_form_filled_by.report_input_form_id and" +
					"tbl_report_form_filled_by.organization_id = tbl_government_sector_organization.id and date(filled_on) between '"+fromDate+"' and '"+toDate+"' and "+
		filteredFieldName+"="+value+" group by("+filteredFieldName+")";		
			System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				sumOfField = rSet.getInt("sumOfField");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return sumOfField;
	}
	
	public static float getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(String tableName, 
			String fieldName,String reportLevel,int value,Date fromDate,Date toDate,String sectorId){
		String filteredFieldName = null;
		if(reportLevel.equalsIgnoreCase("regionLevel"))
			filteredFieldName = "region_id";
		else if(reportLevel.equalsIgnoreCase("woredaLevel"))
			filteredFieldName = "woreda_id";
		else if(reportLevel.equalsIgnoreCase("kebeleLevel"))
			filteredFieldName = "kebele_id";
		else if(reportLevel.equalsIgnoreCase("zoneLevel"))
			filteredFieldName = "zone_id";
		else if(reportLevel.equalsIgnoreCase("all")){
			filteredFieldName = "region_id";
		}
		
		float sumOfField = 0.0f;
		try{
			String query = "select sum("+fieldName+") as sumOfField from "+tableName+", tbl_government_sector_organization,"+
		"tbl_report_form_filled_by where "+tableName+".report_input_form_id = tbl_report_form_filled_by.report_input_form_id and" +
				" tbl_government_sector_organization.sector_category_id='"+sectorId+"' and "+
					"tbl_report_form_filled_by.organization_id = tbl_government_sector_organization.id and date(filled_on) between '"+fromDate+"' and '"+toDate+"' and "+
		filteredFieldName+"="+value+" group by("+filteredFieldName+")";		
			//System.out.println(query);
			ResultSet rSet = DBConnection.readFromDatabase(query);
			while(rSet.next()){
				sumOfField = rSet.getInt("sumOfField");
			}//end while loop
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.disconnectDatabase();
		}
		return sumOfField;
	}
}//end class
