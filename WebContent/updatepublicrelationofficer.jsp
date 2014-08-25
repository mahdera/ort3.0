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
	String fullName = new String(request.getParameter("txtfullname").getBytes("ISO-8859-1"), "UTF-8");
	String mobilePhone = request.getParameter("txtmobilephone");
	String email = request.getParameter("txtemail");
	int organizationId = Integer.parseInt(request.getParameter("slctorganization"));
	String pobox = new String(request.getParameter("txtpobox").getBytes("ISO-8859-1"), "UTF-8");
	
	PublicRelationOfficer publicRelationOfficer = PublicRelationOfficer.getpPublicRelationOfficer(id);
	publicRelationOfficer.setFullName(fullName);
	publicRelationOfficer.setMobilePhone(mobilePhone);
	publicRelationOfficer.setEmail(email);
	publicRelationOfficer.setGovernmentSectorOrganizationId(organizationId);
	publicRelationOfficer.setPobox(pobox);
	publicRelationOfficer.setModifiedBy(modifiedBy);
	publicRelationOfficer.setModificationDate(modificationDate);
	PublicRelationOfficer.update(publicRelationOfficer);
%>
<jsp:forward page="showlistofpublicrelationofficerforedit.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Public relation officer updated successfully!</p></div>"/>
</jsp:forward>