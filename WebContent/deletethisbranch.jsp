<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int branchId = Integer.parseInt(request.getParameter("branchId"));
	Branch.delete(branchId);
%>
<jsp:forward page="showlistofbranchfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Branch deleted successfully!</p></div>"/>
</jsp:forward>