<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int kebeleId = Integer.parseInt(request.getParameter("kebeleId"));
	Kebele.delete(kebeleId);
%>
<jsp:forward page="showlistofkebelesfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Kebele deleted successfully!</p></div>"/>
</jsp:forward>
