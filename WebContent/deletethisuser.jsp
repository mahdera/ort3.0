<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("id"));
	User.deleteUser(userId);
%>
<jsp:forward page="showlistofuserfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>User deleted successfully!</p></div>"/>
</jsp:forward>