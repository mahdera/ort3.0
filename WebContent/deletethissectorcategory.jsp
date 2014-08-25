<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	SectorCategory.delete(id);
%>
<jsp:forward page="showlistofsectorcategoryfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Sector category deleted successfully!</p></div>"/>
</jsp:forward>
