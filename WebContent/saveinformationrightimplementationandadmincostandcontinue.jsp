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
	float costForServingInformationRequest = Float.parseFloat(request.getParameter("txtcostofservinginformationrequest"));
	float costForProducingInformation = Float.parseFloat(request.getParameter("txtcostofproducinginformation"));
	float revenueCollectedFromInformationRequestersToCoverAdminCost = Float.parseFloat(request.getParameter("txtcostcollectedfrominformationrequesterstocoveradmincost"));
	int numberOfInformationRequestServedFreeOfCost = Integer.parseInt(request.getParameter("txtinformationrequestservedfreeofcost"));
	
	////save here...
	InformationServiceAdminCost informationServiceAdminCost = new InformationServiceAdminCost(reportInputFormId,costForServingInformationRequest,
			costForProducingInformation,revenueCollectedFromInformationRequestersToCoverAdminCost,numberOfInformationRequestServedFreeOfCost,
			modifiedBy,modificationDate);
	informationServiceAdminCost.save();
%>
<%@include file="showotherissuesthereportmustinclude.jsp"%>