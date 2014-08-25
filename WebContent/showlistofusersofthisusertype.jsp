<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String userType = request.getParameter("userType");
	List<User> userList = User.getAllUsersWithUserType(userType);
	Iterator<User> userItr = userList.iterator();
	
%>
<div style="max-height: 300px;overflow: scroll;">
<table border="0" width="100%">
	<tr style="background:#eee;font-weight:bolder;font-size:12pt">
		<td>Ser.No / ተራ.ቁ</td>
		<td>Employee Name / የሠራተኛው ሥም</td>
		<td>Working Place / የሚሠራበት ቦታ</td>	
		<td>Modified By / ይዘቱን የለወጠው ሠው</td>
		<td>Modification Date / የተለወጠበት ቀን</td>	
	</tr>
	<%
	int ctr=1;
	while(userItr.hasNext()){
		User user = userItr.next();
		String userFullName = user.getFirstName()+" "+user.getLastName();
		User modifiedByUser = User.getUser(user.getModifiedBy());
		String fullName = modifiedByUser.getFirstName()+" "+modifiedByUser.getLastName();
		String workPlaceName = null;
		if(user.getPrId() != 0){
			PublicRelationOfficer pubOfficer = PublicRelationOfficer.getpPublicRelationOfficer(user.getPrId());
			GovernmentSectorOrganization govOrg = GovernmentSectorOrganization.getGovernmentSectorOrganization(pubOfficer.getGovernmentSectorOrganizationId());
			workPlaceName = govOrg.getOrganizationName();
		}else if(user.getOmbudsmanReportingOfficeId() != 0){
			UmbudsmanReportingOffice rptOffice = UmbudsmanReportingOffice.getUmbudsmanReportingOffice(user.getOmbudsmanReportingOfficeId());
			workPlaceName = rptOffice.getReportingOfficeName();
		}
		
		if(ctr%2==0){
		%>
		<tr style="background:#fff">
		<%
		}else{
		%>
		<tr>
		<%	
		}
		%>
			<td><%=ctr++ %></td>
			<td><%=userFullName %></td>
			<td><%=workPlaceName %></td>		
			<td><%=fullName %></td>
			<td><%=user.getModificationDate() %></td>	
		</tr>
		<%
	}//end while loop
	%>	
</table>
</div>