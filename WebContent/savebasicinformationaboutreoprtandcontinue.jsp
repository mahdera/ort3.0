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
	
	//get the prid from the session object...
	Account account1 = (Account) session.getAttribute("account");
	System.out.println("account is : "+account1);
	if(account1 != null){
		User user1 = User.getUser(account1.getUserId());
		
		int prId = user1.getPrId();
		PublicRelationOfficer pOfficer = PublicRelationOfficer.getpPublicRelationOfficer(prId);
		//now get the organization where this particular pr
		GovernmentSectorOrganization govOrg = GovernmentSectorOrganization.getGovernmentSectorOrganization(pOfficer.getGovernmentSectorOrganizationId());		
		//String freedomofinformationplan = new String(request.getParameter("freedomofinformationplan").getBytes("ISO-8859-1"), "UTF-8");
		
		ReportInputForm reportInputForm = new ReportInputForm(govOrg.getId(),modifiedBy,modificationDate);
		reportInputForm.save();
		//now get the maximum report id filled by the current govt sectory orgn id
		long reportInputFormId = ReportInputForm.getMaxReportInputFormIdForThisGovernmentSectorOrganization(govOrg.getId());
		session.setAttribute("reportInputFormId",reportInputFormId);
		//now save the report form filled by table...but first capture the data from the form submited
		int publishingInformation = Integer.parseInt(request.getParameter("txtpublishinginformation"));
		int organizingRecordOffice = Integer.parseInt(request.getParameter("txtorganizingrecordoffice"));
		int trainingProvisionForHeadsAndProfessionals = Integer.parseInt(request.getParameter("txttrainingprovisionforheadsandprofessionals"));
		int establishingSystemToServeInformationRequesters = Integer.parseInt(request.getParameter("txtestablishingsystemtoserveinformationrequesters"));
		String others = new String(request.getParameter("textareaothers").getBytes("ISO-8859-1"), "UTF-8");
		
		ReportFormFilledBy reportFormFilledBy = new ReportFormFilledBy(reportInputFormId,pOfficer.getId(),pOfficer.getGovernmentSectorOrganizationId(),modificationDate,
				modifiedBy,modificationDate);
		reportFormFilledBy.save();
		//now comes the problem...
		BasicInfoAboutReport basicInfoAboutReport = new BasicInfoAboutReport(reportInputFormId,
				publishingInformation, organizingRecordOffice,trainingProvisionForHeadsAndProfessionals, 
				establishingSystemToServeInformationRequesters,others,modifiedBy,modificationDate);
		basicInfoAboutReport.save();
	%>
		<%@include file="showrequesttoobtaininformationform.jsp" %>
		<%
	}else{
		//no user or the session of the user is destroied.
	}
%>