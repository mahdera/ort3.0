<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	UmbudsmanReportingOffice.delete(id);
%>
<jsp:forward page="showlistofumbudsmanreportingofficefordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Reporting office deleted successfully!</p></div>"/>
</jsp:forward>
