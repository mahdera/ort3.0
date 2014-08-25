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
	
	String organizationName = new String(request.getParameter("txtorganizationname").getBytes("ISO-8859-1"), "UTF-8");	
	String description = new String(request.getParameter("wysiwyg").getBytes("ISO-8859-1"), "UTF-8");
	int sectorCategoryId = Integer.parseInt(request.getParameter("slctsectorcategory"));
	String officePhone = new String(request.getParameter("txtofficephone").getBytes("ISO-8859-1"), "UTF-8");;
	String fax = new String(request.getParameter("txtfax").getBytes("ISO-8859-1"), "UTF-8");;
	int regionId = Integer.parseInt(request.getParameter("slctregion"));
	int zoneId = 0;
	int woredaId = 0;
	if(request.getParameter("slctzone") != null){
		zoneId = Integer.parseInt(request.getParameter("slctzone"));
	}
	
	if(request.getParameter("slctworeda") != null){
		woredaId = Integer.parseInt(request.getParameter("slctworeda"));
	}
	
	int kebeleId = 0;
	if(request.getParameter("slctkebele") != null){
		kebeleId = Integer.parseInt(request.getParameter("slctkebele"));
	}
	
	GovernmentSectorOrganization governmentSectorOrganization = new GovernmentSectorOrganization(organizationName,
			description,sectorCategoryId,officePhone,fax,regionId,zoneId,woredaId,kebeleId,
			modifiedBy,modificationDate);
	governmentSectorOrganization.save();
%>
<jsp:forward page="showaddgovernmentsectororganizationform.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Government sector organization saved successfully!</p></div>"/>
</jsp:forward>
