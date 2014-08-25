<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date" %>
<div id="printReportDiv">
<%	
	int selectedTerritoryId = Integer.parseInt(request.getParameter("selectedTerritoryId"));

	String reportRegion = request.getParameter("reportRegion");
	String reportZone = request.getParameter("reportZone");
	String reportWoreda = request.getParameter("reportWoreda");
	String reportKebele = request.getParameter("reportKebele");

	String reportLevel = request.getParameter("reportLevel");
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
	
	System.out.println("on trainig and ... reportRegion = "+reportRegion+"   reportZone = "+reportZone+
			"   reportWoreda = "+reportWoreda+"   reportKebele = "+reportKebele+
			"   reportLevel = "+reportLevel+"   selectedTerritoryId = "+selectedTerritoryId);
	//out.print(selectedTerritoryId+" : "+reportLevel+" : "+dateFrom+" : "+dateTo);
%>
<%	
	
	if(reportLevel.equalsIgnoreCase("regionLevel")|| reportLevel.equalsIgnoreCase("zoneLevel")){		
%>
<div id="regionLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("region_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Publishing Information<br/>መረጃን አትሞ ለማውጣት</th>
			<th>Document and Archive Organization<br/>የሰነድና ማህደር ክፍል ማደራጀት</th>
			<th>Training to Heads and Professionals<br/>ለኃላፉዎችና ባለሙያዎች ስልጠና መስጠት</th>
			<th>Establishing System to Serve Information Requests<br/>የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
			<th>Others<br/>ሌሎች</th>
			<th>Total<br/>በጠቅላላ</th>
		</tr>
		<%
		float regionPublishingTotal=0.0f;
		float regionOrganizingRecordOffice=0.0f;
		float regionTrainingProvisions=0.0f;
		float regionEstablisingSystem=0.0f;
		float regionOthers=0.0f;
		float regionTotal=0.0f;
			int ctr=1;
			while(sectorOrganizationItr.hasNext()){
				GovernmentSectorOrganization organization = sectorOrganizationItr.next();
				float publishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float organizingRecordOffice = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "organizaing_record_office", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float trainingProvisions = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "training_provisions_for_heads_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float establishingSystem = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "establishing_system_to_serve_information_requesters", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "others", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				
				float sumTotal = publishingInformation+organizingRecordOffice+trainingProvisions+
						establishingSystem+others;
				regionPublishingTotal += publishingInformation;
				regionOrganizingRecordOffice += organizingRecordOffice;
				regionTrainingProvisions += trainingProvisions;
				regionEstablisingSystem += establishingSystem;
				regionOthers += others;
				regionTotal += sumTotal;				
				%>
				<tr>
					<td align="left"><%=organization.getOrganizationName() %></td>
					<td align="center"><%=publishingInformation %></td>
					<td align="center"><%=organizingRecordOffice %></td>
					<td align="center"><%=trainingProvisions %></td>
					<td align="center"><%=establishingSystem %></td>
					<td align="center"><%=others %></td>
					<td align="center"><%=sumTotal %></td>
				</tr>
				<%
				ctr++;
			}//end while loop		
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td align="center"><%=regionPublishingTotal %></td>
			<td align="center"><%=regionOrganizingRecordOffice %></td>
			<td align="center"><%=regionTrainingProvisions %></td>
			<td align="center"><%=regionEstablisingSystem %></td>
			<td align="center"><%=regionOthers %></td>
			<td align="center"><%=regionTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("woreda_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Publishing Information<br/>መረጃን አትሞ ለማውጣት</th>
			<th>Document and Archive Organization<br/>የሰነድና ማህደር ክፍል ማደራጀት</th>
			<th>Training to Heads and Professionals<br/>ለኃላፉዎችና ባለሙያዎች ስልጠና መስጠት</th>
			<th>Establishing System to Serve Information Requests<br/>የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
			<th>Others<br/>ሌሎች</th>
			<th>Total<br/>በጠቅላላ</th>
		</tr>
		<%
		float woredaPublishingTotal=0.0f;
		float woredaOrganizingRecordOffice=0.0f;
		float woredaTrainingProvisions=0.0f;
		float woredaEstablisingSystem=0.0f;
		float woredaOthers=0.0f;
		float woredaTotal=0.0f;
		
			while(sectorOrganizationItr.hasNext()){
				GovernmentSectorOrganization organization = sectorOrganizationItr.next();
				float publishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float organizingRecordOffice = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "organizaing_record_office", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float trainingProvisions = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "training_provisions_for_heads_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float establishingSystem = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "establishing_system_to_serve_information_requesters", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "others", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				
				float sumTotal = publishingInformation+organizingRecordOffice+trainingProvisions+
						establishingSystem+others;
				woredaPublishingTotal += publishingInformation;
				woredaOrganizingRecordOffice += organizingRecordOffice;
				woredaTrainingProvisions += trainingProvisions;
				woredaEstablisingSystem += establishingSystem;
				woredaOthers += others;
				woredaTotal += sumTotal;
				%>
				<tr>
					<td><%=organization.getOrganizationName() %></td>
					<td><%=publishingInformation %></td>
					<td><%=organizingRecordOffice %></td>
					<td><%=trainingProvisions %></td>
					<td><%=establishingSystem %></td>
					<td><%=others %></td>
					<td><%=sumTotal %></td>
				</tr>
				<%
			}//end while loop		
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=woredaPublishingTotal %></td>
			<td><%=woredaOrganizingRecordOffice %></td>
			<td><%=woredaTrainingProvisions %></td>
			<td><%=woredaEstablisingSystem %></td>
			<td><%=woredaOthers %></td>
			<td><%=woredaTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("kebele_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ሴክተር መሥሪያ ቤት</th>
			<th>መረጃን አትሞ ለማውጣት</th>
			<th>የሰነድና ማህደር ክፍል ማደራጀት</th>
			<th>ለኃላፉዎችና ባለሙያዎች ስልጠና መስጠት</th>
			<th>የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
			<th>ሌሎች</th>
			<th>በጠቅላላ</th>
		</tr>
		<%
		float kebelePublishingTotal=0.0f;
		float kebeleOrganizingRecordOffice=0.0f;
		float kebeleTrainingProvisions=0.0f;
		float kebeleEstablisingSystem=0.0f;
		float kebeleOthers=0.0f;
		float kebeleTotal=0.0f;
		
			while(sectorOrganizationItr.hasNext()){
				GovernmentSectorOrganization organization = sectorOrganizationItr.next();
				float publishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float organizingRecordOffice = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "organizaing_record_office", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float trainingProvisions = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "training_provisions_for_heads_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float establishingSystem = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "establishing_system_to_serve_information_requesters", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "others", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				
				float sumTotal = publishingInformation+organizingRecordOffice+trainingProvisions+
						establishingSystem+others;
				kebelePublishingTotal += publishingInformation;
				kebeleOrganizingRecordOffice += organizingRecordOffice;
				kebeleTrainingProvisions += trainingProvisions;
				kebeleEstablisingSystem += establishingSystem;
				kebeleOthers += others;
				kebeleTotal += sumTotal;
				%>
				<tr>
					<td><%=organization.getOrganizationName() %></td>
					<td><%=publishingInformation %></td>
					<td><%=organizingRecordOffice %></td>
					<td><%=trainingProvisions %></td>
					<td><%=establishingSystem %></td>
					<td><%=others %></td>
					<td><%=sumTotal %></td>
				</tr>
				<%
			}//end while loop		
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=kebelePublishingTotal %></td>
			<td><%=kebeleOrganizingRecordOffice %></td>
			<td><%=kebeleTrainingProvisions %></td>
			<td><%=kebeleEstablisingSystem %></td>
			<td><%=kebeleOthers %></td>
			<td><%=kebeleTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
	</table>
</div>
<div id="sectorLevelReportDiv">

</div>
<%
	}else if(reportLevel.equalsIgnoreCase("zoneLevel")){
		List<Zone> zoneList = Zone.getAllZones();
		Iterator<Zone> zoneItr = null;
		if(!zoneList.isEmpty())
			zoneItr = zoneList.iterator();
		%>
		<div id="zoneLevelReportDiv">
			<table border="0" width="100%" class="reportTable">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("zone_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Publishing Information<br/>መረጃን አትሞ ለማውጣት</th>
			<th>Document and Archive Organization<br/>የሰነድና ማህደር ክፍል ማደራጀት</th>
			<th>Training to Heads and Professionals<br/>ለኃላፉዎችና ባለሙያዎች ስልጠና መስጠት</th>
			<th>Establishing System to Serve Information Requests<br/>የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
			<th>Others<br/>ሌሎች</th>
			<th>Total<br/>በጠቅላላ</th>
		</tr>
		<%
		float zonePublishingTotal=0.0f;
		float zoneOrganizingRecordOffice=0.0f;
		float zoneTrainingProvisions=0.0f;
		float zoneEstablisingSystem=0.0f;
		float zoneOthers=0.0f;
		float zoneTotal=0.0f;
		
			while(sectorOrganizationItr.hasNext()){
				GovernmentSectorOrganization organization = sectorOrganizationItr.next();
				float publishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float organizingRecordOffice = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "organizaing_record_office", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float trainingProvisions = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "training_provisions_for_heads_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float establishingSystem = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "establishing_system_to_serve_information_requesters", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_basic_info_about_report", "others", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
				
				float sumTotal = publishingInformation+organizingRecordOffice+trainingProvisions+
						establishingSystem+others;
				zonePublishingTotal += publishingInformation;
				zoneOrganizingRecordOffice += organizingRecordOffice;
				zoneTrainingProvisions += trainingProvisions;
				zoneEstablisingSystem += establishingSystem;
				zoneOthers += others;
				zoneTotal += sumTotal;
				%>
				<tr>
					<td><%=organization.getOrganizationName() %></td>
					<td><%=publishingInformation %></td>
					<td><%=organizingRecordOffice %></td>
					<td><%=trainingProvisions %></td>
					<td><%=establishingSystem %></td>
					<td><%=others %></td>
					<td><%=sumTotal %></td>
				</tr>
				<%
			}//end while loop		
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=zonePublishingTotal %></td>
			<td><%=zoneOrganizingRecordOffice %></td>
			<td><%=zoneTrainingProvisions %></td>
			<td><%=zoneEstablisingSystem %></td>
			<td><%=zoneOthers %></td>
			<td><%=zoneTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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