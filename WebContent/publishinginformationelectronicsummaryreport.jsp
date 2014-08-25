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
			<th colspan="8">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Publishing Information Summary Report (Electronics)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
				<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region/ሪጅን</th>
			<th>CD/ሲዲ</th>
			<th>DVD/ዲቪዲ</th>		
			<th>Floppy/ፍሎፒ</th>
			<th>WWW/ድረ-ገጽ</th>
			<th>Social Media/የማህበረሰብ ሚዲያ</th>
			<th>Others/ሌሎች ካሉ</th>				
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionCD=0.0f;
		float regionDVD=0.0f;
		float regionFloppy=0.0f;
		float regionWWW=0.0f;
		float regionSocialWeb=0.0f;
		float regionOthers=0.0f;
		float regionTotal=0.0f;
		if (reportLevel.equalsIgnoreCase("all")) {
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float cd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "cd_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float dvd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "dvd_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float floppy = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "floppy_disk_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float www = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "web_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float socialWeb = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "social_media_amount", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "others", reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float sumTotal = cd + dvd + floppy + www + socialWeb + others;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=cd %></td>											
				<td><%=dvd %></td>
				<td><%=floppy %></td>
				<td><%=www %></td>
				<td><%=socialWeb %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionCD += cd;
			regionDVD += dvd;
			regionFloppy += floppy;
			regionWWW += www;
			regionSocialWeb += socialWeb;
			regionOthers += others;
			regionTotal += sumTotal;
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float cd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "cd_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float dvd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "dvd_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float floppy = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "floppy_disk_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float www = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "web_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float socialWeb = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "social_media_amount", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "others", reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
			float sumTotal = cd + dvd + floppy + www + socialWeb + others;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=cd %></td>											
				<td><%=dvd %></td>
				<td><%=floppy %></td>
				<td><%=www %></td>
				<td><%=socialWeb %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionCD += cd;
			regionDVD += dvd;
			regionFloppy += floppy;
			regionWWW += www;
			regionSocialWeb += socialWeb;
			regionOthers += others;
			regionTotal += sumTotal;
		}
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionCD %></td>
	  		<td><%=regionDVD %></td>
	  		<td><%=regionFloppy %></td>
	  		<td><%=regionWWW %></td>
	  		<td><%=regionSocialWeb %></td>
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
			<th colspan="8">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Publishing Information Summary Report (Electronics)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ)<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda/ወረዳ</th>
			<th>CD/ሲዲ</th>
			<th>DVD/ዲቪዲ</th>		
			<th>Floppy/ፍሎፒ</th>
			<th>WWW/ድረ-ገጽ</th>
			<th>Social Media/የማህበረሰብ ሚዲያ</th>
			<th>Others/ሌሎች ካሉ</th>				
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaCD=0.0f;
		float woredaDVD=0.0f;
		float woredaFloppy=0.0f;
		float woredaWWW=0.0f;
		float woredaSocialWeb=0.0f;
		float woredaOthers=0.0f;
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
			float cd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "cd_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float dvd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "dvd_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float floppy = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "floppy_disk_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float www = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "web_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float socialWeb = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "social_media_amount", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "others", reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float sumTotal = cd + dvd + floppy + www + socialWeb + others;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=cd %></td>											
				<td><%=dvd %></td>
				<td><%=floppy %></td>
				<td><%=www %></td>
				<td><%=socialWeb %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			woredaCD += cd;
			woredaDVD += dvd;
			woredaFloppy += floppy;
			woredaWWW += www;
			woredaSocialWeb += socialWeb;
			woredaOthers += others;
			woredaTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaCD %></td>
	  		<td><%=woredaDVD %></td>
	  		<td><%=woredaFloppy %></td>
	  		<td><%=woredaWWW %></td>
	  		<td><%=woredaSocialWeb %></td>
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
			<th colspan="8">አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ)</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
			<th>ሲዲ</th>
			<th>ዲቪዲ</th>		
			<th>ፍሎፒ</th>
			<th>ድረ-ገጽ</th>
			<th>የማህበረሰብ ሚዲያ</th>
			<th>ሌሎች ካሉ</th>				
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleCD=0.0f;
		float kebeleDVD=0.0f;
		float kebeleFloppy=0.0f;
		float kebeleWWW=0.0f;
		float kebeleSocialWeb=0.0f;
		float kebeleOthers=0.0f;
		float kebeleTotal=0.0f;
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float cd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "cd_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float dvd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "dvd_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float floppy = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "floppy_disk_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float www = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "web_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float socialWeb = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "social_media_amount", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "others", reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float sumTotal = cd + dvd + floppy + www + socialWeb + others;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=cd %></td>											
				<td><%=dvd %></td>
				<td><%=floppy %></td>
				<td><%=www %></td>
				<td><%=socialWeb %></td>
				<td><%=others %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleCD += cd;
			kebeleDVD += dvd;
			kebeleFloppy += floppy;
			kebeleWWW += www;
			kebeleSocialWeb += socialWeb;
			kebeleOthers += others;
			kebeleTotal += sumTotal;
		
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleCD %></td>
	  		<td><%=kebeleDVD %></td>
	  		<td><%=kebeleFloppy %></td>
	  		<td><%=kebeleWWW %></td>
	  		<td><%=kebeleSocialWeb %></td>
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
					<th colspan="8">
						<%
							String reportLevelDisplay = null;
							if(reportLevel.equals("regionLevel"))
								reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
							else if(reportLevel.equals("zoneLevel"))
								reportLevelDisplay = "Zone Level/ዞን ደረጃ";
							else if(reportLevel.equals("woredaLevel"))
								reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
						%>
						Publishing Information Summary Report (Electronics)/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ)<br/>
						Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
						Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
					</th>
				</tr>
				<tr>
					<th>Zone/ዞን</th>
					<th>CD/ሲዲ</th>
					<th>DVD/ዲቪዲ</th>		
					<th>Floppy/ፍሎፒ</th>
					<th>WWW/ድረ-ገጽ</th>
					<th>Social Media/የማህበረሰብ ሚዲያ</th>
					<th>Others/ሌሎች ካሉ</th>				
					<th>Total/በጠቅላላ</th>
				</tr>
			<%
				float zoneCD=0.0f;
				float zoneDVD=0.0f;
				float zoneFloppy=0.0f;
				float zoneWWW=0.0f;
				float zoneSocialWeb=0.0f;
				float zoneOthers=0.0f;
				float zoneTotal=0.0f;
				
				Zone zone = Zone.getZone(Integer.parseInt(reportZone));
					float cd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "cd_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float dvd = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "dvd_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float floppy = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "floppy_disk_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float www = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "web_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float socialWeb = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "social_media_amount", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float others = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring("tbl_electronic_publication", "others", reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
					float sumTotal = cd + dvd + floppy + www + socialWeb + others;
					%>
					<tr>
						<td><%=zone.getZoneName() %></td>
						<td><%=cd %></td>											
						<td><%=dvd %></td>
						<td><%=floppy %></td>
						<td><%=www %></td>
						<td><%=socialWeb %></td>
						<td><%=others %></td>				
						<td><%=sumTotal %></td>
					</tr>
					<%
					zoneCD += cd;
					zoneDVD += dvd;
					zoneFloppy += floppy;
					zoneWWW += www;
					zoneSocialWeb += socialWeb;
					zoneOthers += others;
					zoneTotal += sumTotal;
				
			  %>		
			  	<tr>
			  		<td>አጠቃላይ ድምር</td>
			  		<td><%=zoneCD %></td>
			  		<td><%=zoneDVD %></td>
			  		<td><%=zoneFloppy %></td>
			  		<td><%=zoneWWW %></td>
			  		<td><%=zoneSocialWeb %></td>
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