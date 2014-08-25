<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<div id="printReportDiv">
	<%
		//int selectedTerritoryId = Integer.parseInt(request.getParameter("selectedTerritoryId"));
		String reportRegion = request.getParameter("reportRegion");
		String reportZone = request.getParameter("reportZone");
		String reportWoreda = request.getParameter("reportWoreda");
		String reportKebele = request.getParameter("reportKebele");
		String reportSector = request.getParameter("reportSector");

		String reportLevel;
		Date dateFrom = Date.valueOf(request.getParameter("dateFrom"));
		Date dateTo = Date.valueOf(request.getParameter("dateTo"));
		//now show the ethiopic dates in here...just simply grab the values from the caller form...
		
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
		
		if (reportLevel.equalsIgnoreCase("regionLevel") || reportLevel.equalsIgnoreCase("all")) {
			List<Region> regionList = Region.getAllRegions();
			Iterator<Region> regionItr = null;
			if (!regionList.isEmpty())
				regionItr = regionList.iterator();
	%>
	<div id="regionLevelReportDiv">
		<table border="0" width="100%" class="reportTable"  style="border: 1px solid #2779aa" rules="all">
			<tr>
				<th colspan="7">
					<%
						String reportLevelDisplay = null;
							if (reportLevel.equals("regionLevel"))
								reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
							else if (reportLevel.equals("zoneLevel"))
								reportLevelDisplay = "Zone Level/ዞን ደረጃ";
							else if (reportLevel.equals("woredaLevel"))
								reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
					%> Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ
					ሪፖርት<br /> Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay%> <br />
					Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom + " to " + dateTo)%>
					G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
				</th>
			</tr>
			<tr>
				<th>Region<br />ክልል</th>
				<th>Publishing Information<br />መረጃን አትሞ ለማውጣት</th>
				<th>Document and Archive Organization<br />የሰነድና ማህደር ክፍል ማደራጀት</th>
				<th>Training to Heads and Professionals<br />ለኃላፊዎችና ባለሙያዎች
					ስልጠና መስጠት</th>
				<th>Establishing System to Serve Information Requests<br />የመረጃ
					ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
				<th>Others<br />ሌሎች</th>
				<th>Total<br />በጠቅላላ</th>
			</tr>
			<%
					float regionPublishingTotal = 0.0f;
					float regionOrganizingRecordOffice = 0.0f;
					float regionTrainingProvisions = 0.0f;
					float regionEstablisingSystem = 0.0f;
					float regionOthers = 0.0f;
					float regionTotal = 0.0f;
					if (reportLevel.equalsIgnoreCase("all")) {

						while (regionItr.hasNext()) {
							Region region = regionItr.next();
							float publishingInformation = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
											"tbl_basic_info_about_report",
											"publishing_information", reportLevel,
											region.getId(), dateFrom, dateTo,reportSector);
							System.out.println("pub info: "+publishingInformation);
							float organizingRecordOffice = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
											"tbl_basic_info_about_report",
											"organizaing_record_office",
											reportLevel, region.getId(), dateFrom,
											dateTo,reportSector);
							float trainingProvisions = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
											"tbl_basic_info_about_report",
											"training_provisions_for_heads_and_professionals",
											reportLevel, region.getId(), dateFrom,
											dateTo,reportSector);
							float establishingSystem = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
											"tbl_basic_info_about_report",
											"establishing_system_to_serve_information_requesters",
											reportLevel, region.getId(), dateFrom,
											dateTo,reportSector);
							float others = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
											"tbl_basic_info_about_report",
											"others", reportLevel, region.getId(),
											dateFrom, dateTo,reportSector);
							float sumTotal = publishingInformation
									+ organizingRecordOffice + trainingProvisions
									+ establishingSystem + others;
							regionPublishingTotal += publishingInformation;
							regionOrganizingRecordOffice += organizingRecordOffice;
							regionTrainingProvisions += trainingProvisions;
							regionEstablisingSystem += establishingSystem;
							regionOthers += others;
							regionTotal += sumTotal;
			%>
				<tr>
					<td><%=region.getRegionName()%></td>
					<td><%=publishingInformation%></td>
					<td><%=organizingRecordOffice%></td>
					<td><%=trainingProvisions%></td>
					<td><%=establishingSystem%></td>
					<td><%=others%></td>
					<td><%=sumTotal%></td>
				</tr>
				<%
					}//end while loop
						} else {
							Region region = Region.getRegion(Integer.parseInt(reportRegion));

						float publishingInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"publishing_information", reportLevel,
										Integer.parseInt(reportRegion), dateFrom,
										dateTo,reportSector);
						float organizingRecordOffice = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"organizaing_record_office", reportLevel,
										Integer.parseInt(reportRegion), dateFrom,
										dateTo,reportSector);
						float trainingProvisions = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"training_provisions_for_heads_and_professionals",
										reportLevel,
										Integer.parseInt(reportRegion), dateFrom,
										dateTo,reportSector);
						float establishingSystem = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"establishing_system_to_serve_information_requesters",
										reportLevel,
										Integer.parseInt(reportRegion), dateFrom,
										dateTo,reportSector);
						float others = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report", "others",
										reportLevel,
										Integer.parseInt(reportRegion), dateFrom,
										dateTo,reportSector);
						float sumTotal = publishingInformation
								+ organizingRecordOffice + trainingProvisions
								+ establishingSystem + others;
						regionPublishingTotal += publishingInformation;
						regionOrganizingRecordOffice += organizingRecordOffice;
						regionTrainingProvisions += trainingProvisions;
						regionEstablisingSystem += establishingSystem;
						regionOthers += others;
						regionTotal += sumTotal;
			%>			<tr>
			<td><%=region.getRegionName()%></td>
			<td><%=publishingInformation%></td>
			<td><%=organizingRecordOffice%></td>
			<td><%=trainingProvisions%></td>
			<td><%=establishingSystem%></td>
			<td><%=others%></td>
			<td><%=sumTotal%></td>
		</tr>
		<%
			
						}//end fo if
			%>
			<tr>
				<td>Total Sum<br />አጠቃላይ ድምር</td>
				<td><%=regionPublishingTotal%></td>
				<td><%=regionOrganizingRecordOffice%></td>
				<td><%=regionTrainingProvisions%></td>
				<td><%=regionEstablisingSystem%></td>
				<td><%=regionOthers%></td>
				<td><%=regionTotal%></td>
			</tr>
		</table>

	</div>
	<%
		} else if (reportLevel.equalsIgnoreCase("woredaLevel")) {
			List<Woreda> woredaList = Woreda.getAllWoredas();
			Iterator<Woreda> woredaItr = null;
			if (!woredaList.isEmpty())
				woredaItr = woredaList.iterator();
	%>
	<div id="woredaLevelReportDiv">
		<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
			<tr>
				<th colspan="7">
					<%
						String reportLevelDisplay = null;
							if (reportLevel.equals("regionLevel"))
								reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
							else if (reportLevel.equals("zoneLevel"))
								reportLevelDisplay = "Zone Level/ዞን ደረጃ";
							else if (reportLevel.equals("woredaLevel"))
								reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
					%> Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ
					ሪፖርት<br /> Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay%> <br />
					Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom + " to " + dateTo)%></th>
					G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
				</th>
			</tr>
			<tr>
				<th>Woreda<br />ወረዳ</th>
				<th>Publishing Information<br />መረጃን አትሞ ለማውጣት</th>
				<th>Document and Archive Organization<br />የሰነድና ማህደር ክፍል ማደራጀት</th>
				<th>Training to Heads and Professionals<br />ለኃላፉዎችና ባለሙያዎች
					ስልጠና መስጠት</th>
				<th>Establishing System to Serve Information Requests<br />የመረጃ
					ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
				<th>Others<br />ሌሎች</th>
				<th>Total<br />በጠቅላላ</th>
			</tr>
			<%
				float woredaPublishingTotal = 0.0f;
					float woredaOrganizingRecordOffice = 0.0f;
					float woredaTrainingProvisions = 0.0f;
					float woredaEstablisingSystem = 0.0f;
					float woredaOthers = 0.0f;
					float woredaTotal = 0.0f;
					Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
						float publishingInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"publishing_information", reportLevel,
										Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
						float organizingRecordOffice = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"organizaing_record_office", reportLevel,
										Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
						float trainingProvisions = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"training_provisions_for_heads_and_professionals",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom,
										dateTo,reportSector);
						float establishingSystem = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"establishing_system_to_serve_information_requesters",
										reportLevel,Integer.parseInt(reportWoreda), dateFrom,
										dateTo,reportSector);
						float others = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report", "others",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom,
										dateTo,reportSector);
						float sumTotal = publishingInformation
								+ organizingRecordOffice + trainingProvisions
								+ establishingSystem + others;
						woredaPublishingTotal += publishingInformation;
						woredaOrganizingRecordOffice += organizingRecordOffice;
						woredaTrainingProvisions += trainingProvisions;
						woredaEstablisingSystem += establishingSystem;
						woredaOthers += others;
						woredaTotal += sumTotal;
			%>
			<tr>
				<td><%=woreda.getWoredaName()%></td>
				<td><%=publishingInformation%></td>
				<td><%=organizingRecordOffice%></td>
				<td><%=trainingProvisions%></td>
				<td><%=establishingSystem%></td>
				<td><%=others%></td>
				<td><%=sumTotal%></td>
			</tr>
			<tr>
				<td>Sum Total<br />አጠቃላይ ድምር</td>
				<td><%=woredaPublishingTotal%></td>
				<td><%=woredaOrganizingRecordOffice%></td>
				<td><%=woredaTrainingProvisions%></td>
				<td><%=woredaEstablisingSystem%></td>
				<td><%=woredaOthers%></td>
				<td><%=woredaTotal%></td>
			</tr>
		</table>
	</div>
	<%
		} else if (reportLevel.equalsIgnoreCase("kebeleLevel")) {
			List<Kebele> kebeleList = Kebele.getAllKebeles();
			Iterator<Kebele> kebeleItr = null;
			if (!kebeleList.isEmpty())
				kebeleItr = kebeleList.iterator();
	%>
	<div id="kebeleLevelReportDiv">
		<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
			<tr>
				<th colspan="7">Training and Organization Summary Report/ሥልጠና
					እና አደረጃጀት ማጠቃለያ ሪፖርት</th>
			</tr>
			<tr>
				<th>Kebele<br />ቀበሌ</th>
				<th>Publishing Information<br />መረጃን አትሞ ለማውጣት</th>
				<th>Document and Archive Organization<br />የሰነድና ማህደር ክፍል ማደራጀት</th>
				<th>Training to Heads and Professionals<br />ለኃላፉዎችና ባለሙያዎች
					ስልጠና መስጠት</th>
				<th>Establishing System to Serve Information Requests<br />የመረጃ
					ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
				<th>Others<br />ሌሎች</th>
				<th>Total<br />በጠቅላላ</th>
			</tr>
			<%
				float kebelePublishingTotal = 0.0f;
					float kebeleOrganizingRecordOffice = 0.0f;
					float kebeleTrainingProvisions = 0.0f;
					float kebeleEstablisingSystem = 0.0f;
					float kebeleOthers = 0.0f;
					float kebeleTotal = 0.0f;
					Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
						float publishingInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"publishing_information", reportLevel,
										Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
						float organizingRecordOffice = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"organizaing_record_office", reportLevel,
										Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
						float trainingProvisions = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"training_provisions_for_heads_and_professionals",
										reportLevel, Integer.parseInt(reportKebele), dateFrom,
										dateTo,reportSector);
						float establishingSystem = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"establishing_system_to_serve_information_requesters",
										reportLevel, Integer.parseInt(reportKebele), dateFrom,
										dateTo,reportSector);
						float others = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report", "others",
										reportLevel, Integer.parseInt(reportKebele), dateFrom,
										dateTo,reportSector);
						float sumTotal = publishingInformation
								+ organizingRecordOffice + trainingProvisions
								+ establishingSystem + others;
						kebelePublishingTotal += publishingInformation;
						kebeleOrganizingRecordOffice += organizingRecordOffice;
						kebeleTrainingProvisions += trainingProvisions;
						kebeleEstablisingSystem += establishingSystem;
						kebeleOthers += others;
						kebeleTotal += sumTotal;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=publishingInformation%></td>
				<td><%=organizingRecordOffice%></td>
				<td><%=trainingProvisions%></td>
				<td><%=establishingSystem%></td>
				<td><%=others%></td>
				<td><%=sumTotal%></td>
			</tr>
			<tr>
				<td>Sum Total<br />አጠቃላይ ድምር</td>
				<td><%=kebelePublishingTotal%></td>
				<td><%=kebeleOrganizingRecordOffice%></td>
				<td><%=kebeleTrainingProvisions%></td>
				<td><%=kebeleEstablisingSystem%></td>
				<td><%=kebeleOthers%></td>
				<td><%=kebeleTotal%></td>
			</tr>
		</table>
	</div>
	<%
		} else if (reportLevel.equalsIgnoreCase("zoneLevel")) {
			List<Zone> zoneList = Zone.getAllZones();
			Iterator<Zone> zoneItr = null;
			if (!zoneList.isEmpty())
				zoneItr = zoneList.iterator();
	%>
	<div id="zoneLevelReportDiv">
		<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
			<tr>
				<th colspan="7">
					<%
						String reportLevelDisplay = null;
							if (reportLevel.equals("regionLevel"))
								reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
							else if (reportLevel.equals("zoneLevel"))
								reportLevelDisplay = "Zone Level/ዞን ደረጃ";
							else if (reportLevel.equals("woredaLevel"))
								reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
					%> Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ
					ሪፖርት<br /> Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay%> <br />
					Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom + " to " + dateTo)%>
					G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
					</th>
			</tr>
			<tr>
				<th>Zone<br />ዞን</th>
				<th>Publishing Information<br />መረጃን አትሞ ለማውጣት</th>
				<th>Document and Archive Organization<br />የሰነድና ማህደር ክፍል ማደራጀት</th>
				<th>Training to Heads and Professionals<br />ለኃላፉዎችና ባለሙያዎች
					ስልጠና መስጠት</th>
				<th>Establishing System to Serve Information Requests<br />የመረጃ
					ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</th>
				<th>Others<br />ሌሎች</th>
				<th>Total<br />በጠቅላላ</th>
			</tr>
			<%
				float zonePublishingTotal = 0.0f;
					float zoneOrganizingRecordOffice = 0.0f;
					float zoneTrainingProvisions = 0.0f;
					float zoneEstablisingSystem = 0.0f;
					float zoneOthers = 0.0f;
					float zoneTotal = 0.0f;
					Zone zone = Zone.getZone(Integer.parseInt(reportZone));
						float publishingInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"publishing_information", reportLevel,
										Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
						float organizingRecordOffice = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"organizaing_record_office", reportLevel,
										Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
						float trainingProvisions = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"training_provisions_for_heads_and_professionals",
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
						float establishingSystem = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report",
										"establishing_system_to_serve_information_requesters",
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
						float others = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring(
										"tbl_basic_info_about_report", "others",
										reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
						float sumTotal = publishingInformation
								+ organizingRecordOffice + trainingProvisions
								+ establishingSystem + others;
						zonePublishingTotal += publishingInformation;
						zoneOrganizingRecordOffice += organizingRecordOffice;
						zoneTrainingProvisions += trainingProvisions;
						zoneEstablisingSystem += establishingSystem;
						zoneOthers += others;
						zoneTotal += sumTotal;
			%>
			<tr>
				<td><%=zone.getZoneName()%></td>
				<td><%=publishingInformation%></td>
				<td><%=organizingRecordOffice%></td>
				<td><%=trainingProvisions%></td>
				<td><%=establishingSystem%></td>
				<td><%=others%></td>
				<td><%=sumTotal%></td>
			</tr>

			<tr>
				<td>Sum Total<br />አጠቃላይ ድምር</td>
				<td><%=zonePublishingTotal%></td>
				<td><%=zoneOrganizingRecordOffice%></td>
				<td><%=zoneTrainingProvisions%></td>
				<td><%=zoneEstablisingSystem%></td>
				<td><%=zoneOthers%></td>
				<td><%=zoneTotal%></td>
			</tr>
		</table>
	</div>
	<%
		}
	%>
</div>
<table border="0" width="100%">
	<tr>
		<td align="right"><a href="#.jsp"
			onclick="printDiv('printReportDiv')">Print Report / ሪፖርቱን አትም <img
				src="images/printer.jpeg" border="0" align="absmiddle" />
		</a></td>
	</tr>
</table>
