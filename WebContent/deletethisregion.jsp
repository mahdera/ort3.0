<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Region.delete(id);
%>
<jsp:forward page="showlistofregionfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Region deleted successfully!</p></div>"/>
</jsp:forward>
