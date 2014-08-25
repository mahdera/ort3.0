<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("sectorOrganizationId"));
	GovernmentSectorOrganization.deleteGovernmentSectorOrganization(id);
%>
<jsp:forward page="showlistofgovernmentsectororganizationfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Government sector organization deleted successfully!</p></div>"/>
</jsp:forward>
