<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
response.addHeader("Pragma", "no-cache"); 
response.addDateHeader ("Expires", 0);

		
if(session.getAttribute("account") == null){
	response.sendRedirect("index.jsp");
	return;
}

	Account acct = (Account) session.getAttribute("account");
	int modifiedBy = acct.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	String reportingOfficeName = new String(request.getParameter("txtreportingofficename").getBytes("ISO-8859-1"), "UTF-8");
	String description = new String(request.getParameter("wysiwyg").getBytes("ISO-8859-1"), "UTF-8");
	int branchId = Integer.parseInt(request.getParameter("slctbranch"));
	
	UmbudsmanReportingOffice umbudsmanReportingOffice = new UmbudsmanReportingOffice(reportingOfficeName,description,branchId,
			modifiedBy,modificationDate);
	umbudsmanReportingOffice.save();
%>
<jsp:forward page="showaddumbudsmanreportingoffice.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Umbudsman reporting office saved successfully!</p></div>"/>
</jsp:forward>
