<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	PublicRelationOfficer.delete(id);
%>
<jsp:forward page="showlistofpublicrelationofficerfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Public relation officer deleted successfully!</p></div>"/>
</jsp:forward>