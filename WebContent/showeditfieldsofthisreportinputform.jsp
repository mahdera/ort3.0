<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>ORT3.0</title>
   <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>
      
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>
    
    <script type="text/javascript" language="javascript" src="js/ajax_functions.js"></script>
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    <script src="js/setup.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="validation/formValidation.js"></script>
	
    
    <!-- now comes the importing section for amharic typing javascript -->
    <script src="js/amharictyping.js" type="text/javascript"></script>

</head>
<body>
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
		
		Account at = (Account)session.getAttribute("account");
		String typingLang = (String) session.getAttribute("typingLang");
		
		if(session.getAttribute("account") == null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>
    <div class="container_12">
        <%@include file="userhomeheader.jsp" %>
        <div class="clear">
        </div>
        <%@include file="dashboard.jsp" %>
        <div class="clear">
        </div>
        <%@include file="reportinputform_sidebarmenu.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>የሪፖርት ግብአት ፎርም/ቅፅ </a></h2>
                	
	                <div class="block" style="height:450px;background:#fff">
	            	     <div style="width: 100%; height: 100%; overflow-y: scroll;">
	            	     <!-- form edit begins here -->
	            	     <!-- <div class='message info'>አድሚኒስትሬተር የሪፖርት ግብአት ዳታን መመልከት ብቻ ነው የሚችለው። ዳታው ማስተካከያ ካስፈለገው ይህንን ዳታ ያስገባውን የመንግሥት መሥራቤቱን የሕህዝብ ግንኙነት ክፍል ማስተካከያ እንዲያደርግ ማሳወቅ ይቻላል።</div> -->
	            	     <form method="post" action="updatethisreportinputform.jsp" onsubmit="return validateBasicInformationAboutReport();">
			        			 	<table border="1" width="100%" class="form">
			        			 		<tr style="background:lightyellow">
			        			 			<td style="font-size:14pt;float:center;font-weight:bolder">1. ሪፖርቱን የተመለከቱ መሰረታዊ መረጃዎች:</td>
			        			 			<%
			        			 				long reportInputFormId = Long.parseLong(request.getParameter("reportInputFormId"));
			        			 				BasicInfoAboutReport basicInfoAboutReport = BasicInfoAboutReport.getBasicInfoAboutReport(reportInputFormId);
			        			 			%>
			        			 		</tr>
			        			 		<tr>
			        			 			<td>
			        			 				<table border="1" width="100%">
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%" colspan="2"><label>የመረጃ ነጻነት በተመለከተ ሊከናወን ታቅዶ የነበረ ስራ:</label></td>        			 							
			        			 						</tr>        			 						
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%">1.1. መረጃን አትሞ ለማውጣት</td>
			        			 							<td>
			        			 								<input type="text" name="txtpublishinginformationbasic" id="txtpublishinginformationbasic" class="medium" value="<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getPublishingInformation() : "---") %>"/>
			        			 								<input type="hidden" value="<%=reportInputFormId %>" name="hiddenreportinputformid" id="hiddenreportinputformid"/>
			        			 							</td>
			        			 						</tr>
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%">1.2. የሰነድና ማህደር ክፍል ማደራጀት</td>
			        			 							<td>
			        			 								<input type="text" name="txtorganizingrecordofficebasic" id="txtorganizingrecordofficebasic" class="medium" value="<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getOrganizingRecordOffice() : "---")%>"/>
			        			 							</td>
			        			 						</tr>
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%">1.3. ለኃላፉዎችና ባለሙያዎች  ስልጠና መስጠት</td>
			        			 							<td>
			        			 								<input type="text" name="txttrainingprovisionforheadsandprofessionalsbasic" id="txttrainingprovisionforheadsandprofessionalsbasic" class="medium" value="<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getTrainingProvisionsForHeadsAndProfessionals() : "---") %>"/>
			        			 							</td>
			        			 						</tr>
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%">1.4. የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</td>
			        			 							<td>
			        			 								<input type="text" name="txtestablishingsystemtoserveinformationrequestersbasic" id="txtestablishingsystemtoserveinformationrequestersbasic" class="medium" value="<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getEstablishingSystemToServeInformationRequesters() : "---")%>"/>
			        			 							</td>
			        			 						</tr>
			        			 						<tr>
			        			 							<td style="font-size:11pt" width="40%">1.5. ሌሎች ካሉ</td>        			 							
			        			 						</tr>        			 						
			        			 						<tr>
			        			 							<td colspan="2">
			        			 								
			        			 								<textarea class="tinymce" style="width:100%" name="textareaothersbasic" id="textareaothersbasic" rows="10"><%=(basicInfoAboutReport != null ? basicInfoAboutReport.getOthers() : "---") %></textarea>
			        			 							
			        			 							</td>
			        			 						</tr>			        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>        		
			        			 	<!-- request for information -->
			        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">2. መረጃ  ለማግኘት የቀረበ ጥያቄን በተመለከተ:</td>
        			 		</tr>
        			 		<%
        			 			RequestToObtainInformation requestToObtainInformation = RequestToObtainInformation.getRequestToObtainInformation(reportInputFormId);
        			 		%>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.1 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወንድ):</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtyearlyinformationrequestmaleinforequest" id="txtyearlyinformationrequestmaleinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestMale() : "---") %>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.2 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ሴት):</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtyearlyinformationrequestfemaleinforequest" id="txtyearlyinformationrequestfemaleinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestFemale() : "---") %>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.3 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወል):</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtyearlyinformationrequestbothinforequest" id="txtyearlyinformationrequestbothinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestBoth() : "---")%>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.4 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ድርጅት):</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtyearlyinformationrequestorganizationinforequest" id="txtyearlyinformationrequestorganizationinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestOrganization() : "---") %>"/>
	       			 							</td>
       			 							</tr>  
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.4 ሙሉ በሙሉ ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtfullyacceptedinformationrequestinforequest" id="txtfullyacceptedinformationrequestinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getFullyAcceptedInformationRequest() : "---")%>"/>
	       			 							</td>
	       			 						</tr>   
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.5 በከፊል  ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtpartiallyacceptedinformationrequestinforequest" id="txtpartiallyacceptedinformationrequestinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getPartiallyAcceptedInformationRequest() : "---")%>"/>
	       			 							</td>
	       			 						</tr>  	
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>2.6 ሙሉ በሙሉ ተቀባይነት ያላገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtfullyrejectedinformationrequestinforequest" id="txtfullyrejectedinformationrequestinforequest" value="<%=(requestToObtainInformation != null ? requestToObtainInformation.getFullyRejectedInformationRequest() : "---")%>"/>
	       			 							</td>
	       			 						</tr>        			 						
		        			 				</table>        			 				
		        			 			</td>
		        			 		</tr>
		        			 	</table><!-- up to here --> 
		        			 	<!-- Complieance begins here -->
		        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">3. የቀረቡ አቤቱታዎች/ቅሬታዎች:</td>
        			 			<%
        			 				AppealToOrganizationHead applealToOrganizationHead = AppealToOrganizationHead.getAppealToOrganizationHead(reportInputFormId);
        			 				AppealToMainOmbudsman appealToMainOmbudsman = AppealToMainOmbudsman.getAppealToMainOmbudsman(reportInputFormId);
        			 				AppealToCourt appealToCourt = AppealToCourt.getAppealToCourt(reportInputFormId);
        			 			%>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<fieldset>
        			 				<legend>3.1 ለተቋሙ የበላይ አላፊ የቀረቡ አቤቱታዎች</legend>
        			 				<table border="1" width="100%">        			 						
        			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.1.1 የአቤቱታዎች ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtnumberofappealsfororganizationhead" id="txtnumberofappealsfororganizationhead" value="<%=(applealToOrganizationHead != null ? applealToOrganizationHead.getNumberOfAppeal() : "---")%>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.1.2 የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtpublicrelationrejectedinformationrequestamountorganizationhead" id="txtpublicrelationrejectedinformationrequestamountorganizationhead" value="<%=(applealToOrganizationHead != null ? applealToOrganizationHead.getNumberOfRequestRejectedByPR() : "---") %>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.1.3 የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtpublicrelationapprovedinformationrequestamountorganizationhead" id="txtpublicrelationapprovedinformationrequestamountorganizationhead" value="<%=(applealToOrganizationHead != null ? applealToOrganizationHead.getNumberOfRequestApprovedByPR() : "---")%>"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.1.4 የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ጥያቄ  ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtpublicrelationenhancedinformationrequestamountorganizationhead" id="txtpublicrelationenhancedinformationrequestamountorganizationhead" value="<%=(applealToOrganizationHead != null ? applealToOrganizationHead.getNumberOfRequestImprovedByPR() : "---") %>"/>
	       			 							</td>
       			 							</tr>  
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.1.5 በሂደት ላይ ያለ ውሳኔ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtdecisioninprocessamountorganizationhead" id="txtdecisioninprocessamountorganizationhead" value="<%=(applealToOrganizationHead != null ? applealToOrganizationHead.getNumberOfDecisionInProgress() : "---")%>"/>
	       			 							</td>
	       			 						</tr>  
	       			 					</table> 
	       			 					</fieldset>
	       			 					<fieldset>
	       			 					<legend>3.2. ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች</legend>
	       			 					<table>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.2.1 የአስተዳደራዊ ይግባኞች  ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtadminappealamountmainombudsman" id="txtadminappealamountmainombudsman" value="<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfAppeal() : "---")%>"/>
	       			 							</td>
	       			 						</tr>  	
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.2.2 የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሻረበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtorganizationheadrejectedappealamountmainobmbudsman" id="txtorganizationheadrejectedappealamountmainobmbudsman" value="<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestRejectedByHead() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.2.3 የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtorganizationheadapprovedappealamountmainombudsman" id="txtorganizationheadapprovedappealamountmainombudsman" value="<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestApprovedByHead() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.2.4 የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሸሻለበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtorganizationheadenhanceddecisionamountmainobmbudsman" id="txtorganizationheadenhanceddecisionamountmainobmbudsman" value="<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestImprovedByHead() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.2.5 በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtappealdecisioninprocessamountmainombudsman" id="txtappealdecisioninprocessamountmainombudsman" value="<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfDecisionInProgress() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						</table>
	       			 						</fieldset>     			 								 						
        			 						<fieldset>
        			 							<legend>3.3. ለፍርድ ቤት የቀረቡ ይግባኞች</legend>
        			 							<table>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.1 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt" id="txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt" value="<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionRejectingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>  	
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.2 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt" id="txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt" value="<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionApprovingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.3 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt" id="txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt" value="<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionImprovingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.4 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt" id="txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt" value="<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionRejectingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.5 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt" id="txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt" value="<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionApprovingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label>3.3.6 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="medium" name="txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt" id="txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt" value="<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionImprovingPreviousDecision() : "---")%>"/>
	       			 							</td>
	       			 						</tr>
	       			 						</table>
        			 						</fieldset>        			 				      			 				
			        			 			</td>
			        			 		</tr>			        			 		
			        			 	</table><!-- up to here -->  	
			        			 	<!-- classified information begins -->
			        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">4. በማይገለጹ መረጃዎች ምድብ ውስጥ ናቸው በሚል የመንግስት አካሉ በዓመት ውስጥ እንዳይገለጹ ያደረጋቸው ወይም ለክልከላ መነሻ የሆኑ ህጋዊ ምክነያቶች ምድብና ብዛት፡:</td>
        			 		</tr>
        			 		<%
        			 			ClassifiedInformationCategory classifiedInformationCategory = ClassifiedInformationCategory.getClassifiedInformationCategory(reportInputFormId);
        			 			
        			 		%>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.1. ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtthirdpartyrelatedprivateinformationclassifiedinfo" id="txtthirdpartyrelatedprivateinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedPrivateInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.2. የሶስተኛ ወገን የንግድ መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtthirdpartyrelatedcommercialinformationclassifiedinfo" id="txtthirdpartyrelatedcommercialinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedCommercialInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.3. በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtthirdpartyrelatedtrustedinformationclassifiedinfo" id="txtthirdpartyrelatedtrustedinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedTrustedInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.4. የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtprivatesaftyandpropertyrelatedinformationclassifiedinfo" id="txtprivatesaftyandpropertyrelatedinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getPrivateSaftyAndPropertyRelatedInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.5. የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtlawenforcmentandjusticerelatedinformationclassifiedinfo" id="txtlawenforcmentandjusticerelatedinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getLawEnforcementAndJusticeRelatedInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.6. በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtclassifiedinformationduringinvestigationinformationclassifiedinfo" id="txtclassifiedinformationduringinvestigationinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getClassifiedInformationDuringInvestigation() : "---")%>"/>
					 							</td>
					 						</tr>        
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.7. የመከላከያ፣ ደህነትና  ዓለም አቀፍ ግንኙነት መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtdefencesecurityandinternationalrelationinformationclassifiedinfo" id="txtdefencesecurityandinternationalrelationinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getDefenseSecurityAndInternationalRelationInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.8. የካቢኔ ሰነዶች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtcabinedocumentsclassifiedinfo" id="txtcabinedocumentsclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getCabineDocuments() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.9. የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtcountryrelatedinformationclassifiedinfo" id="txtcountryrelatedinformationclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getCountryRelatedInformation() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>4.10. የመንግሥት የሥራ ሰነዶች:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtgovernmentworkdocumentsclassifiedinfo" id="txtgovernmentworkdocumentsclassifiedinfo" value="<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getGovernmentWorkDocuments() : "---")%>"/>
					 							</td>
					 						</tr>        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>
			        			 	<!-- rejection certificate begins here -->
			        			 	<table border="1" width="100%" class="form">
			        			 		<tr style="background:lightyellow">
			        			 			<td style="font-size:14pt;float:center;font-weight:bolder">5. የክልከላ ሰርተፍኬት:</td>
			        			 			<%
			        			 				RejectionCertificate rejectionCertificate = RejectionCertificate.getRejectionCertificate(reportInputFormId);
			        			 			%>
			        			 		</tr>
			        			 		<tr>
			        			 			<td>
			        			 				<table border="1" width="100%">
			        			 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>5.1. የክልከላ ሰርተፍኬት የተሰጣቸው ሚስጥራዊ መረጃዎች ብዛት:</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtnumberofsecretinformationissuedrejectioncertificate" id="txtnumberofsecretinformationissuedrejectioncertificate" value="<%=(rejectionCertificate != null ? rejectionCertificate.getNumberOfSecretInformationGivenRejectionCertificate() : "---")%>"/>
								 							</td>
								 						</tr>			        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>	
			        			 	<!-- activities in time duration as per the proclamation begins here -->
			        			 	<table border="1" width="100%" >
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">6. በአዋጁ በተቀመጠው የጊዜ ገደብ ውስጥ በመስተናገድ ረገድ የተከናወኑ ተግባራት:</td>
        			 		</tr>
        			 		<%
        			 			ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = ServicePerformedByTheGivenTimeDuration.getServicePerformedByTheGivenTimeDuration(reportInputFormId);
        			 		%>
        			 		<tr>
        			 			<td>
        			 				<fieldset>
        			 				<legend>በ30 የስራ ቀናት  የጊዜ ገደብ ውስጥ የተስተናገዱ </legend>
        			 				<table border="1" width="100%">
        			 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.1. የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtinformationrequestwithin30daysinpercent" id="txtinformationrequestwithin30daysinpercent" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfInformationRequestBetween30Days()/100 : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.2. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtnumberofdaystakenforservinginformationrequestwithin30days" id="txtnumberofdaystakenforservinginformationrequestwithin30days" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestBetween30Days() : "---")%>"/>
					 							</td>
					 						</tr>					 						
					 				</table>
					 				</fieldset>
					 				
					 				<fieldset>
					 				<legend>ከ30 የስራቀናት በላይ የተስተናገዱ </legend>
					 				<table border="1" width="100%">
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.3. የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtinformationrequestgreaterthan30daysinpercent" id="txtinformationrequestgreaterthan30daysinpercent" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfInformationRequestTookMoreThan30Days()/100 : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.4. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtnumberofdaystakenforservinginformationrequestgreaterthan30days" id="txtnumberofdaystakenforservinginformationrequestgreaterthan30days" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestTookMoreThan30Days() : "---")%>"/>
					 							</td>
					 						</tr>
					 				</table>
					 				</fieldset>
					 				
					 				<fieldset>
					 					<legend>6.3. አጣዳፊ ምላሽ በ10 ቀን የጊዜ ገደብ ውስጥ የተስተናገደ</legend>
					 					<table border="1" width="100%">
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.5. የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtinformationservedurgentlywithin10daysinpercent" id="txtinformationservedurgentlywithin10daysinpercent" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfUrgentInformationRequestBetween10Days()/100 : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>6.6. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtnumberofdaystakenforservinginformationrequestwithin10days" id="txtnumberofdaystakenforservinginformationrequestwithin10days" value="<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeUrgentRequestBetween10Days() : "---")%>"/>
									 							</td>
									 						</tr>
									 					</table>
									 				</fieldset>
									 			</td>
									 		</tr>				 			 				
				        			</table>   
				        			<!--information right implementation begins here  -->
				        			<table border="1" width="100%" class="form">
			        			 		<tr style="background:lightyellow">
			        			 			<td style="font-size:14pt;float:center;font-weight:bolder">7. የመረጃ መብት ትግበራ አመታዊ አስተዳደራዊ ወጪዎችን በተመለከተ:</td>
			        			 		</tr>
			        			 		<%
			        			 			InformationServiceAdminCost informationServiceAdminCost = InformationServiceAdminCost.getInformationServiceAdminCost(reportInputFormId);
			        			 		%>
			        			 		<tr>
			        			 			<td>
			        			 				<table border="1" width="100%">
			        			 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>7.1. የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ:</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtcostofservinginformationrequest" id="txtcostofservinginformationrequest" value="<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getCostOfServingInformationRequest() : "---")%>"/>
								 							</td>
								 						</tr>
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>7.2. መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ:</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtcostofproducinginformation" id="txtcostofproducinginformation" value="<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getCostOfPublishingInformation() : "---")%>"/>
								 							</td>
								 						</tr>
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>7.3. አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ:</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtcostcollectedfrominformationrequesterstocoveradmincost" id="txtcostcollectedfrominformationrequesterstocoveradmincost" value="<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getRevenueCollectedFromUsersCoverAdminCost() : "---")%>"/>
								 							</td>
								 						</tr>
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>7.4. ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት:</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtinformationrequestservedfreeofcost" id="txtinformationrequestservedfreeofcost" value="<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getNumberOfInformationRequestServedFreeOfCharge() : "---")%>"/>
								 							</td>
								 						</tr>			        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>   
			        			 	<!-- other information the report must contain begins here -->
			        			 	<table border="1" width="100%" class="form">
			        			 		<tr style="background:lightyellow">
			        			 			<td style="font-size:14pt;float:center;font-weight:bolder">8. ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች:</td>
			        			 		</tr>
			        			 		<%
			        			 			OtherIssuesReportMustContain otherIssuesReportMustContain = OtherIssuesReportMustContain.getOtherIssuesReportMustContain(reportInputFormId);
			        			 		%>
			        			 		<tr>
			        			 			<td>
			        			 				<table border="1" width="100%">
			        			 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>8.1. ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ):</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtnumberoftrainingsgiventomaleheadsandprofessionals" id="txtnumberoftrainingsgiventomaleheadsandprofessionals" value="<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getNumberOfTrainingsGivenToMaleHeadAndProfessionals() : "---")%>"/>
								 							</td>
								 						</tr>
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>8.2. ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት):</label></td>
								 							<td align="left">
								 								<input type="text" class="medium" name="txtnumberoftraningsgiventofemaleheadsandprofessionals" id="txtnumberoftraningsgiventofemaleheadsandprofessionals" value="<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getNumberOfTrainingsGivenToFemaleHeadAndProfessionals() : "---")%>"/>
								 							</td>
								 						</tr>
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>8.3. ለመረጃ ጥያቄ ፈጣን ምላሽ ለመስጠት የተቀየሱና ሥራ ላይ የዋሉ ስልቶች ካሉ:</label></td>
								 							<td align="left">
								 								<textarea style="width:100%" class="tinymce" id="textareatechniqueforfastresponse" name="textareatechniqueforfastresponse" rows="10"><%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getTechniqueForFastResponse() : "---") %></textarea>
								 							</td>
								 						</tr>	
								 						<tr>
								 							<td style="font-size:11pt" width="40%"><label>8.4. በኢንፎርሜሽን ቴክኖሎጂ በመጠቀም ረገድ ያሉ ተሞክሮዎች ካሉ:</label></td>
								 							<td align="left">
								 								<textarea style="width:100%" class="tinymce" id="textareaitexperence" name="textareaitexperence" rows="10"><%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getItExperience() : "---") %></textarea>
								 							</td>
								 						</tr>			        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>  		
			        			 	<!-- publication information begins here -->
			        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">9. አትሞ ስለማውጣት:</td>
        			 		</tr>
        			 		<%
        			 			PublishingInformation publishingInformation = PublishingInformation.getPublishingInformation(reportInputFormId);
        			 			PaperPublication paperPublication = PaperPublication.getPaperPublication(reportInputFormId);
        			 			ElectronicPublication electronicPublication = ElectronicPublication.getElectronicPublication(reportInputFormId);
        			 			BroadCast broadCast = BroadCast.getBroadCast(reportInputFormId);
        			 			PublicationContent publicationContent = PublicationContent.getPublicationContent(reportInputFormId);
        			 		%>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>9.1. በሕትመት መልክ በዓመት ለምን ያህል ጊዜ ታትሞ ወጣ:</label></td>
					 							<td align="left">
					 								<input type="text" class="medium" name="txtnumberofpublicationperyear" id="txtnumberofpublicationperyear" value="<%=(publishingInformation != null ? publishingInformation.getYearlyNumberOfPublication() : "---")%>"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.2. የሕትመቱ ዘርፍ (በወረቀት)</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>የሕትመቱ ዓይነት</th>
					 											<th>የሕትመቱ ብዛት</th>
					 											<th>Cost/ዋጋ</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.1. ብሮሸር:</td>
					 											<td align="left">
					 												<input type="text" name="txtbrochureamount" id="txtbrochureamount" class="medium" value="<%=(paperPublication != null ? paperPublication.getBrochureAmount() : "---")%>"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtbrochureamountCost" id="txtbrochureamountCost" class="medium" value="<%=(paperPublication != null ? paperPublication.getBrochureAmountCost() : "---") %>" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.2. መፅሔት:</td>
					 											<td align="left">
					 												<input type="text" name="txtmagazineamount" id="txtmagazineamount" class="medium" value="<%=(paperPublication != null ? paperPublication.getMagazineAmount() : "---")%>"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtmagazineamountCost" id="txtmagazineamountCost" class="medium" value="<%=(paperPublication != null ? paperPublication.getMagazineAmountCost() : "---")%>" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.3. ፓምፍሌት:</td>
					 											<td align="left">
					 												<input type="text" name="txtpamphletamount" id="txtpamphletamount" class="medium" value="<%=(paperPublication != null ? paperPublication.getPamphletAmount() : "---")%>"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtpamphletamountCost" id="txtpamphletamountCost" class="medium" value="<%=(paperPublication != null ? paperPublication.getPamphletAmountCost() : "---")%>" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.4. ጋዜጣ:</td>
					 											<td align="left">
					 												<input type="text" name="txtnewspaperamount" id="txtnewspaperamount" class="medium" value="<%=(paperPublication != null ? paperPublication.getNewsPaperAmount() : "---")%>"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtnewspaperamountCost" id="txtnewspaperamountCost" class="medium" value="<%=(paperPublication != null ? paperPublication.getNewsPaperAmountCost() : "---")%>" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.5. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtotherspaperamount" id="txtotherspaperamount" class="medium" value="<%=(paperPublication != null ? paperPublication.getOthersAmount() : "---")%>"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtotherspaperamountCost" id="txtotherspaperamountCost" class="medium" value="<%=(paperPublication != null ? paperPublication.getOthersAmountCost() : "---")%>" />
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.3. የሕትመቱ ዘርፍ (9.2.2. በኤሌክትሮኒክስ)</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>የሕትመቱ ዓይነት</th>
					 											<th>የሕትመቱ ብዛት</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.1. ሲዲ:</td>
					 											<td align="left">
					 												<input type="text" name="txtcdamount" id="txtcdamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getCdAmount() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.2. ዲቪዲ:</td>
					 											<td align="left">
					 												<input type="text" name="txtdvdamount" id="txtdvdamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getDvdAmount() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.3. ፍሎፒ:</td>
					 											<td align="left">
					 												<input type="text" name="txtfloppyamount" id="txtfloppyamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getFloppyDiskAmount() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.4. ድረ-ገጽ:</td>
					 											<td align="left">
					 												<input type="text" name="txtwebamount" id="txtwebamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getWebAmount() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.5. የማህበረሰብ ሚዲያ:</td>
					 											<td align="left">
					 												<input type="text" name="txtsocialmediaamount" id="txtsocialmediaamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getSocialMediaAmount() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.6. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtotherselectionelectronicamount" id="txtotherselectionelectronicamount" class="medium" value="<%=(electronicPublication != null ? electronicPublication.getOthers() : "---")%>"/>
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.4. ብሮድካስት</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>ዓይነት</th>
					 											<th>የሥርጭቱ ብዛት</th>
					 											<th>የወሠደው የአየር ሰዓት ብዛት</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.1. ሬዲዬ:</td>
					 											<td align="left">
					 												<input type="text" name="txtradiobroadcastamount" id="txtradiobroadcastamount" class="medium" value="<%=(broadCast != null ? broadCast.getRadioAmount() : "---")%>"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txtradioairusage" id="txtradioairusage" class="medium" value="<%=(broadCast != null ? broadCast.getRadioAirUsage() : "---")%>"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.2. ቴሌቪዥን:</td>
					 											<td align="left">
					 												<input type="text" name="txttelevisionbroadcastamount" id="txttelevisionbroadcastamount" class="medium" value="<%=(broadCast != null ? broadCast.getTelevisionAmount() : "---")%>"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txttelevisionairusage" id="txttelevisionairusage" class="medium" value="<%=(broadCast != null ? broadCast.getTelevisionAirUsage() : "---")%>"/>
					 											</td>
					 										</tr>					 										
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.5. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtothersbroadcastamount" id="txtothersbroadcastamount" class="medium" value="<%=(broadCast != null ? broadCast.getOthersAmount() : "---")%>"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txtotherbroadcastairusage" id="txtotherbroadcastairusage" class="medium" value="<%=(broadCast != null ? broadCast.getOthersAirUsage() : "---")%>"/>
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>	
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.5. የህትመቱ ይዘት</legend>
					 									<table border="1" width="100%">					 										
					 										<tr style="background:#eee">
					 											<td>9.5.1. </td>
					 											<td style="font-size:11pt" width="40%">ስለመስርያ ቤቱ መዋቅር፣ አደረጃጀት፣ ስለ ዋና ተግባራቱና ኃላፊነቱ:</td>
					 											<td align="left">
					 												<%
					 													if(!publicationContent.get_951().equals("---")){
					 												%>
					 												<input type="checkbox" name="chk951" id="chk951" value="ስለመስርያ ቤቱ መዋቅር፣ አደረጃጀት፣ ስለ ዋና ተግባራቱና ኃላፊነቱ" checked="checked"/>
					 												<%
					 													}else{
					 														%>
					 														<input type="checkbox" name="chk951" id="chk951" value="ስለመስርያ ቤቱ መዋቅር፣ አደረጃጀት፣ ስለ ዋና ተግባራቱና ኃላፊነቱ"/>
					 														<%
					 													}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.2. </td>
					 											<td style="font-size:11pt" width="40%">የኃላፊዎቹን ስልጣንና ኃላፊነት እዲሁም በውሳኔ አሰጣጥ ላይ ተፈጻሚ ስለሚሆነው ስነ-ስረአት:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_952().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk952" id="chk952" value="የኃላፊዎቹን ስልጣንና ኃላፊነት እዲሁም በውሳኔ አሰጣጥ ላይ ተፈጻሚ ስለሚሆነው ስነ-ስረአት" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk952" id="chk952" value="የኃላፊዎቹን ስልጣንና ኃላፊነት እዲሁም በውሳኔ አሰጣጥ ላይ ተፈጻሚ ስለሚሆነው ስነ-ስረአት"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.3. </td>
					 											<td style="font-size:11pt" width="40%">ለሕዝብ ስለሚሰጣቸው አገልግሎቶች ዝርዝር:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_953().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk953" id="chk953" value="ለሕዝብ ስለሚሰጣቸው አገልግሎቶች ዝርዝር" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk953" id="chk953" value="ለሕዝብ ስለሚሰጣቸው አገልግሎቶች ዝርዝር"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.4. </td>
					 											<td style="font-size:11pt" width="40%">ለተገልጋዩ ሕዝብ ስለተዘረጋው የቅሬታ አሰማም ስርአትና ከሕዝብ ዘውትር ለሚቀርቡ ጥያቄዎች ወይም ቅሬታዎች የመስርያ ቤቱን ምላሽ የሚያሳዩ ዘገባዎች:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_954().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk954" id="chk954" value="ለተገልጋዩ ሕዝብ ስለተዘረጋው የቅሬታ አሰማም ስርአትና ከሕዝብ ዘውትር ለሚቀርቡ ጥያቄዎች ወይም ቅሬታዎች የመስርያ ቤቱን ምላሽ የሚያሳዩ ዘገባዎች" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk954" id="chk954" value="ለተገልጋዩ ሕዝብ ስለተዘረጋው የቅሬታ አሰማም ስርአትና ከሕዝብ ዘውትር ለሚቀርቡ ጥያቄዎች ወይም ቅሬታዎች የመስርያ ቤቱን ምላሽ የሚያሳዩ ዘገባዎች"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.5. </td>
					 											<td style="font-size:11pt" width="40%">በእጅ ስለሚገዩ መዝገቦች አይነትና በመዝገቦቹ ውስጥ ስለሚገኙ መረጃዎች ይዘት አጭር ማቢራርያ እዲሁም መረጃ ለማግኘት የሚፈልጉ ሰወች  የመረጃ ጥያቄዎች አቀራረብ ስነስርአት ዝርዝር ማብራርያዎችን:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_955().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk955" id="chk955" value="በእጅ ስለሚገዩ መዝገቦች አይነትና በመዝገቦቹ ውስጥ ስለሚገኙ መረጃዎች ይዘት አጭር ማቢራርያ እዲሁም መረጃ ለማግኘት የሚፈልጉ ሰወች  የመረጃ ጥያቄዎች አቀራረብ ስነስርአት ዝርዝር ማብራርያዎችን" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk955" id="chk955" value="በእጅ ስለሚገዩ መዝገቦች አይነትና በመዝገቦቹ ውስጥ ስለሚገኙ መረጃዎች ይዘት አጭር ማቢራርያ እዲሁም መረጃ ለማግኘት የሚፈልጉ ሰወች  የመረጃ ጥያቄዎች አቀራረብ ስነስርአት ዝርዝር ማብራርያዎችን"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.6.</td>
					 											<td style="font-size:11pt" width="40%">የመስርያቤቱ መተዳደርያ ደንብ፣ የመስርያቤቱ ልዩ ልዩ አካላት ስራዎች የሚመሩባቸውን ደንቦች፣ ማንዋሎች እዲሁም የተሸሻሉ ውይም የተሸሩ መመርያዎች የሚገኙባቸውን  መዝገቦች ዝርዝር:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_956().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk956" id="chk956" value="የመስርያቤቱ መተዳደርያ ደንብ፣ የመስርያቤቱ ልዩ ልዩ አካላት ስራዎች የሚመሩባቸውን ደንቦች፣ ማንዋሎች እዲሁም የተሸሻሉ ውይም የተሸሩ መመርያዎች የሚገኙባቸውን  መዝገቦች ዝርዝር" checked="checked"/>
					 											<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk956" id="chk956" value="የመስርያቤቱ መተዳደርያ ደንብ፣ የመስርያቤቱ ልዩ ልዩ አካላት ስራዎች የሚመሩባቸውን ደንቦች፣ ማንዋሎች እዲሁም የተሸሻሉ ውይም የተሸሩ መመርያዎች የሚገኙባቸውን  መዝገቦች ዝርዝር"/>
					 													<%
					 												}
					 											%>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.7.</td>
					 											<td style="font-size:11pt" width="40%">የድርጅቱ ሰራተኞች የሚሰሩባቸውን መመርያዎች ፣ ደንቦች ፣ ማብራርያዎችና ሌሎች ሰነዶች:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_957().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk957" id="chk957" value="የድርጅቱ ሰራተኞች የሚሰሩባቸውን መመርያዎች ፣ ደንቦች ፣ ማብራርያዎችና ሌሎች ሰነዶች" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk957" id="chk957" value="የድርጅቱ ሰራተኞች የሚሰሩባቸውን መመርያዎች ፣ ደንቦች ፣ ማብራርያዎችና ሌሎች ሰነዶች"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.8.</td>
					 											<td style="font-size:11pt" width="40%">የሕዝብ ግንኙነቱ ኃላፊው ስም እና አድራሻ:</td>
					 											<td align="left">
					 											<%
					 												if(!publicationContent.get_958().equals("---")){
					 											%>
					 												<input type="checkbox" name="chk958" id="chk958" value="የሕዝብ ግንኙነቱ ኃላፊው ስም እና አድራሻ" checked="checked"/>
					 												<%
					 												}else{
					 													%>
					 													<input type="checkbox" name="chk958" id="chk958" value="የሕዝብ ግንኙነቱ ኃላፊው ስም እና አድራሻ"/>
					 													<%
					 												}
					 												%>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.9.</td>
					 											<td style="font-size:11pt" width="40%" colspan="2">ሌሎች ዝርዝሮች ካሉ:</td>					 																 											
					 										</tr>					 							
					 										<tr>
					 											<td colspan="3" align="center">					 											
					 												<textarea style="width:100%" class="tinymce" id="textareaotherspublicationcontent" name="textareaotherspublicationcontent" rows="10"><%=(publicationContent != null ? publicationContent.getOthers() : "---") %></textarea>
					 											</td>
					 										</tr>			
					 									</table>
					 								</fieldset>
					 							</td>
					 							</tr>			        			 						
			        			 				</table>        			 				
			        			 			</td>
			        			 		</tr>
			        			 	</table>
			        			 	<!-- problems and solutions section begins -->
			        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">10. በአፈፃፀም ያጋጠሙ ችግሮች እና የመፍትሔ ሃሳቦች:</td>
        			 		</tr>
        			 		<%
        			 			ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = ProblemsAndSolutionsImplementation.getProblemsAndSolutionsImplementation(reportInputFormId);
        			 		%>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 					<tr>
        			 						<th rowspan="2" width="40%">ችግሮቹ</th>
        			 						<th colspan="3">የችግሮቹ ደረጃ</th>        			 						
        			 					</tr>        			 						
        			 					<tr>
        			 						<th>ከፍተኛ</th>
        			 						<th>መካከለኛ</th>
        			 						<th>ዝቅተኛ</th>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td width="40%">10.1 በአዋጁ ስለተደነገጉ መብቶች የግንዛቤ ማነስ:</td>
        			 						<%
        			 						if(problemsAndSolutionsImplementation.getLackOfUnderstandingAboutRights().equals("High")){
        			 						%>
        			 						<td align="center">
        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="High" checked="checked"/>
        			 						</td>
        			 						<td align="center">
        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Medium"/>
        			 						</td>
        			 						<td align="center">
        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Low"/>
        			 						</td>
        			 						<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfUnderstandingAboutRights().equals("Medium")){
        			 							%>
        			 							<td align="center">
        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="High"/>
	        			 						</td>
	        			 						<td align="center">
	        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Medium" checked="checked"/>
	        			 						</td>
	        			 						<td align="center">
	        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Low"/>
	        			 						</td>
        			 							<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfUnderstandingAboutRights().equals("Low")){
        			 							%>
        			 							<td align="center">
        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="High"/>
	        			 						</td>
	        			 						<td align="center">
	        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Medium"/>
	        			 						</td>
	        			 						<td align="center">
	        			 							<input type="radio" name="rad10_1problem" id="rad10_1problem" value="Low" checked="checked"/>
	        			 						</td>
        			 							<%
        			 						}
        			 						%>
        			 					</tr>
        			 					<tr>
        			 						<td>10.2 ከበላይ ኃላፊ ስለትግበራው ትኩረትና ተገቢዉን ድጋፊ አለማግኘት:</td>
        			 						<%
        			 						if(problemsAndSolutionsImplementation.getLackOfAttentionAndSupportFromHead().equals("High")){
        			 						%>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="High" checked="checked"/></td>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Low"/></td>
        			 						<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfAttentionAndSupportFromHead().equals("Medium")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Medium" checked="checked"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Low"/></td>
        			 							<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfAttentionAndSupportFromHead().equals("Low")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Medium"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Low" checked="checked"/></td>
        			 							<%
        			 						}
        			 						%>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.3 የመረጃ ስርአት ባለው መንገድ አለመደራጀቱ:</td>
        			 						<%
        			 						if(problemsAndSolutionsImplementation.getLackOfITInfrastructure().equals("High")){
        			 						%>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="High" checked="checked"/></td>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Low"/></td>
        			 						<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfITInfrastructure().equals("Medium")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Medium" checked="checked"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Low"/></td>
        			 							<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfITInfrastructure().equals("Low")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Medium"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Low" checked="checked"/></td>
        			 							<%
        			 						}
        			 						%>
        			 					</tr>
        			 					<tr>
        			 						<td>10.4 የበጀት እጥረት እና የግብአት ችግሮች:</td>
        			 						<%
        			 						if(problemsAndSolutionsImplementation.getLackOfBudgetAndInputProblem().equals("High")){
        			 						%>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="High" checked="checked"/></td>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Low"/></td>
        			 						<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfBudgetAndInputProblem().equals("Medium")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Medium" checked="checked"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Low"/></td>
        			 							<%
        			 						}else if(problemsAndSolutionsImplementation.getLackOfBudgetAndInputProblem().equals("Low")){
        			 							%>
        			 							<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="High"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Medium"/></td>
	        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Low" checked="checked"/></td>
        			 							<%
        			 						}
        			 						%>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.5 ከሚመለከተው አካል የክትትልና ድጋፍ ማነስ:</td>
        			 						<%
        			 							if(problemsAndSolutionsImplementation.getLackOfFollowupAndSupportFromConcernedBody().equals("High")){
        			 						%>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="High" checked="checked"/></td>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Low"/></td>
        			 						<%
        			 							}else if(problemsAndSolutionsImplementation.getLackOfFollowupAndSupportFromConcernedBody().equals("Medium")){
        			 								%>
        			 								<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="High"/></td>
		        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Medium" checked="checked"/></td>
		        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Low"/></td>
        			 								<%
        			 							}else if(problemsAndSolutionsImplementation.getLackOfFollowupAndSupportFromConcernedBody().equals("Low")){
        			 								%>
        			 								<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="High"/></td>
		        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Medium"/></td>
		        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Low" checked="checked"/></td>
        			 								<%
        			 							}
        			 						%>
        			 					</tr>        			 					
        			 				</table> 
        			 				<table border="1" width="100%">
        			 					<tr>
        			 						<td>10.6 ሌሎች ካሉ</td>
        			 						<td colspan="3">        			 							
        			 							<textarea style="width:100%" class="tinymce" id="textareaothersproblemsandsolutions" name="textareaothersproblemsandsolutions" rows="10"><%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getOthers() : "---") %></textarea>
        			 						</td>
        			 					</tr>
        			 				</table>       			 				
        			 			</td>
        			 		</tr>
        			 		<tr>
        			 			<td left>
        			 				<%
        			 					Account acnt = (Account)session.getAttribute("account");
        			 					User usr = User.getUser(acnt.getUserId());
        			 					Signature signature = Signature.getSignatureForThisUser(usr.getId());	
        			 					if(signature != null){
        			 				%>
        			 				Signature / ፊርማ : <img src="showsignatureofthisuser.jsp?signatureId=<%=signature.getId() %>" width="90" height="50"/>
        			 				<%
        			 					}
        			 				%>
        			 			</td>
        			 		</tr>
       			 		<tr>	 							
 							<td align="right">
 								<input type="submit" value="የሪፖርት ግብዓት ዳታ አድስ" class="btn btn-blue"/>
 								<input type="reset" value="ወደ ቀድሞ ይዘት መልስ" class="btn btn-blue"/>
 							</td>
 						</tr>
	        			 	</table>	 	
        			       </form><!-- form edit ends here -->
	            	     
	            	     </div>	            	              
	            	</div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <%@include file="footer.jsp" %>
    </div>
    <script type="text/javascript">
     $(document).ready(function () { 
    	 	 var typingLang = <%=typingLang%>
    	 	 if(typingLang !== 'Amharic')
         	setupTinyMCE();
         
                
         
         $('textarea').keypress(function(e){
        	 	var typingLang = <%=typingLang%>
        	 	if(typingLang === 'Amharic'){
        	 		return handleAmharicNetscape(e,this);
        	 	}
         });
         
         
         
     });//end document.ready function...
 </script>
</body>
</html>
