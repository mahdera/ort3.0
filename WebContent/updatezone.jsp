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
	
	String zoneName = new String(request.getParameter("txtzonename").getBytes("ISO-8859-1"), "UTF-8");
	int regionId = Integer.parseInt(request.getParameter("slctregion"));
	int zoneId = Integer.parseInt(request.getParameter("hiddenid"));
	Zone zone = Zone.getZone(zoneId);
	zone.setZoneName(zoneName);
	zone.setRegionId(regionId);
	zone.setModifiedBy(modifiedBy);
	zone.setModificationDate(modificationDate);
	Zone.update(zone);
%>
<jsp:forward page="showlistofzonesforedit.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Zone updated successfully!</p></div>"/>
</jsp:forward>
