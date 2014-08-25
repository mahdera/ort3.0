<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<div id="printReportDiv">
<%
	String reportRegion = request.getParameter("reportRegion");
	String reportZone = request.getParameter("reportZone");
	String reportWoreda = request.getParameter("reportWoreda");
	String reportKebele = request.getParameter("reportKebele");
	String reportSector = request.getParameter("reportSector");

	String reportLevel;
	Date dateFrom = Date.valueOf(request.getParameter("dateFrom"));
	Date dateTo = Date.valueOf(request.getParameter("dateTo"));
	
	int ethStartDate = Integer.parseInt(request.getParameter("ethStartDate"));
	int ethStartMonth = Integer.parseInt(request.getParameter("ethStartMonth"));
	int ethStartYear = Integer.parseInt(request.getParameter("ethStartYear"));
	int ethEndDate = Integer.parseInt(request.getParameter("ethEndDate"));
	int ethEndMonth = Integer.parseInt(request.getParameter("ethEndMonth"));
	int ethEndYear = Integer.parseInt(request.getParameter("ethEndYear"));
	String ethiopicStartMonthName = EthiopicMonth.getEthiopicMonth(ethStartMonth).getMonthName();
	String ethiopicEndMonthName = EthiopicMonth.getEthiopicMonth(ethEndMonth).getMonthName();
	
	if (reportKebele != null && !reportKebele.equalsIgnoreCase("") && !reportKebele.equalsIgnoreCase("undefined")) {
		reportLevel = "kebeleLevel";	
	} else if (reportWoreda != null && !reportWoreda.equalsIgnoreCase("") && !reportWoreda.equalsIgnoreCase("undefined")) {
		reportLevel = "woredaLevel";
	} else if (reportZone != null && !reportZone.equalsIgnoreCase("") && !reportZone.equalsIgnoreCase("undefined") ) {
		reportLevel = "zoneLevel";
	} else if (reportRegion != null && !reportRegion.equalsIgnoreCase("") && !reportRegion.equalsIgnoreCase("undefined") && !reportRegion.equalsIgnoreCase("all") ) {
		reportLevel = "regionLevel";
	} else {
		reportLevel = "all";
	}
	if(reportLevel.equalsIgnoreCase("regionLevel")|| reportLevel.equalsIgnoreCase("all")){
		List<Region> regionList = Region.getAllRegions();
		Iterator<Region> regionItr = null;
		if(!regionList.isEmpty())
			regionItr = regionList.iterator();
%>
<div id="regionLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="4">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region/ሪጅን</th>
			<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float regionTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float regionTotal=0.0f;
		if (reportLevel.equalsIgnoreCase("all")) {
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, region.getId(), dateFrom, dateTo,reportSector);	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			regionTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			regionTotal += sumTotal;
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			regionTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			regionTotal += sumTotal;
		}
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=regionTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
	  		<td><%=regionTotal %></td>
	  	</tr>
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("woredaLevel")){
		List<Woreda> woredaList = Woreda.getAllWoredas();
		Iterator<Woreda> woredaItr = null;
		if(!woredaList.isEmpty())
			woredaItr = woredaList.iterator();
%>
<div id="woredaLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="4">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda/ወረዳ</th>
			<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float woredaTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			woredaTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			woredaTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			woredaTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=woredaTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
	  		<td><%=woredaTotal %></td>
	  	</tr>
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("kebeleLevel")){
		List<Kebele> kebeleList = Kebele.getAllKebeles();
		Iterator<Kebele> kebeleItr = null;
		if(!kebeleList.isEmpty())
			kebeleItr = kebeleList.iterator();
%>
<div id="kebeleLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="4">ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
			<th>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float kebeleTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float kebeleTotal=0.0f;
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			kebeleTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			kebeleTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
	  		<td><%=kebeleTotal %></td>
	  	</tr>
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("zoneLevel")){
		List<Zone> zoneList = Zone.getAllZones();
		Iterator<Zone> zoneItr = null;
		if(!zoneList.isEmpty())
			zoneItr = zoneList.iterator();
		%>
		<div id="zoneLevelReportDiv">
			<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
				<tr>
					<th colspan="4">
						<%
							String reportLevelDisplay = null;
							if(reportLevel.equals("regionLevel"))
								reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
							else if(reportLevel.equals("zoneLevel"))
								reportLevelDisplay = "Zone Level/ዞን ደረጃ";
							else if(reportLevel.equals("woredaLevel"))
								reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
						%>
						Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
						Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
						Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
					</th>
				</tr>
				<tr>
					<th>Zone/ዞን</th>
					<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
					<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
					<th>Total/በጠቅላላ</th>
				</tr>
			<%
				float zoneTrainingGivenToProfessionalsAndHeadsMale=0.0f;
				float zoneTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
				float zoneTotal=0.0f;
				
				Zone zone = Zone.getZone(Integer.parseInt(reportZone));
					float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);	
					
					float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
					%>
					<tr>
						<td><%=zone.getZoneName() %></td>
						<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
						<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
						<td><%=sumTotal %></td>
					</tr>
					<%
					zoneTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
					zoneTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
					zoneTotal += sumTotal;
				
			  %>		
			  	<tr>
			  		<td>አጠቃላይ ድምር</td>
			  		<td><%=zoneTrainingGivenToProfessionalsAndHeadsMale %></td>
			  		<td><%=zoneTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
			  		<td><%=zoneTotal %></td>
			  	</tr>
			</table>
		</div>
		<%
	}
%>
</div>
<table border="0" width="100%">
	<tr>
		<td align="right">
			<a href="#.jsp" onclick="printDiv('printReportDiv')">Print Report / ሪፖርቱን አትም <img src="images/printer.jpeg" border="0" align="absmiddle"/></a>
		</td>
	</tr>
</table>