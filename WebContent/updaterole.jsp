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
	
    int roleIdPara = Integer.parseInt(request.getParameter("roleId"));
    int accountIdPara = Integer.parseInt(request.getParameter("accountId"));
    int functionalityId = Integer.parseInt(request.getParameter("functionalityId"));
    boolean hasReadAccess = Boolean.parseBoolean(request.getParameter("hasReadAccess"));
    boolean hasWriteAccess = Boolean.parseBoolean(request.getParameter("hasWriteAccess"));
    boolean hasUpdateAccess = Boolean.parseBoolean(request.getParameter("hasUpdateAccess"));
    boolean hasDeleteAccess = Boolean.parseBoolean(request.getParameter("hasDeleteAccess"));

    
    Role roleUpdate = new Role(roleIdPara, accountIdPara, hasReadAccess, hasWriteAccess, hasUpdateAccess, hasDeleteAccess, functionalityId,
    		modifiedBy,modificationDate);
    Role.update(roleUpdate);
%>
<!-- <p class="msg done">Role Updated!</p> -->
<div class='message success'><h5>ማረጋገጫ!</h5><p>የሲስተም ተጠቃሚ ሚና በተሳካ ሁኔታ ተመዝግቦአል!</p></div>