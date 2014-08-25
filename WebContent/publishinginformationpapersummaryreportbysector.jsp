<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "brochure_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "magazine_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "pamphlet_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "news_paper_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "others_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "brochure_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "magazine_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "pamphlet_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "news_paper_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "others_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
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
		}//end while loop
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("kebele_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)</th>
		</tr>
		<tr>
			<th>ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "brochure_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "magazine_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "pamphlet_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "news_paper_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "others_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
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
		}//end while loop
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
		<div id="zoneLevelReportDiv">
			<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
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
				Publishing Information Summary Report (Paper)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float brochure = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "brochure_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float magazine = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "magazine_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float pamphlet = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "pamphlet_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float newsPaper = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "news_paper_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_paper_publication", "others_amount", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = brochure + magazine + pamphlet + newsPaper + others;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
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
		}//end while loop
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