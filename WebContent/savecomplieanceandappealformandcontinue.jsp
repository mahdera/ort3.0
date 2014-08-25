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
	//organizationHead....
	int numberOfAppeal = Integer.parseInt(request.getParameter("txtnumberofappealsfororganizationhead"));
	int numberOfInformationRequestRejectedByPublicRelation = Integer.parseInt(request.getParameter("txtpublicrelationrejectedinformationrequestamountorganizationhead"));
	int numberOfInformationRequestApprovedByPublicRelation = Integer.parseInt(request.getParameter("txtpublicrelationapprovedinformationrequestamountorganizationhead"));
	int numberOfInformationRequestEnhancedByPublicRelation = Integer.parseInt(request.getParameter("txtpublicrelationenhancedinformationrequestamountorganizationhead"));
	int numberOfDecisionInProcess = Integer.parseInt(request.getParameter("txtdecisioninprocessamountorganizationhead"));
	
	//main ombudsman office
	int numberOfAdministrativeAppeal = Integer.parseInt(request.getParameter("txtadminappealamountmainombudsman"));	
	int numberOfOrganizationHeadRejectedDecisionAppeal = Integer.parseInt(request.getParameter("txtorganizationheadrejectedappealamountmainobmbudsman"));
	int numberOfOrganizationHeadApprovedDecisionAppeal = Integer.parseInt(request.getParameter("txtorganizationheadapprovedappealamountmainombudsman"));
	int numberOfOrganizationHeadEnhancedDecisionAppeal = Integer.parseInt(request.getParameter("txtorganizationheadenhanceddecisionamountmainobmbudsman"));
	int numberOfDecisionAppealInProgress = Integer.parseInt(request.getParameter("txtappealdecisioninprocessamountmainombudsman"));
	
	//appeal to court
	int numberOfDecisionsRejectingPreviousVerdictByGovtBody = Integer.parseInt(request.getParameter("txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt"));
	int numberOfDecisionsApprovingPreviousVerdictByGovtBody = Integer.parseInt(request.getParameter("txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt"));
	int numberOfDecisionsEnhancingPreviousVerdictByGovtBody = Integer.parseInt(request.getParameter("txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt"));
	int numberOfDecisionsRejectingPreviousVerdictByInformationRequesters = Integer.parseInt(request.getParameter("txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt"));
	int numberOfDecisionsApprovingPreviousVerdictByInformationRequesters = Integer.parseInt(request.getParameter("txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt"));
	int numberOfDecisionsEnhancingPreviousVerdictByInformationRequesters = Integer.parseInt(request.getParameter("txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt"));
	
	//do the saving here....
	AppealToCourt appealToCourt = new AppealToCourt(reportInputFormId,numberOfDecisionsRejectingPreviousVerdictByGovtBody,
			numberOfDecisionsApprovingPreviousVerdictByGovtBody,numberOfDecisionsEnhancingPreviousVerdictByGovtBody,
			numberOfDecisionsRejectingPreviousVerdictByInformationRequesters,numberOfDecisionsApprovingPreviousVerdictByInformationRequesters,
			numberOfDecisionsEnhancingPreviousVerdictByInformationRequesters,modifiedBy,modificationDate);
	appealToCourt.save();	
	
	AppealToOrganizationHead appealToOrganizationHead = new AppealToOrganizationHead(reportInputFormId,numberOfAppeal,
			numberOfInformationRequestRejectedByPublicRelation,numberOfInformationRequestApprovedByPublicRelation,
			numberOfInformationRequestEnhancedByPublicRelation,numberOfDecisionInProcess,modifiedBy,modificationDate);
	appealToOrganizationHead.save();
	
	AppealToMainOmbudsman appealToMainOmbudsman = new AppealToMainOmbudsman(reportInputFormId,numberOfAdministrativeAppeal,
			numberOfOrganizationHeadRejectedDecisionAppeal,numberOfOrganizationHeadApprovedDecisionAppeal,
			numberOfOrganizationHeadEnhancedDecisionAppeal,numberOfDecisionAppealInProgress,modifiedBy,modificationDate);
	appealToMainOmbudsman.save();
%>
<%@include file="showclassifiedinformationcategoryform.jsp"%>