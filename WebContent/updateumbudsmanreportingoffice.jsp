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

	int id = Integer.parseInt(request.getParameter("hiddenid"));
	String reportingOfficeName = new String(request.getParameter("txtreportingofficename").getBytes("ISO-8859-1"), "UTF-8");
	String description = new String(request.getParameter("wysiwyg").getBytes("ISO-8859-1"), "UTF-8");
	int branchId = Integer.parseInt(request.getParameter("slctbranch"));	
	//now update the data in the database...
	UmbudsmanReportingOffice umbudsmanReportingOffice = UmbudsmanReportingOffice.getUmbudsmanReportingOffice(id);
	umbudsmanReportingOffice.setReportingOfficeName(reportingOfficeName);
	umbudsmanReportingOffice.setDescription(description);
	umbudsmanReportingOffice.setBranchId(branchId);
	umbudsmanReportingOffice.setModifiedBy(modifiedBy);
	umbudsmanReportingOffice.setModificationDate(modificationDate);
	UmbudsmanReportingOffice.update(umbudsmanReportingOffice);
%>
<jsp:forward page="showlistofumbudsmanreportingofficeforedit.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Ombudsman reporting office updated successfully!</p></div>"/>
</jsp:forward>