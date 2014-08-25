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
	
	long reportInputFormId = Long.parseLong(String.valueOf(session.getAttribute("reportInputFormId").toString()));
	float numberOfInformationRequestWithin30DaysInPercent = Float.parseFloat(request.getParameter("txtinformationrequestwithin30daysinpercent"));
	float numberOfDaysTakenToServeInformationRequestWithin30Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestwithin30days"));
	float numberOfInformationRequestGreaterThan30DaysInPercent = Float.parseFloat(request.getParameter("txtinformationrequestgreaterthan30daysinpercent"));
	float numberOfDaysTakenToServeInformationRequestGreaterThan30Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestgreaterthan30days"));
	float numberOfInformationRequestUrgentlyWithin10DaysInPercent = Float.parseFloat(request.getParameter("txtinformationservedurgentlywithin10daysinpercent"));
	float numberOfDaysTakenToServeInformationRequestUrgentlyWithin10Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestwithin10days"));
	
	////save info here...
	ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = 
	new ServicePerformedByTheGivenTimeDuration(reportInputFormId,numberOfInformationRequestWithin30DaysInPercent,
			numberOfDaysTakenToServeInformationRequestWithin30Days,numberOfInformationRequestGreaterThan30DaysInPercent,
			numberOfDaysTakenToServeInformationRequestGreaterThan30Days,numberOfInformationRequestUrgentlyWithin10DaysInPercent,
			numberOfDaysTakenToServeInformationRequestUrgentlyWithin10Days,modifiedBy,modificationDate);
	servicePerformedByTheGivenTimeDuration.save();
%>
<%@include file="showinformationrightimplementationandadmincost.jsp"%>