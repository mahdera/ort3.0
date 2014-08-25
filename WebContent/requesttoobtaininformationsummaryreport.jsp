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
			<th colspan="9">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Request to Obtain Information/መረጃ ለማግኘት የቀረበ ጥያቄን በተመለከተ<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
				<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region<br/>ሪጅን</th>
			<th>Annual Request to Gov Body (Male)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወንድ)</th>
			<th>Annual Request to Gov Body (Female)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ሴት)</th>
			<th>Annual Request to Gov Body (Both)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወል)</th>
			<th>Annual Request to Gov Body (Organization)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ድርጅት)</th>
			<th>Fully Accepted Requests<br/>ሙሉ በሙሉ ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Partially Accepted Requests<br/>በከፊል ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Fully Rejected Requests<br/>ሙሉ በሙሉ ተቀባይነት ያላገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float regionYearlyInformationRequestMale=0.0f;
		float regionYearlyInformationRequestFemale=0.0f;
		float regionYearlyInformationRequestBoth=0.0f;
		float regionYearlyInformationRequestOrganization=0.0f;
		float regionFullyAcceptedInformationRequest=0.0f;
		float regionPartiallyAcceptedInformationRequest=0.0f;
		float regionFullyRejectedInformationRequest=0.0f;
		float regionTotal=0.0f;
		if(reportLevel.equalsIgnoreCase("all")){
			
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			
			float yearlyInformationRequestMale = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_male",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestFemale = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_female",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestBoth = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_both", 
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestOrganization = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_organization",
											reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float fullyAcceptedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "fully_accepted_information_request",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float partiallyAcceptedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "partially_accepted_information_request",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float fullyRejectedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_request_to_obtain_information", "fully_rejected_information_request", 
											reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			
			float sumTotal = yearlyInformationRequestMale+yearlyInformationRequestFemale+
					yearlyInformationRequestBoth+yearlyInformationRequestOrganization+fullyAcceptedInformationRequest+
					partiallyAcceptedInformationRequest+fullyRejectedInformationRequest;
			regionYearlyInformationRequestMale += yearlyInformationRequestMale;
			regionYearlyInformationRequestFemale += yearlyInformationRequestFemale;
			regionYearlyInformationRequestBoth += yearlyInformationRequestBoth;
			regionYearlyInformationRequestOrganization += yearlyInformationRequestOrganization;
			regionFullyAcceptedInformationRequest += fullyAcceptedInformationRequest;
			regionPartiallyAcceptedInformationRequest += partiallyAcceptedInformationRequest;
			regionFullyRejectedInformationRequest += fullyRejectedInformationRequest;
			regionTotal += sumTotal;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=yearlyInformationRequestMale %></td>
				<td><%=yearlyInformationRequestFemale %></td>
				<td><%=yearlyInformationRequestBoth %></td>
				<td><%=yearlyInformationRequestOrganization %></td>
				<td><%=fullyAcceptedInformationRequest %></td>
				<td><%=partiallyAcceptedInformationRequest %></td>
				<td><%=fullyRejectedInformationRequest %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			
			float yearlyInformationRequestMale = ReportGenerator
			.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "yearly_information_request_male",
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float yearlyInformationRequestFemale = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "yearly_information_request_female",
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float yearlyInformationRequestBoth = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "yearly_information_request_both", 
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float yearlyInformationRequestOrganization = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "yearly_information_request_organization",
									reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float fullyAcceptedInformationRequest = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "fully_accepted_information_request",
								reportLevel,Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float partiallyAcceptedInformationRequest = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_request_to_obtain_information", "partially_accepted_information_request",
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float fullyRejectedInformationRequest = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_request_to_obtain_information", "fully_rejected_information_request", 
									reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	
	float sumTotal = yearlyInformationRequestMale+yearlyInformationRequestFemale+
			yearlyInformationRequestBoth+yearlyInformationRequestOrganization+fullyAcceptedInformationRequest+
			partiallyAcceptedInformationRequest+fullyRejectedInformationRequest;
	regionYearlyInformationRequestMale += yearlyInformationRequestMale;
	regionYearlyInformationRequestFemale += yearlyInformationRequestFemale;
	regionYearlyInformationRequestBoth += yearlyInformationRequestBoth;
	regionYearlyInformationRequestOrganization += yearlyInformationRequestOrganization;
	regionFullyAcceptedInformationRequest += fullyAcceptedInformationRequest;
	regionPartiallyAcceptedInformationRequest += partiallyAcceptedInformationRequest;
	regionFullyRejectedInformationRequest += fullyRejectedInformationRequest;
	regionTotal += sumTotal;
	%>
	<tr>
		<td><%=region.getRegionName() %></td>
		<td><%=yearlyInformationRequestMale %></td>
		<td><%=yearlyInformationRequestFemale %></td>
		<td><%=yearlyInformationRequestBoth %></td>
		<td><%=yearlyInformationRequestOrganization %></td>
		<td><%=fullyAcceptedInformationRequest %></td>
		<td><%=partiallyAcceptedInformationRequest %></td>
		<td><%=fullyRejectedInformationRequest %></td>				
		<td><%=sumTotal %></td>
	</tr>
	<%
		}
	%>

		<tr>
			<td>Total Sum<br/>አጠቃላይ ድምር</td>
			<td><%=regionYearlyInformationRequestMale %></td>
			<td><%=regionYearlyInformationRequestFemale %></td>
			<td><%=regionYearlyInformationRequestBoth %></td>
			<td><%=regionYearlyInformationRequestOrganization %></td>
			<td><%=regionFullyAcceptedInformationRequest %></td>
			<td><%=regionPartiallyAcceptedInformationRequest %></td>
			<td><%=regionFullyRejectedInformationRequest %></td>
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
			<th colspan="9">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Request to Obtain Information/መረጃ ለማግኘት የቀረበ ጥያቄን በተመለከተ<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda<br/>ወረዳ</th>
			<th>Annual Request to Gov Body (Male)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወንድ)</th>
			<th>Annual Request to Gov Body (Female)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ሴት)</th>
			<th>Annual Request to Gov Body (Both)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወል)</th>
			<th>Annual Request to Gov Body (Organization)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ድርጅት)</th>
			<th>Fully Accepted Requests<br/>ሙሉ በሙሉ ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Partially Accepted Requests<br/>በከፊል ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Fully Rejected Requests<br/>ሙሉ በሙሉ ተቀባይነት ያላገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaYearlyInformationRequestMale=0.0f;
		float woredaYearlyInformationRequestFemale=0.0f;
		float woredaYearlyInformationRequestBoth=0.0f;
		float woredaYearlyInformationRequestOrganization=0.0f;
		float woredaFullyAcceptedInformationRequest=0.0f;
		float woredaPartiallyAcceptedInformationRequest=0.0f;
		float woredaFullyRejectedInformationRequest=0.0f;
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
		
			float yearlyInformationRequestMale = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_male",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestFemale = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_female",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestBoth = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_both",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestOrganization = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_organization",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float fullyAcceptedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "fully_accepted_information_request",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float partiallyAcceptedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "partially_accepted_information_request", 
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float fullyRejectedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "fully_rejected_information_request",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			
			float sumTotal = yearlyInformationRequestMale+yearlyInformationRequestFemale+
					yearlyInformationRequestBoth+yearlyInformationRequestOrganization+fullyAcceptedInformationRequest+
					partiallyAcceptedInformationRequest+fullyRejectedInformationRequest;
			woredaYearlyInformationRequestMale += yearlyInformationRequestMale;
			woredaYearlyInformationRequestFemale += yearlyInformationRequestFemale;
			woredaYearlyInformationRequestBoth += yearlyInformationRequestBoth;
			woredaYearlyInformationRequestOrganization += yearlyInformationRequestOrganization;
			woredaFullyAcceptedInformationRequest += fullyAcceptedInformationRequest;
			woredaPartiallyAcceptedInformationRequest += partiallyAcceptedInformationRequest;
			woredaFullyRejectedInformationRequest += fullyRejectedInformationRequest;
			woredaTotal += sumTotal;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=yearlyInformationRequestMale %></td>
				<td><%=yearlyInformationRequestFemale %></td>
				<td><%=yearlyInformationRequestBoth %></td>
				<td><%=yearlyInformationRequestOrganization %></td>
				<td><%=fullyAcceptedInformationRequest %></td>
				<td><%=partiallyAcceptedInformationRequest %></td>
				<td><%=fullyRejectedInformationRequest %></td>				
				<td><%=sumTotal %></td>
			</tr>
			
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=woredaYearlyInformationRequestMale %></td>
			<td><%=woredaYearlyInformationRequestFemale %></td>
			<td><%=woredaYearlyInformationRequestBoth %></td>
			<td><%=woredaYearlyInformationRequestOrganization %></td>
			<td><%=woredaFullyAcceptedInformationRequest %></td>
			<td><%=woredaPartiallyAcceptedInformationRequest %></td>
			<td><%=woredaFullyRejectedInformationRequest %></td>
			<td><%=woredaTotal %></td>			
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
			<th colspan="9">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Request to Obtain Information/መረጃ ለማግኘት የቀረበ ጥያቄን በተመለከተ<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Zone<br/>ዞን</th>
			<th>Annual Request to Gov Body (Male)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወንድ)</th>
			<th>Annual Request to Gov Body (Female)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ሴት)</th>
			<th>Annual Request to Gov Body (Both)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወል)</th>
			<th>Annual Request to Gov Body (Organization)<br/>በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ድርጅት)</th>
			<th>Fully Accepted Requests<br/>ሙሉ በሙሉ ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Partially Accepted Requests<br/>በከፊል ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Fully Rejected Requests<br/>ሙሉ በሙሉ ተቀባይነት ያላገኙ የመረጃ ጥያቄዎች ብዛት</th>
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float zoneYearlyInformationRequestMale=0.0f;
		float zoneYearlyInformationRequestFemale=0.0f;
		float zoneYearlyInformationRequestBoth=0.0f;
		float zoneYearlyInformationRequestOrganization=0.0f;
		float zoneFullyAcceptedInformationRequest=0.0f;
		float zonePartiallyAcceptedInformationRequest=0.0f;
		float zoneFullyRejectedInformationRequest=0.0f;
		float zoneTotal=0.0f;
		
		Zone zone = Zone.getZone(Integer.parseInt(reportZone));
		
			float yearlyInformationRequestMale = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_male",
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestFemale = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_female", 
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestBoth = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_both", 
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float yearlyInformationRequestOrganization = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_request_to_obtain_information", "yearly_information_request_organization",
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float fullyAcceptedInformationRequest = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_request_to_obtain_information", "fully_accepted_information_request", 
											reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float partiallyAcceptedInformationRequest = ReportGenerator
							.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_request_to_obtain_information", "partially_accepted_information_request",
												reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float fullyRejectedInformationRequest = ReportGenerator
							.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_request_to_obtain_information", "fully_rejected_information_request",
											reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			
			float sumTotal = yearlyInformationRequestMale+yearlyInformationRequestFemale+
					yearlyInformationRequestBoth+yearlyInformationRequestOrganization+fullyAcceptedInformationRequest+
					partiallyAcceptedInformationRequest+fullyRejectedInformationRequest;
			zoneYearlyInformationRequestMale += yearlyInformationRequestMale;
			zoneYearlyInformationRequestFemale += yearlyInformationRequestFemale;
			zoneYearlyInformationRequestBoth += yearlyInformationRequestBoth;
			zoneYearlyInformationRequestOrganization += yearlyInformationRequestOrganization;
			zoneFullyAcceptedInformationRequest += fullyAcceptedInformationRequest;
			zonePartiallyAcceptedInformationRequest += partiallyAcceptedInformationRequest;
			zoneFullyRejectedInformationRequest += fullyRejectedInformationRequest;
			zoneTotal += sumTotal;
			%>
			<tr>
				<td><%=zone.getZoneName() %></td>
				<td><%=yearlyInformationRequestMale %></td>
				<td><%=yearlyInformationRequestFemale %></td>
				<td><%=yearlyInformationRequestBoth %></td>
				<td><%=yearlyInformationRequestOrganization %></td>
				<td><%=fullyAcceptedInformationRequest %></td>
				<td><%=partiallyAcceptedInformationRequest %></td>
				<td><%=fullyRejectedInformationRequest %></td>				
				<td><%=sumTotal %></td>
			</tr>
			
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=zoneYearlyInformationRequestMale %></td>
			<td><%=zoneYearlyInformationRequestFemale %></td>
			<td><%=zoneYearlyInformationRequestBoth %></td>
			<td><%=zoneYearlyInformationRequestOrganization %></td>
			<td><%=zoneFullyAcceptedInformationRequest %></td>
			<td><%=zonePartiallyAcceptedInformationRequest %></td>
			<td><%=zoneFullyRejectedInformationRequest %></td>
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