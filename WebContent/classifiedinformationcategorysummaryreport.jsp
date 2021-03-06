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
			<th colspan="12">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Classified Information Category Summary Report/የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region/ሪጅን</th>
			<th>Private Third Party Related Information/ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች</th>
			<th>Commercial Third Party Information/የሶስተኛ ወገን የንግድ መረጃዎች</th>
			<th>Trusted Third Party Information/በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች</th>
			<th>Private and Property Safety Related Information/የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች</th>
			<th>Justice Enforcement and Process Related Information/የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች</th>
			<th>Protected Information During Investigation/በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች</th>
			<th>Defense, Safety and International Relation Information/የመከላከያ፣ ደህነትና ዓለም አቀፍ ግንኙነት መረጃዎች</th>
			<th>Cabin Documents/የካቢኔ ሰነዶች</th>
			<th>Country Related Information/የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች</th>
			<th>Government Work Documents/የመንግሥት የሥራ ሰነዶች</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionThirdPartyRelatedPrivateInformation=0.0f;
		float regionThirdPartyCommercialInformation=0.0f;
		float regionThirdPartyTrustedInformation=0.0f;
		float regionPrivateAndPropertySaftyRelatedInformation=0.0f;
		float regionLawEnforcmentAndJusticeInvestigationInformation=0.0f;
		float regionProtectedInfoDuringCourt=0.0f;
		float regionDefenseSecurityAndInternationalRelationInformation=0.0f;
		float regionCabineDocuments=0.0f;
		float regionCountryRelatedInformation=0.0f;
		float regionGovernmentWorkDocuments=0.0f;
		float regionTotal=0.0f;
		if(reportLevel.equalsIgnoreCase("all")){
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float thirdPartyRelatedPrivateInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
												("tbl_classified_information_category", "third_party_related_private_information",
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float thirdPartyCommercialInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
												("tbl_classified_information_category", "third_party_related_commercial_information",
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float thirdPartyTrustedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "third_party_related_trusted_information",
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float privateAndPropertySaftyRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "private_safty_and_property_related_information", 
													reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float lawEnforcmentAndJusticeInvestigationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "law_enforcment_and_justice_related_information", 
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float protectedInfoDuringCourt = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "classified_information_during_investigation",
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float defenseSecurityAndInternationalRelationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "defense_security_and_international_relation_information",
														reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float cabineDocuments = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
												("tbl_classified_information_category", "cabine_documents",
															reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float coutryRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "country_related_information",
															reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float governmentWorkDocuments = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
												("tbl_classified_information_category", "government_work_documents",
															reportLevel, region.getId(), dateFrom, dateTo,reportSector);
		
			float sumTotal = thirdPartyRelatedPrivateInformation + thirdPartyCommercialInformation +
					thirdPartyTrustedInformation + privateAndPropertySaftyRelatedInformation + privateAndPropertySaftyRelatedInformation +
					lawEnforcmentAndJusticeInvestigationInformation + protectedInfoDuringCourt+
					defenseSecurityAndInternationalRelationInformation + cabineDocuments +
					coutryRelatedInformation + governmentWorkDocuments;
			
			regionThirdPartyRelatedPrivateInformation += thirdPartyRelatedPrivateInformation;
			regionThirdPartyCommercialInformation += thirdPartyCommercialInformation;
			regionThirdPartyTrustedInformation += thirdPartyTrustedInformation;
			regionPrivateAndPropertySaftyRelatedInformation += privateAndPropertySaftyRelatedInformation;
			regionLawEnforcmentAndJusticeInvestigationInformation += lawEnforcmentAndJusticeInvestigationInformation;
			regionProtectedInfoDuringCourt += protectedInfoDuringCourt;
			regionDefenseSecurityAndInternationalRelationInformation += defenseSecurityAndInternationalRelationInformation;
			regionCabineDocuments += cabineDocuments;
			regionCountryRelatedInformation += coutryRelatedInformation;
			regionGovernmentWorkDocuments += governmentWorkDocuments;
			regionTotal += sumTotal;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=thirdPartyRelatedPrivateInformation %></td>
				<td><%=thirdPartyCommercialInformation %></td>
				<td><%=thirdPartyTrustedInformation %></td>
				<td><%=privateAndPropertySaftyRelatedInformation %></td>
				<td><%=lawEnforcmentAndJusticeInvestigationInformation %></td>	
				<td><%=protectedInfoDuringCourt %></td>
				<td><%=defenseSecurityAndInternationalRelationInformation %></td>							
				<td><%=cabineDocuments %></td>
				<td><%=coutryRelatedInformation %></td>
				<td><%=governmentWorkDocuments %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float thirdPartyRelatedPrivateInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "third_party_related_private_information",
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float thirdPartyCommercialInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "third_party_related_commercial_information",
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float thirdPartyTrustedInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_classified_information_category", "third_party_related_trusted_information",
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float privateAndPropertySaftyRelatedInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_classified_information_category", "private_safty_and_property_related_information", 
											reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float lawEnforcmentAndJusticeInvestigationInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_classified_information_category", "law_enforcment_and_justice_related_information", 
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float protectedInfoDuringCourt = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_classified_information_category", "classified_information_during_investigation",
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float defenseSecurityAndInternationalRelationInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_classified_information_category", "defense_security_and_international_relation_information",
												reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float cabineDocuments = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "cabine_documents",
													reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float coutryRelatedInformation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_classified_information_category", "country_related_information",
													reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float governmentWorkDocuments = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "government_work_documents",
													reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			
			float sumTotal = thirdPartyRelatedPrivateInformation + thirdPartyCommercialInformation +
			thirdPartyTrustedInformation + privateAndPropertySaftyRelatedInformation + privateAndPropertySaftyRelatedInformation +
			lawEnforcmentAndJusticeInvestigationInformation + protectedInfoDuringCourt+
			defenseSecurityAndInternationalRelationInformation + cabineDocuments +
			coutryRelatedInformation + governmentWorkDocuments;
			
			regionThirdPartyRelatedPrivateInformation += thirdPartyRelatedPrivateInformation;
			regionThirdPartyCommercialInformation += thirdPartyCommercialInformation;
			regionThirdPartyTrustedInformation += thirdPartyTrustedInformation;
			regionPrivateAndPropertySaftyRelatedInformation += privateAndPropertySaftyRelatedInformation;
			regionLawEnforcmentAndJusticeInvestigationInformation += lawEnforcmentAndJusticeInvestigationInformation;
			regionProtectedInfoDuringCourt += protectedInfoDuringCourt;
			regionDefenseSecurityAndInternationalRelationInformation += defenseSecurityAndInternationalRelationInformation;
			regionCabineDocuments += cabineDocuments;
			regionCountryRelatedInformation += coutryRelatedInformation;
			regionGovernmentWorkDocuments += governmentWorkDocuments;
			regionTotal += sumTotal;
			%>
			<tr>
			<td><%=region.getRegionName() %></td>
			<td><%=thirdPartyRelatedPrivateInformation %></td>
			<td><%=thirdPartyCommercialInformation %></td>
			<td><%=thirdPartyTrustedInformation %></td>
			<td><%=privateAndPropertySaftyRelatedInformation %></td>
			<td><%=lawEnforcmentAndJusticeInvestigationInformation %></td>	
			<td><%=protectedInfoDuringCourt %></td>
			<td><%=defenseSecurityAndInternationalRelationInformation %></td>							
			<td><%=cabineDocuments %></td>
			<td><%=coutryRelatedInformation %></td>
			<td><%=governmentWorkDocuments %></td>				
			<td><%=sumTotal %></td>
			</tr>
	<% 
		}
	%>
	
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=regionThirdPartyRelatedPrivateInformation %></td>
			<td><%=regionThirdPartyCommercialInformation %></td>
			<td><%=regionThirdPartyTrustedInformation %></td>
			<td><%=regionPrivateAndPropertySaftyRelatedInformation %></td>
			<td><%=regionLawEnforcmentAndJusticeInvestigationInformation %></td>	
			<td><%=regionProtectedInfoDuringCourt %></td>
			<td><%=regionDefenseSecurityAndInternationalRelationInformation %></td>							
			<td><%=regionCabineDocuments %></td>
			<td><%=regionCountryRelatedInformation %></td>
			<td><%=regionGovernmentWorkDocuments %></td>				
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
			<th colspan="12">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Classified Information Category Summary Report/የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda/ወረዳ</th>
			<th>Private Third Party Related Information/ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች</th>
			<th>Commercial Third Party Information/የሶስተኛ ወገን የንግድ መረጃዎች</th>
			<th>Trusted Third Party Information/በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች</th>
			<th>Private and Property Safety Related Information/የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች</th>
			<th>Justice Enforcement and Process Related Information/የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች</th>
			<th>Protected Information During Investigation/በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች</th>
			<th>Defense, Safety and International Relation Information/የመከላከያ፣ ደህነትና ዓለም አቀፍ ግንኙነት መረጃዎች</th>
			<th>Cabin Documents/የካቢኔ ሰነዶች</th>
			<th>Country Related Information/የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች</th>
			<th>Government Work Documents/የመንግሥት የሥራ ሰነዶች</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaThirdPartyRelatedPrivateInformation=0.0f;
		float woredaThirdPartyCommercialInformation=0.0f;
		float woredaThirdPartyTrustedInformation=0.0f;
		float woredaPrivateAndPropertySaftyRelatedInformation=0.0f;
		float woredaLawEnforcmentAndJusticeInvestigationInformation=0.0f;
		float woredaProtectedInfoDuringCourt=0.0f;
		float woredaDefenseSecurityAndInternationalRelationInformation=0.0f;
		float woredaCabineDocuments=0.0f;
		float woredaCountryRelatedInformation=0.0f;
		float woredaGovernmentWorkDocuments=0.0f;
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
		
			float thirdPartyRelatedPrivateInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "third_party_related_private_information",
													reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float thirdPartyCommercialInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "third_party_related_commercial_information",
													reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float thirdPartyTrustedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "third_party_related_trusted_information",
														reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float privateAndPropertySaftyRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "private_safty_and_property_related_information",
														reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float lawEnforcmentAndJusticeInvestigationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "law_enforcment_and_justice_related_information",
														reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float protectedInfoDuringCourt = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "classified_information_during_investigation",
															reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float defenseSecurityAndInternationalRelationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "defense_security_and_international_relation_information",
															reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float cabineDocuments = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "cabine_documents",
														reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float coutryRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "country_related_information",
														reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float governmentWorkDocuments = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "government_work_documents", 
													reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
		
			float sumTotal = thirdPartyRelatedPrivateInformation + thirdPartyCommercialInformation +
					thirdPartyTrustedInformation + privateAndPropertySaftyRelatedInformation + privateAndPropertySaftyRelatedInformation +
					lawEnforcmentAndJusticeInvestigationInformation + protectedInfoDuringCourt+
					defenseSecurityAndInternationalRelationInformation + cabineDocuments +
					coutryRelatedInformation + governmentWorkDocuments;
			
			woredaThirdPartyRelatedPrivateInformation += thirdPartyRelatedPrivateInformation;
			woredaThirdPartyCommercialInformation += thirdPartyCommercialInformation;
			woredaThirdPartyTrustedInformation += thirdPartyTrustedInformation;
			woredaPrivateAndPropertySaftyRelatedInformation += privateAndPropertySaftyRelatedInformation;
			woredaLawEnforcmentAndJusticeInvestigationInformation += lawEnforcmentAndJusticeInvestigationInformation;
			woredaProtectedInfoDuringCourt += protectedInfoDuringCourt;
			woredaDefenseSecurityAndInternationalRelationInformation += defenseSecurityAndInternationalRelationInformation;
			woredaCabineDocuments += cabineDocuments;
			woredaCountryRelatedInformation += coutryRelatedInformation;
			woredaGovernmentWorkDocuments += governmentWorkDocuments;
			woredaTotal += sumTotal;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=thirdPartyRelatedPrivateInformation %></td>
				<td><%=thirdPartyCommercialInformation %></td>
				<td><%=thirdPartyTrustedInformation %></td>
				<td><%=privateAndPropertySaftyRelatedInformation %></td>
				<td><%=lawEnforcmentAndJusticeInvestigationInformation %></td>	
				<td><%=protectedInfoDuringCourt %></td>
				<td><%=defenseSecurityAndInternationalRelationInformation %></td>							
				<td><%=cabineDocuments %></td>
				<td><%=coutryRelatedInformation %></td>
				<td><%=governmentWorkDocuments %></td>				
				<td><%=sumTotal %></td>
			</tr>
			
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=woredaThirdPartyRelatedPrivateInformation %></td>
			<td><%=woredaThirdPartyCommercialInformation %></td>
			<td><%=woredaThirdPartyTrustedInformation %></td>
			<td><%=woredaPrivateAndPropertySaftyRelatedInformation %></td>
			<td><%=woredaLawEnforcmentAndJusticeInvestigationInformation %></td>	
			<td><%=woredaProtectedInfoDuringCourt %></td>
			<td><%=woredaDefenseSecurityAndInternationalRelationInformation %></td>							
			<td><%=woredaCabineDocuments %></td>
			<td><%=woredaCountryRelatedInformation %></td>
			<td><%=woredaGovernmentWorkDocuments %></td>				
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
			<th colspan="12">የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
			<th>ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች</th>
			<th>የሶስተኛ ወገን የንግድ መረጃዎች</th>
			<th>በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች</th>
			<th>የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች</th>
			<th>የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች</th>
			<th>በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች</th>
			<th>የመከላከያ፣ ደህነትና ዓለም አቀፍ ግንኙነት መረጃዎች</th>
			<th>የካቢኔ ሰነዶች</th>
			<th>የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች</th>
			<th>የመንግሥት የሥራ ሰነዶች</th>			
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleThirdPartyRelatedPrivateInformation=0.0f;
		float kebeleThirdPartyCommercialInformation=0.0f;
		float kebeleThirdPartyTrustedInformation=0.0f;
		float kebelePrivateAndPropertySaftyRelatedInformation=0.0f;
		float kebeleLawEnforcmentAndJusticeInvestigationInformation=0.0f;
		float kebeleProtectedInfoDuringCourt=0.0f;
		float kebeleDefenseSecurityAndInternationalRelationInformation=0.0f;
		float kebeleCabineDocuments=0.0f;
		float kebeleCountryRelatedInformation=0.0f;
		float kebeleGovernmentWorkDocuments=0.0f;
		float kebeleTotal=0.0f;
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
		
			float thirdPartyRelatedPrivateInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "third_party_related_private_information",
												reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float thirdPartyCommercialInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "third_party_related_commercial_information",
												reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float thirdPartyTrustedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "third_party_related_trusted_information", 
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float privateAndPropertySaftyRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "private_safty_and_property_related_information",
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float lawEnforcmentAndJusticeInvestigationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "law_enforcment_and_justice_related_information",
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float protectedInfoDuringCourt = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "classified_information_during_investigation",
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float defenseSecurityAndInternationalRelationInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
												("tbl_classified_information_category", "defense_security_and_international_relation_information",
																reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float cabineDocuments = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_classified_information_category", "cabine_documents",
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float coutryRelatedInformation = ReportGenerator
								.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
											("tbl_classified_information_category", "country_related_information", 
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float governmentWorkDocuments = ReportGenerator
									.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
													("tbl_classified_information_category", "government_work_documents",
																reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
		
			float sumTotal = thirdPartyRelatedPrivateInformation + thirdPartyCommercialInformation +
					thirdPartyTrustedInformation + privateAndPropertySaftyRelatedInformation + privateAndPropertySaftyRelatedInformation +
					lawEnforcmentAndJusticeInvestigationInformation + protectedInfoDuringCourt+
					defenseSecurityAndInternationalRelationInformation + cabineDocuments +
					coutryRelatedInformation + governmentWorkDocuments;
			
			kebeleThirdPartyRelatedPrivateInformation += thirdPartyRelatedPrivateInformation;
			kebeleThirdPartyCommercialInformation += thirdPartyCommercialInformation;
			kebeleThirdPartyTrustedInformation += thirdPartyTrustedInformation;
			kebelePrivateAndPropertySaftyRelatedInformation += privateAndPropertySaftyRelatedInformation;
			kebeleLawEnforcmentAndJusticeInvestigationInformation += lawEnforcmentAndJusticeInvestigationInformation;
			kebeleProtectedInfoDuringCourt += protectedInfoDuringCourt;
			kebeleDefenseSecurityAndInternationalRelationInformation += defenseSecurityAndInternationalRelationInformation;
			kebeleCabineDocuments += cabineDocuments;
			kebeleCountryRelatedInformation += coutryRelatedInformation;
			kebeleGovernmentWorkDocuments += governmentWorkDocuments;
			kebeleTotal += sumTotal;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=thirdPartyRelatedPrivateInformation %></td>
				<td><%=thirdPartyCommercialInformation %></td>
				<td><%=thirdPartyTrustedInformation %></td>
				<td><%=privateAndPropertySaftyRelatedInformation %></td>
				<td><%=lawEnforcmentAndJusticeInvestigationInformation %></td>	
				<td><%=protectedInfoDuringCourt %></td>
				<td><%=defenseSecurityAndInternationalRelationInformation %></td>							
				<td><%=cabineDocuments %></td>
				<td><%=coutryRelatedInformation %></td>
				<td><%=governmentWorkDocuments %></td>				
				<td><%=sumTotal %></td>
			</tr>
			
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=kebeleThirdPartyRelatedPrivateInformation %></td>
			<td><%=kebeleThirdPartyCommercialInformation %></td>
			<td><%=kebeleThirdPartyTrustedInformation %></td>
			<td><%=kebelePrivateAndPropertySaftyRelatedInformation %></td>
			<td><%=kebeleLawEnforcmentAndJusticeInvestigationInformation %></td>	
			<td><%=kebeleProtectedInfoDuringCourt %></td>
			<td><%=kebeleDefenseSecurityAndInternationalRelationInformation %></td>							
			<td><%=kebeleCabineDocuments %></td>
			<td><%=kebeleCountryRelatedInformation %></td>
			<td><%=kebeleGovernmentWorkDocuments %></td>				
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
					<th colspan="12">
						<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Classified Information Category Summary Report/የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
					</th>
				</tr>
				<tr>
					<th>Zone/ዞን</th>
					<th>Private Third Party Related Information/ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች</th>
					<th>Commercial Third Party Information/የሶስተኛ ወገን የንግድ መረጃዎች</th>
					<th>Trusted Third Party Information/በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች</th>
					<th>Private and Property Safety Related Information/የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች</th>
					<th>Justice Enforcement and Process Related Information/የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች</th>
					<th>Protected Information During Investigation/በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች</th>
					<th>Defense, Safety and International Relation Information/የመከላከያ፣ ደህነትና ዓለም አቀፍ ግንኙነት መረጃዎች</th>
					<th>Cabin Documents/የካቢኔ ሰነዶች</th>
					<th>Country Related Information/የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች</th>
					<th>Government Work Documents/የመንግሥት የሥራ ሰነዶች</th>			
					<th>Total/በጠቅላላ</th>
				</tr>
			<%
				float zoneThirdPartyRelatedPrivateInformation=0.0f;
				float zoneThirdPartyCommercialInformation=0.0f;
				float zoneThirdPartyTrustedInformation=0.0f;
				float zonePrivateAndPropertySaftyRelatedInformation=0.0f;
				float zoneLawEnforcmentAndJusticeInvestigationInformation=0.0f;
				float zoneProtectedInfoDuringCourt=0.0f;
				float zoneDefenseSecurityAndInternationalRelationInformation=0.0f;
				float zoneCabineDocuments=0.0f;
				float zoneCountryRelatedInformation=0.0f;
				float zoneGovernmentWorkDocuments=0.0f;
				float zoneTotal=0.0f;
				
				Zone zone = Zone.getZone(Integer.parseInt(reportZone));
				
					float thirdPartyRelatedPrivateInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "third_party_related_private_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float thirdPartyCommercialInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "third_party_related_commercial_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float thirdPartyTrustedInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "third_party_related_trusted_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float privateAndPropertySaftyRelatedInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "private_safty_and_property_related_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float lawEnforcmentAndJusticeInvestigationInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "law_enforcment_and_justice_related_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float protectedInfoDuringCourt = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "classified_information_during_investigation", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float defenseSecurityAndInternationalRelationInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "defense_security_and_international_relation_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float cabineDocuments = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "cabine_documents", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float coutryRelatedInformation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "country_related_information", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float governmentWorkDocuments = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_classified_information_category", "government_work_documents", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
				
					float sumTotal = thirdPartyRelatedPrivateInformation + thirdPartyCommercialInformation +
							thirdPartyTrustedInformation + privateAndPropertySaftyRelatedInformation + privateAndPropertySaftyRelatedInformation +
							lawEnforcmentAndJusticeInvestigationInformation + protectedInfoDuringCourt+
							defenseSecurityAndInternationalRelationInformation + cabineDocuments +
							coutryRelatedInformation + governmentWorkDocuments;
					
					zoneThirdPartyRelatedPrivateInformation += thirdPartyRelatedPrivateInformation;
					zoneThirdPartyCommercialInformation += thirdPartyCommercialInformation;
					zoneThirdPartyTrustedInformation += thirdPartyTrustedInformation;
					zonePrivateAndPropertySaftyRelatedInformation += privateAndPropertySaftyRelatedInformation;
					zoneLawEnforcmentAndJusticeInvestigationInformation += lawEnforcmentAndJusticeInvestigationInformation;
					zoneProtectedInfoDuringCourt += protectedInfoDuringCourt;
					zoneDefenseSecurityAndInternationalRelationInformation += defenseSecurityAndInternationalRelationInformation;
					zoneCabineDocuments += cabineDocuments;
					zoneCountryRelatedInformation += coutryRelatedInformation;
					zoneGovernmentWorkDocuments += governmentWorkDocuments;
					zoneTotal += sumTotal;
					%>
					<tr>
						<td><%=zone.getZoneName() %></td>
						<td><%=thirdPartyRelatedPrivateInformation %></td>
						<td><%=thirdPartyCommercialInformation %></td>
						<td><%=thirdPartyTrustedInformation %></td>
						<td><%=privateAndPropertySaftyRelatedInformation %></td>
						<td><%=lawEnforcmentAndJusticeInvestigationInformation %></td>	
						<td><%=protectedInfoDuringCourt %></td>
						<td><%=defenseSecurityAndInternationalRelationInformation %></td>							
						<td><%=cabineDocuments %></td>
						<td><%=coutryRelatedInformation %></td>
						<td><%=governmentWorkDocuments %></td>				
						<td><%=sumTotal %></td>
					</tr>
					
				<tr>
					<td>አጠቃላይ ድምር</td>
					<td><%=zoneThirdPartyRelatedPrivateInformation %></td>
					<td><%=zoneThirdPartyCommercialInformation %></td>
					<td><%=zoneThirdPartyTrustedInformation %></td>
					<td><%=zonePrivateAndPropertySaftyRelatedInformation %></td>
					<td><%=zoneLawEnforcmentAndJusticeInvestigationInformation %></td>	
					<td><%=zoneProtectedInfoDuringCourt %></td>
					<td><%=zoneDefenseSecurityAndInternationalRelationInformation %></td>							
					<td><%=zoneCabineDocuments %></td>
					<td><%=zoneCountryRelatedInformation %></td>
					<td><%=zoneGovernmentWorkDocuments %></td>				
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