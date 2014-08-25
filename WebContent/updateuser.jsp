<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%	
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
response.addHeader("Pragma", "no-cache"); 
response.addDateHeader ("Expires", 0);

		
if(session.getAttribute("account") == null){
	response.sendRedirect("index.jsp");
	return;
}

	String firstName = new String(request.getParameter("txtname").getBytes("ISO-8859-1"), "UTF-8");
	int userId = Integer.parseInt(request.getParameter("hiddenid"));
	String fatherName = new String(request.getParameter("txtfathername").getBytes("ISO-8859-1"), "UTF-8");	
	String userType = new String(request.getParameter("slctsystemusertype").getBytes("ISO-8859-1"), "UTF-8");;
	//int selectionId = Integer.parseInt(request.getParameter("slctadminselection"));
	
	
	
	User.updateUser(userId, firstName, fatherName, userType);
%>
<jsp:forward page="showlistofuserforedit.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>User updated successfully!</p></div>"/>
</jsp:forward>