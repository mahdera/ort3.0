<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	int organizationId = Integer.parseInt(request.getParameter("orgId"));	
	//now Mahder, get the report filled for this organization and start listing them.
	List<ReportFormFilledBy> reportFormFilledByList = ReportFormFilledBy.getAllReportFormsFilledByForThisGovernmentOrganization(organizationId);
	if(!reportFormFilledByList.isEmpty()){
		Iterator<ReportFormFilledBy> reportFormFilledByItr = reportFormFilledByList.iterator();
		%>
		<table border="1" width="100%">
			<tr>
				<th align="left">Ser.No / ተራ.ቁ</th>
				<th align="left">Filled By / ሪፖርቱን የሞላው ባለሙያ</th>
				<th align="left">Filled On / ሪፖርቱ የተሞላበት ቀን</th>
				<th align="left">Modified By / ይዘቱን የለወጠው ሠው</th>
				<th align="left">Modification Date / የተለወጠበት ቀን</th>
				<th align="left">View Details/ዝርዝር ተመልከት</th>				
				<th align="left">Edit / አስተካክል</th>
				<th align="left">Delete / አስወግድ</th>				
			</tr>
			<%
			int ctr=1;
			while(reportFormFilledByItr.hasNext()){
				ReportFormFilledBy reportFormFilledBy = reportFormFilledByItr.next();
				User reportFilledByUser = User.getUser(reportFormFilledBy.getModifiedBy());
				String fullName = reportFilledByUser.getFirstName()+" "+reportFilledByUser.getLastName();
				if(ctr % 2==0){
				%>
				<tr style="background:#eee">
				<%
				}else{
					%>
				<tr style="background:#fff">
					<% 
				}
				%>
					<td><%=ctr++ %></td>
					<td><%=PublicRelationOfficer.getpPublicRelationOfficer(reportFormFilledBy.getPrId()).getFullName() %></td>
					<td><%=(reportFormFilledBy.getReportDate() != null ? reportFormFilledBy.getReportDate() : "---") %></td>
					<td><%=fullName %></td>
					<td><%=reportFormFilledBy.getModificationDate() %></td>
					<td>
						<a href="#.jsp" onclick="showReportDetailsForThisReportFormInputId(<%=reportFormFilledBy.getReportInputFormId() %>);">ዘርዝር</a>
					</td>
					<td>
						<a href="showeditfieldsofthisreportinputform.jsp?reportInputFormId=<%=reportFormFilledBy.getReportInputFormId() %>">አስተካክል</a>
					</td>
					<td>
						<a href="#.jsp" onclick="return deleteThisReportFormInputId(<%=reportFormFilledBy.getReportInputFormId() %>);">አስወግድ</a>
					</td>
				</tr>
				<%
					String divId = "reportDetailDiv"+reportFormFilledBy.getReportInputFormId();
				%>
				<tr>
					<td colspan="8">
						<div id="<%=divId %>"></div>
					</td>
				</tr>
				<%
				System.out.println(divId);
			}//end while loop
			%>
		</table>
		<%
	}//end empty list checker condition
%>