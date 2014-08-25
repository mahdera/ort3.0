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
	int thirdPartyRelatedPrivateInformation = Integer.parseInt(request.getParameter("txtthirdpartyrelatedprivateinformation"));
	int thirdPartyRelatedCommercialInformation = Integer.parseInt(request.getParameter("txtthirdpartyrelatedcommercialinformation"));
	int thirdPartyRelatedInformationGivenByTrust = Integer.parseInt(request.getParameter("txtthirdpartyrelatedtrustedinformation"));
	int individualAndPropertyRelatedInformation = Integer.parseInt(request.getParameter("txtprivatesaftyandpropertyrelatedinformation"));
	int lawEnforcerAndJusticeInvestigationRelatedInformation = Integer.parseInt(request.getParameter("txtlawenforcmentandjusticerelatedinformation"));
	int classifedInformationDuringJusticeInvestigation = Integer.parseInt(request.getParameter("txtclassifiedinformationduringinvestigationinformation"));
	int defenceSecurityAndInternationalRelationInformation = Integer.parseInt(request.getParameter("txtdefencesecurityandinternationalrelationinformation"));
	int cabineDocuments = Integer.parseInt(request.getParameter("txtcabinedocuments"));
	int natinalRelatedInformation = Integer.parseInt(request.getParameter("txtcountryrelatedinformation"));
	int governmentRelatedInformation = Integer.parseInt(request.getParameter("txtgovernmentworkdocuments"));
	
	ClassifiedInformationCategory classifiedInformationCategory = new ClassifiedInformationCategory(reportInputFormId,thirdPartyRelatedPrivateInformation,
			thirdPartyRelatedCommercialInformation,thirdPartyRelatedInformationGivenByTrust,individualAndPropertyRelatedInformation,
			lawEnforcerAndJusticeInvestigationRelatedInformation,classifedInformationDuringJusticeInvestigation,
			defenceSecurityAndInternationalRelationInformation,cabineDocuments,natinalRelatedInformation,governmentRelatedInformation,
			modifiedBy,modificationDate);
	classifiedInformationCategory.save();
%>
<%@include file="showsecretinfoissuedrejectioncertificate.jsp" %>
