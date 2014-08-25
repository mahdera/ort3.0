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
	int numberOfSecretInformationIssuedRejectionCertificate = Integer.parseInt(request.getParameter("txtnumberofsecretinformationissuedrejectioncertificate"));
	
	//save the info here and .....
	RejectionCertificate rejectionCertificate = new RejectionCertificate(reportInputFormId,numberOfSecretInformationIssuedRejectionCertificate,
			modifiedBy,modificationDate);
	rejectionCertificate.save();
%>
<%@include file="showactivitiescompletedduringproclamiationtimeperiod.jsp"%>