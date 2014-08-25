<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String userType = request.getParameter("userType");
	List<PublicRelationOfficer> publicRelationOfficerList = null;
	List<UmbudsmanReportingOffice> umbudsmanReportingOfficeList = null;

	if(userType.equalsIgnoreCase("Public Relation Officer")){
		publicRelationOfficerList = PublicRelationOfficer.getAllPublicRelationOfficers();
		Iterator<PublicRelationOfficer> publicRelationOfficerItr = publicRelationOfficerList.iterator();
		%>
		<table border="0" width="100%">
			<tr>
				<td align="right" width="30%"><label>የሕዝብ ግንኙነት ሃላፊ ይምረጡ፡</label> </td>
				<td>
					<select name="slctadminselection" id="slctadminselection" style="width:40%">
						<option value="" selected="selected">--ምረጥ--</option>
						<%
							while(publicRelationOfficerItr.hasNext()){
								PublicRelationOfficer publicRelationOfficer = publicRelationOfficerItr.next();
								GovernmentSectorOrganization govtOrg = GovernmentSectorOrganization.getGovernmentSectorOrganization(publicRelationOfficer.getGovernmentSectorOrganizationId());
								
								%>
								<option value="<%=publicRelationOfficer.getId() %>"><%=publicRelationOfficer.getFullName() %> | የሥራ ቦታ፡ <%=govtOrg.getOrganizationName() %></option>
								<%
							}//end while loop
						%>
					</select>
				</td>
			</tr>
		</table>
		<%
	}else if(userType.equalsIgnoreCase("Umbudsman Reporting Officer")){
		umbudsmanReportingOfficeList = UmbudsmanReportingOffice.getAllllUmbudsmanReportingOffices();
		Iterator<UmbudsmanReportingOffice> umbudsmanReportingOfficeItr = umbudsmanReportingOfficeList.iterator();
		%>
		<table border="0" width="100%">
			<tr>
				<td align="right" width="30%"><label>የእንባ ጠባቂ መሥሪያ ቤት ይምረጡ፡ </label></td>
				<td>
					<select name="slctadminselection" id="slctadminselection" style="width:40%">
						<option value="" selected="selected">--ምረጥ--</option>
						<%
							while(umbudsmanReportingOfficeItr.hasNext()){
								UmbudsmanReportingOffice umbudsmanReportingOffice = umbudsmanReportingOfficeItr.next();
								%>
								<option value="<%=umbudsmanReportingOffice.getId() %>"><%=umbudsmanReportingOffice.getReportingOfficeName() %></option>
								<%
							}//end while loop
						%>
					</select>
				</td>
			</tr>
		</table>
		<%
	}else if(userType.equalsIgnoreCase("System Administrator")){
		%>
		<input type="hidden" name="slctadminselection" id="slctadminselection" value="0"/>
		<%
	}
%>