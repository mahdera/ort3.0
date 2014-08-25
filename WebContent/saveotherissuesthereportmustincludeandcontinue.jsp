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
	
	long reportInputFormId = Long.parseLong(String.valueOf(session.getAttribute("reportInputFormId").toString()));
	int numberOfTrainingsGivenToMaleHeadsAndProfessionals = Integer.parseInt(request.getParameter("txtnumberoftrainingsgiventomaleheadsandprofessionals"));
	int numberOfTrainingsGivenToFemaleHeadsAndProfessionals = Integer.parseInt(request.getParameter("txtnumberoftraningsgiventofemaleheadsandprofessionals"));
	String techniquesForFastReponseToInformationRequest =  new String(request.getParameter("textareatechniqueforfastresponse").getBytes("ISO-8859-1"), "UTF-8");
	String informationTechnologyUseExperence =  new String(request.getParameter("textareaitexperence").getBytes("ISO-8859-1"), "UTF-8");
	
	//save logic goes here
	OtherIssuesReportMustContain otherIssuesReportMustContain = new OtherIssuesReportMustContain(reportInputFormId,
			numberOfTrainingsGivenToMaleHeadsAndProfessionals,numberOfTrainingsGivenToFemaleHeadsAndProfessionals,techniquesForFastReponseToInformationRequest,
			informationTechnologyUseExperence,modifiedBy,modificationDate);
	otherIssuesReportMustContain.save();
%>
<%@include file="showpublicationinformation.jsp"%>