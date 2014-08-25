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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region/ሪጅን</th>
			<th>Brochure/ብሮሸር</th>
			<th>Magazine/መፅሔት</th>		
			<th>Pamphlet/ፓምፍሌት</th>
			<th>News Paper/ጋዜጣ</th>
			<th>Others/ሌሎች ካሉ</th>				
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionBrochure=0.0f;
		float regionMagazine=0.0f;
		float regionPamphlet=0.0f;
		float regionNewsPaper=0.0f;
		float regionOthers=0.0f;
		float regionTotal=0.0f;
		if (reportLevel.equalsIgnoreCase("all")) {
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "brochure_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "magazine_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "pamphlet_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "news_paper_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "others_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=brochure %></td>											
				<td><%=magazine %></td>
				<td><%=pamphlet %></td>
				<td><%=newsPaper %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionBrochure += brochure;
			regionMagazine += magazine;
			regionPamphlet += pamphlet;
			regionNewsPaper += newsPaper;
			regionOthers += others;
			regionTotal += sumTotal;
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "brochure_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "magazine_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "pamphlet_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "news_paper_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "others_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=brochure %></td>											
				<td><%=magazine %></td>
				<td><%=pamphlet %></td>
				<td><%=newsPaper %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionBrochure += brochure;
			regionMagazine += magazine;
			regionPamphlet += pamphlet;
			regionNewsPaper += newsPaper;
			regionOthers += others;
			regionTotal += sumTotal;
		}
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionBrochure %></td>
	  		<td><%=regionMagazine %></td>
	  		<td><%=regionPamphlet %></td>
	  		<td><%=regionNewsPaper %></td>
	  		<td><%=regionOthers %></td>	  		
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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda/ወረዳ</th>
			<th>Brochure/ብሮሸር</th>
			<th>Magazine/መፅሔት</th>		
			<th>Pamphlet/ፓምፍሌት</th>
			<th>News Paper/ጋዜጣ</th>
			<th>Others/ሌሎች ካሉ</th>				
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaBrochure=0.0f;
		float woredaMagazine=0.0f;
		float woredaPamphlet=0.0f;
		float woredaNewsPaper=0.0f;
		float woredaOthers=0.0f;
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "brochure_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "magazine_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "pamphlet_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "news_paper_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "others_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=brochure %></td>											
				<td><%=magazine %></td>
				<td><%=pamphlet %></td>
				<td><%=newsPaper %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			woredaBrochure += brochure;
			woredaMagazine += magazine;
			woredaPamphlet += pamphlet;
			woredaNewsPaper += newsPaper;
			woredaOthers += others;
			woredaTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaBrochure %></td>
	  		<td><%=woredaMagazine %></td>
	  		<td><%=woredaPamphlet %></td>
	  		<td><%=woredaNewsPaper %></td>
	  		<td><%=woredaOthers %></td>	  		
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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
			<th>ብሮሸር</th>
			<th>መፅሔት</th>		
			<th>ፓምፍሌት</th>
			<th>ጋዜጣ</th>
			<th>ሌሎች ካሉ</th>				
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleBrochure=0.0f;
		float kebeleMagazine=0.0f;
		float kebelePamphlet=0.0f;
		float kebeleNewsPaper=0.0f;
		float kebeleOthers=0.0f;
		float kebeleTotal=0.0f;
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "brochure_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "magazine_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "pamphlet_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "news_paper_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "others_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=brochure %></td>											
				<td><%=magazine %></td>
				<td><%=pamphlet %></td>
				<td><%=newsPaper %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleBrochure += brochure;
			kebeleMagazine += magazine;
			kebelePamphlet += pamphlet;
			kebeleNewsPaper += newsPaper;
			kebeleOthers += others;
			kebeleTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleBrochure %></td>
	  		<td><%=kebeleMagazine %></td>
	  		<td><%=kebelePamphlet %></td>
	  		<td><%=kebeleNewsPaper %></td>
	  		<td><%=kebeleOthers %></td>	  		
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
						Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
						Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
						Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
					</th>
				</tr>
				<tr>
					<th>Zone/ዞን</th>
					<th>Brochure/ብሮሸር</th>
					<th>Magazine/መፅሔት</th>		
					<th>Pamphlet/ፓምፍሌት</th>
					<th>News Paper/ጋዜጣ</th>
					<th>Others/ሌሎች ካሉ</th>				
					<th>Total/በጠቅላላ</th>
				</tr>
			<%
				float zoneBrochure=0.0f;
				float zoneMagazine=0.0f;
				float zonePamphlet=0.0f;
				float zoneNewsPaper=0.0f;
				float zoneOthers=0.0f;
				float zoneTotal=0.0f;
				
				Zone zone = Zone.getZone(Integer.parseInt(reportZone));
					float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "brochure_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "magazine_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "pamphlet_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "news_paper_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_paper_publication", "others_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
					%>
					<tr>
						<td><%=zone.getZoneName() %></td>
						<td><%=brochure %></td>											
						<td><%=magazine %></td>
						<td><%=pamphlet %></td>
						<td><%=newsPaper %></td>
						<td><%=others %></td>				
						<td><%=sumTotal %></td>
					</tr>
					<%
					zoneBrochure += brochure;
					zoneMagazine += magazine;
					zonePamphlet += pamphlet;
					zoneNewsPaper += newsPaper;
					zoneOthers += others;
					zoneTotal += sumTotal;
				
			  %>		
			  	<tr>
			  		<td>አጠቃላይ ድምር</td>
			  		<td><%=zoneBrochure %></td>
			  		<td><%=zoneMagazine %></td>
			  		<td><%=zonePamphlet %></td>
			  		<td><%=zoneNewsPaper %></td>
			  		<td><%=zoneOthers %></td>	  		
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
