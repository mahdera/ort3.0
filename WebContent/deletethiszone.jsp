<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int zoneId = Integer.parseInt(request.getParameter("zoneId"));
	Zone.delete(zoneId);
%>
<jsp:forward page="showlistofzonesfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Zone deleted successfully!</p></div>"/>
</jsp:forward>