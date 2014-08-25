<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int woredaId = Integer.parseInt(request.getParameter("woredaId"));
	Woreda.delete(woredaId);
%>
<jsp:forward page="showlistofworedasfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Woreda deleted successfully!</p></div>"/>
</jsp:forward>