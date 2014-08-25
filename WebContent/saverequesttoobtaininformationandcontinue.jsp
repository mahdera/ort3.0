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
	int yearlyInformationRequestMale = Integer.parseInt(request.getParameter("txtyearlyinformationrequestmale"));
	int yearlyInformationRequestFemale = Integer.parseInt(request.getParameter("txtyearlyinformationrequestfemale"));
	int yearlyInformationRequestBoth = Integer.parseInt(request.getParameter("txtyearlyinformationrequestboth"));
	int yearlyInformationRequestOrganization = Integer.parseInt(request.getParameter("txtyearlyinformationrequestorganization"));
	int fullyAcceptedInformationRequest = Integer.parseInt(request.getParameter("txtfullyacceptedinformationrequest"));
	int partiallyAcceptedInformationRequest = Integer.parseInt(request.getParameter("txtpartiallyacceptedinformationrequest"));
	int fullyRejectedInformationRequest = Integer.parseInt(request.getParameter("txtfullyrejectedinformationrequest"));
	
	
	RequestToObtainInformation requestToObtainInformation = new RequestToObtainInformation(reportInputFormId,yearlyInformationRequestMale,
			yearlyInformationRequestFemale,yearlyInformationRequestBoth,yearlyInformationRequestOrganization,fullyAcceptedInformationRequest,
			partiallyAcceptedInformationRequest,fullyRejectedInformationRequest,
			modifiedBy,modificationDate);
	requestToObtainInformation.save();
%>
<%@include file="showcomplieanceandappealform.jsp"%>