<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<div id="printReportDiv">
<%
	int selectedTerritoryId = Integer.parseInt(request.getParameter("selectedTerritoryId"));
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
	
	if(reportLevel.equalsIgnoreCase("regionLevel")){
		List<Region> regionList = Region.getAllRegions();
		Iterator<Region> regionItr = null;
		if(!regionList.isEmpty())
			regionItr = regionList.iterator();
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
			<th colspan="6">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Information Right Implementation and Administration Cost Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Cost to Serve Information Request/የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ</th>
			<th>Cost to Publish Information/መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ</th>	
			<th>Revenue Collected from Information Requesters to Cover Administration Cost/አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ</th>
			<th>Information Request Served Free of Cost/ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት</th>					
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionCostOfServingInformationRequest=0.0f;
		float regionCostOfPublishingInformation=0.0f;
		float regionRevenueCollectedFromInformationRequesters=0.0f;
		float regionNumberOfInformationRequestServedFreeOfCharge=0.0f;
		float regionTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=costOfServingInformationRequest %></td>											
				<td><%=costOfPublishingInformation %></td>
				<td><%=revenueCollectedFromInformationRequesters %></td>
				<td><%=numberOfInformationRequestServedFreeOfCharge %></td>
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionCostOfServingInformationRequest += costOfServingInformationRequest;
			regionCostOfPublishingInformation += costOfPublishingInformation;
			regionRevenueCollectedFromInformationRequesters += revenueCollectedFromInformationRequesters;
			regionNumberOfInformationRequestServedFreeOfCharge += numberOfInformationRequestServedFreeOfCharge;
			regionTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionCostOfServingInformationRequest %></td>
	  		<td><%=regionCostOfPublishingInformation %></td>
	  		<td><%=regionRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=regionNumberOfInformationRequestServedFreeOfCharge %></td>
	  		<td><%=regionTotal %></td>
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
			<th colspan="6">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Information Right Implementation and Administration Cost Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Cost to Serve Information Request/የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ</th>
			<th>Cost to Publish Information/መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ</th>	
			<th>Revenue Collected from Information Requesters to Cover Administration Cost/አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ</th>
			<th>Information Request Served Free of Cost/ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት</th>					
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaCostOfServingInformationRequest=0.0f;
		float woredaCostOfPublishingInformation=0.0f;
		float woredaRevenueCollectedFromInformationRequesters=0.0f;
		float woredaNumberOfInformationRequestServedFreeOfCharge=0.0f;
		float woredaTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=costOfServingInformationRequest %></td>											
				<td><%=costOfPublishingInformation %></td>
				<td><%=revenueCollectedFromInformationRequesters %></td>
				<td><%=numberOfInformationRequestServedFreeOfCharge %></td>
				<td><%=sumTotal %></td>
			</tr>
			<%
			woredaCostOfServingInformationRequest += costOfServingInformationRequest;
			woredaCostOfPublishingInformation += costOfPublishingInformation;
			woredaRevenueCollectedFromInformationRequesters += revenueCollectedFromInformationRequesters;
			woredaNumberOfInformationRequestServedFreeOfCharge += numberOfInformationRequestServedFreeOfCharge;
			woredaTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaCostOfServingInformationRequest %></td>
	  		<td><%=woredaCostOfPublishingInformation %></td>
	  		<td><%=woredaRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=woredaNumberOfInformationRequestServedFreeOfCharge %></td>
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
			<th colspan="6">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Information Right Implementation and Administration Cost Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>ሴክተር መሥሪያ ቤት</th>
			<th>የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ</th>
			<th>መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ</th>	
			<th>አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ</th>
			<th>ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት</th>					
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleCostOfServingInformationRequest=0.0f;
		float kebeleCostOfPublishingInformation=0.0f;
		float kebeleRevenueCollectedFromInformationRequesters=0.0f;
		float kebeleNumberOfInformationRequestServedFreeOfCharge=0.0f;
		float kebeleTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=costOfServingInformationRequest %></td>											
				<td><%=costOfPublishingInformation %></td>
				<td><%=revenueCollectedFromInformationRequesters %></td>
				<td><%=numberOfInformationRequestServedFreeOfCharge %></td>
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleCostOfServingInformationRequest += costOfServingInformationRequest;
			kebeleCostOfPublishingInformation += costOfPublishingInformation;
			kebeleRevenueCollectedFromInformationRequesters += revenueCollectedFromInformationRequesters;
			kebeleNumberOfInformationRequestServedFreeOfCharge += numberOfInformationRequestServedFreeOfCharge;
			kebeleTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleCostOfServingInformationRequest %></td>
	  		<td><%=kebeleCostOfPublishingInformation %></td>
	  		<td><%=kebeleRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=kebeleNumberOfInformationRequestServedFreeOfCharge %></td>
	  		<td><%=kebeleTotal %></td>
	  	</tr>
	  	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("zoneLevel")){
		List<Zone> zoneList = Zone.getAllZones();
		Iterator<Zone> zoneItr = null;
		if(!zoneList.isEmpty())
			zoneItr = zoneList.iterator();
		%>
		<div id="kebeleLevelReportDiv">
			<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("zone_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="6">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Information Right Implementation and Administration Cost Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Cost to Serve Information Request/የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ</th>
			<th>Cost to Publish Information/መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ</th>	
			<th>Revenue Collected from Information Requesters to Cover Administration Cost/አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ</th>
			<th>Information Request Served Free of Cost/ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት</th>					
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float zoneCostOfServingInformationRequest=0.0f;
		float zoneCostOfPublishingInformation=0.0f;
		float zoneRevenueCollectedFromInformationRequesters=0.0f;
		float zoneNumberOfInformationRequestServedFreeOfCharge=0.0f;
		float zoneTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=costOfServingInformationRequest %></td>											
				<td><%=costOfPublishingInformation %></td>
				<td><%=revenueCollectedFromInformationRequesters %></td>
				<td><%=numberOfInformationRequestServedFreeOfCharge %></td>
				<td><%=sumTotal %></td>
			</tr>
			<%
			zoneCostOfServingInformationRequest += costOfServingInformationRequest;
			zoneCostOfPublishingInformation += costOfPublishingInformation;
			zoneRevenueCollectedFromInformationRequesters += revenueCollectedFromInformationRequesters;
			zoneNumberOfInformationRequestServedFreeOfCharge += numberOfInformationRequestServedFreeOfCharge;
			zoneTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=zoneCostOfServingInformationRequest %></td>
	  		<td><%=zoneCostOfPublishingInformation %></td>
	  		<td><%=zoneRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=zoneNumberOfInformationRequestServedFreeOfCharge %></td>
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