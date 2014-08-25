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
			<th>Region/ሪጅን</th>
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
		if (reportLevel.equalsIgnoreCase("all")) {
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
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
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
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
		}
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionCostOfServingInformationRequest %></td>
	  		<td><%=regionCostOfPublishingInformation %></td>
	  		<td><%=regionRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=regionNumberOfInformationRequestServedFreeOfCharge %></td>
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
			<th>Woreda/ወረዳ</th>
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
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
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
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaCostOfServingInformationRequest %></td>
	  		<td><%=woredaCostOfPublishingInformation %></td>
	  		<td><%=woredaRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=woredaNumberOfInformationRequestServedFreeOfCharge %></td>
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
			<th colspan="6">የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
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
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			
			float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
					revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
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
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleCostOfServingInformationRequest %></td>
	  		<td><%=kebeleCostOfPublishingInformation %></td>
	  		<td><%=kebeleRevenueCollectedFromInformationRequesters %></td>
	  		<td><%=kebeleNumberOfInformationRequestServedFreeOfCharge %></td>
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
		<div id="kebeleLevelReportDiv">
			<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
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
					<th>Zone/ዞን</th>
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
				
				Zone zone = Zone.getZone(Integer.parseInt(reportZone));
					float costOfServingInformationRequest = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_serving_information_request", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float costOfPublishingInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "cost_of_publishing_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float revenueCollectedFromInformationRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "revenue_collected_from_users_cover_admin_cost", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float numberOfInformationRequestServedFreeOfCharge = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_information_service_admin_cost", "number_of_information_request_served_free_of_charge", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					
					float sumTotal = costOfServingInformationRequest + costOfPublishingInformation + 
							revenueCollectedFromInformationRequesters + numberOfInformationRequestServedFreeOfCharge;
					%>
					<tr>
						<td><%=zone.getZoneName() %></td>
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
				
			  %>		
			  	<tr>
			  		<td>አጠቃላይ ድምር</td>
			  		<td><%=zoneCostOfServingInformationRequest %></td>
			  		<td><%=zoneCostOfPublishingInformation %></td>
			  		<td><%=zoneRevenueCollectedFromInformationRequesters %></td>
			  		<td><%=zoneNumberOfInformationRequestServedFreeOfCharge %></td>
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