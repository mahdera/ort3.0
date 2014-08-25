<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%
	long reportInputFormId = Long.parseLong(request.getParameter("reoprtInputFormId"));		
%>
<div>
	<%
		BasicInfoAboutReport basicInfoAboutReport = BasicInfoAboutReport.getBasicInfoAboutReport(reportInputFormId);
	%>
	<table border="1" width="100%" class="form">
 		<tr style="background:#ccc">
 			<td style="font-size:14pt;float:center;font-weight:bolder">1. ሪፖርቱን የተመለከቱ መሰረታዊ መረጃዎች:</td>
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
 								<%=(basicInfoAboutReport != null ?basicInfoAboutReport.getPublishingInformation() : "---") %> 								
 							</td>
 						</tr>
 						<tr>
 							<td style="font-size:11pt" width="40%">1.2. የሰነድና ማህደር ክፍል ማደራጀት</td>
 							<td>
 								<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getOrganizingRecordOffice() : "---")%> 								
 							</td>
 						</tr>
 						<tr>
 							<td style="font-size:11pt" width="40%">1.3. ለኃላፉዎችና ባለሙያዎች  ስልጠና መስጠት</td>
 							<td>
 								<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getTrainingProvisionsForHeadsAndProfessionals() : "---")%> 								
 							</td>
 						</tr>
 						<tr>
 							<td style="font-size:11pt" width="40%">1.4. የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</td>
 							<td>
 								<%=(basicInfoAboutReport != null ? basicInfoAboutReport.getEstablishingSystemToServeInformationRequesters() : "---") %> 								
 							</td>
 						</tr>
 						<tr>
 							<td style="font-size:11pt" width="40%">1.5. ሌሎች ካሉ</td>        			 							
 						</tr>        			 						
 						<tr>
 							<td colspan="2">
 								<p style="text-align:justify"><%=(basicInfoAboutReport != null ? basicInfoAboutReport.getOthers() : "---")%></p> 							
 							</td>
 						</tr> 						
 				</table>        			 				
 			</td>
 		</tr>
 	</table>
 	<table border="1" width="100%" class="form">
	 		<tr style="background:#ccc">
	 			<td style="font-size:14pt;float:center;font-weight:bolder">2. መረጃ  ለማግኘት የቀረበ ጥያቄን በተመለከተ:</td>
	 			<%
	 				RequestToObtainInformation requestToObtainInformation = RequestToObtainInformation.getRequestToObtainInformation(reportInputFormId);
	 			%>
	 		</tr>
	 		<tr>
	 			<td>
	 				<table border="1" width="100%">
	 						<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.1 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወንድ):</label></td>
	 							<td align="left">
	 							<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestMale() : "---")%>	 								
	 							</td>
 							</tr>
 							<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.2 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ሴት):</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestFemale() : "---")%>	 								
	 							</td>
 							</tr>
 							<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.3 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ወል):</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestBoth() : "---")%>	 								
	 							</td>
 							</tr>
 							<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.4 በዓመቱ ለመንግስት አካሉ የቀረቡ የመረጃ ጥያቄዎች ብዛት - (ድርጅት):</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getYearlyInformationRequestOrganization() : "---") %>	 								
	 							</td>
 							</tr>  
 							<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.4 ሙሉ በሙሉ ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getFullyAcceptedInformationRequest() : "---")%>	 								
	 							</td>
	 						</tr>   
	 						<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.5 በከፊል  ተቀባይነት ያገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getPartiallyAcceptedInformationRequest() : "---")%>	 								
	 							</td>
	 						</tr>  	
	 						<tr>
	 							<td style="font-size:11pt" width="60%"><label>2.6 ሙሉ በሙሉ ተቀባይነት ያላገኙ የመረጃ ጥያቄዎች ብዛት:</label></td>
	 							<td align="left">
	 								<%=(requestToObtainInformation != null ? requestToObtainInformation.getFullyRejectedInformationRequest() : "---")%>	 								
	 							</td>
	 						</tr>	 						
	 				</table>        			 				
	 			</td>
	 		</tr>
	 	</table><!-- up to here --> 
	 	<table border="1" width="100%" class="form">
			 		<tr style="background:#ccc">
			 			<td style="font-size:14pt;float:center;font-weight:bolder">3. የቀረቡ አቤቱታዎች/ቅሬታዎች:</td>
			 			<%
			 				AppealToOrganizationHead appealToOrganizationHead = AppealToOrganizationHead.getAppealToOrganizationHead(reportInputFormId);			 				
			 			%>
			 		</tr>
			 		<tr>
			 			<td>
			 				<fieldset>
			 				<legend>3.1 ለተቋሙ የበላይ አላፊ የቀረቡ አቤቱታዎች</legend>
			 				<table border="1" width="100%">        			 						
			 						<tr>
			 							<td style="font-size:11pt" width="60%"><label>3.1.1 የአቤቱታዎች ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToOrganizationHead != null ? appealToOrganizationHead.getNumberOfAppeal() : "---") %>			 								
			 							</td>
		 							</tr>
		 							<tr>
			 							<td style="font-size:11pt" width="60%"><label>3.1.2 የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToOrganizationHead != null ? appealToOrganizationHead.getNumberOfRequestRejectedByPR() : "---")%>			 								
			 							</td>
		 							</tr>
		 							<tr>
			 							<td style="font-size:11pt" width="60%"><label>3.1.3 የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToOrganizationHead != null ? appealToOrganizationHead.getNumberOfRequestApprovedByPR() : "---")%>			 								
			 							</td>
		 							</tr>
		 							<tr>
			 							<td style="font-size:11pt" width="60%"><label>3.1.4 የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ጥያቄ  ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToOrganizationHead != null ? appealToOrganizationHead.getNumberOfRequestImprovedByPR() : "---")%>			 								
			 							</td>
		 							</tr>  
		 							<tr>
			 							<td style="font-size:11pt" width="60%"><label>3.1.5 በሂደት ላይ ያለ ውሳኔ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToOrganizationHead != null ? appealToOrganizationHead.getNumberOfDecisionInProgress() : "---")%>			 								
			 							</td>
			 						</tr>  
			 					</table> 
			 					</fieldset>
			 					<fieldset>
			 					<legend>3.2. ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች</legend>
			 					<%
			 						AppealToMainOmbudsman appealToMainOmbudsman = AppealToMainOmbudsman.getAppealToMainOmbudsman(reportInputFormId);
			 					%>
			 					<table>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.2.1 የአስተዳደራዊ ይግባኞች  ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfAppeal() : "---")%>			 								
			 							</td>
			 						</tr>  	
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.2.2 የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሻረበት ይግባኝ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestRejectedByHead() : "---") %>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.2.3 የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestApprovedByHead() : "---")%>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.2.4 የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሸሻለበት ይግባኝ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfRequestImprovedByHead() : "---")%>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.2.5 በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToMainOmbudsman != null ? appealToMainOmbudsman.getNumberOfDecisionInProgress() : "---")%>			 								
			 							</td>
			 						</tr>
			 						</table>
			 						</fieldset>     			 								 						
			 						<fieldset>
			 							<legend>3.3. ለፍርድ ቤት የቀረቡ ይግባኞች</legend>
			 							<%
			 								AppealToCourt appealToCourt = AppealToCourt.getAppealToCourt(reportInputFormId);
			 							%>
			 							<table>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.1 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionRejectingPreviousDecision() : "---")%>			 								
			 							</td>
			 						</tr>  	
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.2 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionApprovingPreviousDecision() : "---")%>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.3 በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getGovBodyNumberOfDecisionImprovingPreviousDecision() : "---")%>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.4 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionRejectingPreviousDecision() : "---")%>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.5 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionApprovingPreviousDecision() : "---") %>			 								
			 							</td>
			 						</tr>
			 						<tr>
			 							<td style="font-size:11pt" width="80%"><label>3.3.6 በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
			 							<td align="left">
			 								<%=(appealToCourt != null ? appealToCourt.getInfoRequesterNumberOfDecisionImprovingPreviousDecision() : "---")%>			 								
			 							</td>
			 						</tr>
			 						</table>
			 						</fieldset>        			 				      			 				
			 			</td>
			 		</tr>			 		
		</table><!-- up to here -->  
		<table border="1" width="100%" class="form">
        			 		<tr style="background:#ccc">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">4. በማይገለጹ መረጃዎች ምድብ ውስጥ ናቸው በሚል የመንግስት አካሉ በዓመት ውስጥ እንዳይገለጹ ያደረጋቸው ወይም ለክልከላ መነሻ የሆኑ ህጋዊ ምክነያቶች ምድብና ብዛት፡:</td>
        			 			<%
        			 				ClassifiedInformationCategory classifiedInformationCategory = ClassifiedInformationCategory.getClassifiedInformationCategory(reportInputFormId);
        			 			%>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.1. ሶስተኛ ወገንን የሚመለከቱ የግል መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedPrivateInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.2. የሶስተኛ ወገን የንግድ መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedCommercialInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.3. በዕምነት የተሰጡ የሶስተኛ ወገን መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getThirdPartyRelatedTrustedInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.4. የግለሰቦችና የንብረት ደህንነትን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getPrivateSaftyAndPropertyRelatedInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.5. የሕግ አስከባሪና የፍርድ ምርመራ ሥራዎችን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getLawEnforcementAndJusticeRelatedInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.6. በፍርድ ምርመራ ሂደት እንዳይገለጹ ጥበቃ የሚደረግላቸው መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getClassifiedInformationDuringInvestigation() : "---") %>					 								
					 							</td>
					 						</tr>        
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.7. የመከላከያ፣ ደህነትና  ዓለም አቀፍ ግንኙነት መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getDefenseSecurityAndInternationalRelationInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.8. የካቢኔ ሰነዶች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getCabineDocuments() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.9. የሀገሪቱን የኢኮኖሚ ጥቅሞች፣ የፋይናንስ ደህንነትና የመንግሥት የልማት ድርጅቶችን የንግድ እንቅስቃሴዎችን የሚመለከቱ መረጃዎች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getCountryRelatedInformation() : "---") %>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="80%"><label>4.10. የመንግሥት የሥራ ሰነዶች:</label></td>
					 							<td align="left">
					 								<%=(classifiedInformationCategory != null ? classifiedInformationCategory.getGovernmentWorkDocuments() : "---") %>					 								
					 							</td>
					 						</tr>      			 						
        			 				</table>        			 				
        			 			</td>
        			 		</tr>
        			 	</table>
		<table border="1" width="100%" class="form">
	 		<tr style="background:#ccc">
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
				<%=(rejectionCertificate != null ? rejectionCertificate.getNumberOfSecretInformationGivenRejectionCertificate() : "---")%>				
			</td>
		</tr>        			 						
	 				</table>        			 				
	 			</td>
	 		</tr>
	 	</table> 
	 	<table border="1" width="100%" >
			 		<tr style="background:#ccc">
			 			<td style="font-size:14pt;float:center;font-weight:bolder">6. በአዋጁ በተቀመጠው የጊዜ ገደብ ውስጥ በመስተናገድ ረገድ የተከናወኑ ተግባራት:</td>
			 			<%
			 				ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = ServicePerformedByTheGivenTimeDuration.getServicePerformedByTheGivenTimeDuration(reportInputFormId);			 				
			 			%>
			 		</tr>
			 		<tr>
			 			<td>
			 				<fieldset>
			 				<legend>በ30 የስራ ቀናት  የጊዜ ገደብ ውስጥ የተስተናገዱ </legend>
			 				<table border="1" width="100%">
			 						<tr>
					<td style="font-size:11pt" width="40%"><label>6.1. የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					<td align="left">
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfInformationRequestBetween30Days()/100 : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="40%"><label>6.2. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					<td align="left">
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestBetween30Days() : "---")%>						
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
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestTookMoreThan30Days()/100 : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="40%"><label>6.4. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					<td align="left">
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeRequestTookMoreThan30Days() : "---")%>						
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
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfUrgentInformationRequestBetween10Days()/100 : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="40%"><label>6.6. ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					<td align="left">
						<%=(servicePerformedByTheGivenTimeDuration != null ? servicePerformedByTheGivenTimeDuration.getNumberOfDaysRequiredToServeUrgentRequestBetween10Days() : "---")%>						
					</td>
				</tr>
	  </table>
	  <table border="1" width="100%" class="form">
		 		<tr style="background:#ccc">
		 			<td style="font-size:14pt;float:center;font-weight:bolder">7. የመረጃ መብት ትግበራ አመታዊ አስተዳደራዊ ወጪዎችን በተመለከተ:</td>
		 			<%
		 				InformationServiceAdminCost informationServiceAdminCost = InformationServiceAdminCost.getInformationServiceAdminCost(reportInputFormId);
		 			%>
		 		</tr>
		 		<tr>
		 			<td>
		 				<table border="1" width="100%">
		 						<tr>
					<td style="font-size:11pt" width="60%"><label>7.1. የመረጃ ጥያቄዎችን ለማስተናገድ የወጣ ወጪ:</label></td>
					<td align="left">
						<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getCostOfServingInformationRequest() : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="60%"><label>7.2. መረጃዎችን አትሞ ለማውጣት የወጣ ወጪ:</label></td>
					<td align="left">
						<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getCostOfPublishingInformation() : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="60%"><label>7.3. አስተዳደራዊ ወጪዎችን ለመሸፈን ከመረጃ ጠያቂዎች የተሰበሰበ ክፍያ:</label></td>
					<td align="left">
						<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getRevenueCollectedFromUsersCoverAdminCost() : "---")%>						
					</td>
				</tr>
				<tr>
					<td style="font-size:11pt" width="60%"><label>7.4. ከክፍያ ነጻ የተስተናገዱ የመረጃ ጠያቂዎች ብዛት:</label></td>
					<td align="left">
						<%=(informationServiceAdminCost != null ? informationServiceAdminCost.getNumberOfInformationRequestServedFreeOfCharge() : "---")%>						
					</td>
				</tr>        			 						
			 				</table>        			 				
			 			</td>
		 	</tr>
	  </table>
	  <table border="1" width="100%" class="form">
	 		<tr style="background:#ccc">
	 			<td style="font-size:14pt;float:center;font-weight:bolder">8. ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች:</td>
	 			<%
	 				OtherIssuesReportMustContain otherIssuesReportMustContain = OtherIssuesReportMustContain.getOtherIssuesReportMustContain(reportInputFormId);
	 			%>
	 		</tr>
	 		<tr>
	 			<td>
	 				<table border="1" width="100%">
	 						<tr>
			<td style="font-size:11pt" width="60%"><label>8.1. ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ):</label></td>
			<td align="left">
				<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getNumberOfTrainingsGivenToMaleHeadAndProfessionals() : "---")%>				
			</td>
		</tr>
		<tr>
			<td style="font-size:11pt" width="60%"><label>8.2. ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት):</label></td>
			<td align="left">
				<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getNumberOfTrainingsGivenToFemaleHeadAndProfessionals() : "---")%>				
			</td>
		</tr>
		<tr>
			<td style="font-size:11pt" colspan="2"><label>8.3. ለመረጃ ጥያቄ ፈጣን ምላሽ ለመስጠት የተቀየሱና ሥራ ላይ የዋሉ ስልቶች ካሉ:</label></td>			
		</tr>	
		<tr>
			<td colspan="2">
				<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getItExperience() : "---")%>
			</td>
		</tr>
		<tr>
			<td style="font-size:11pt" colspan="2"><label>8.4. በኢንፎርሜሽን ቴክኖሎጂ በመጠቀም ረገድ ያሉ ተሞክሮዎች ካሉ:</label></td>			
		</tr>	
		<tr>
			<td colspan="2">
				<%=(otherIssuesReportMustContain != null ? otherIssuesReportMustContain.getItExperience() : "---") %>
			</td>
		</tr>			 									 						
	 						
	 				</table>        			 				
	 			</td>
	 		</tr>
	 	</table>
	 	<table border="1" width="100%" class="form">
        			 		<tr style="background:#ccc">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">9. አትሞ ስለማውጣት:</td>
        			 			<%
        			 				PublishingInformation publishingInformation = PublishingInformation.getPublishingInformation(reportInputFormId);
        			 			%>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
					 							<td style="font-size:11pt" width="40%"><label>9.1. በሕትመት መልክ በዓመት ለምን ያህል ጊዜ ታትሞ ወጣ:</label></td>
					 							<td align="left">
					 								<%=(publishingInformation != null ? publishingInformation.getYearlyNumberOfPublication() : "---")%>					 								
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.2. የሕትመቱ ዘርፍ (በወረቀት)</legend>
					 									<%
					 										PaperPublication paperPublication = PaperPublication.getPaperPublication(reportInputFormId);
					 									%>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th align="left">የሕትመቱ ዓይነት</th>
					 											<th align="left">የሕትመቱ ብዛት</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.1. ብሮሸር:</td>
					 											<td align="left">
					 												<%=(paperPublication != null ? paperPublication.getBrochureAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.2. መፅሔት:</td>
					 											<td align="left">					 												
					 												<%=(paperPublication != null ? paperPublication.getMagazineAmount() : "---")%>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.3. ፓምፍሌት:</td>
					 											<td align="left">
					 											<%=(paperPublication != null ? paperPublication.getPamphletAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.4. ጋዜጣ:</td>
					 											<td align="left">
					 												<%=(paperPublication != null ? paperPublication.getNewsPaperAmount() : "---")%>					 																	 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.2.5. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<%=(paperPublication != null ? paperPublication.getOthersAmount() : "---")%>					 												
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
					 									<%
					 										ElectronicPublication electronicPublication = ElectronicPublication.getElectronicPublication(reportInputFormId);
					 									%>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th align="left">የሕትመቱ ዓይነት</th>
					 											<th align="left">የሕትመቱ ብዛት</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.1. ሲዲ:</td>
					 											<td align="left">
					 												<%=(electronicPublication != null ? electronicPublication.getCdAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.2. ዲቪዲ:</td>
					 											<td align="left">
					 												<%=(electronicPublication != null ? electronicPublication.getDvdAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.3. ፍሎፒ:</td>
					 											<td align="left">
					 												<%=(electronicPublication !=  null ? electronicPublication.getFloppyDiskAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.4. ድረ-ገጽ:</td>
					 											<td align="left">
					 												<%=(electronicPublication != null ? electronicPublication.getWebAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.5. የማህበረሰብ ሚዲያ:</td>
					 											<td align="left">
					 												<%=(electronicPublication != null ? electronicPublication.getSocialMediaAmount() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.3.6. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<%=(electronicPublication != null ? electronicPublication.getOthers() : "---")%>					 												
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
					 									<%
					 										BroadCast broadCast = BroadCast.getBroadCast(reportInputFormId);
					 									%>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th align="left">ዓይነት</th>
					 											<th align="left">የሥርጭቱ ብዛት</th>
					 											<th align="left">የወሠደው የአየር ሰዓት ብዛት</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.1. ሬዲዬ:</td>
					 											<td align="left">
					 												<%=(broadCast != null ? broadCast.getRadioAmount() : "---")%>					 												
					 											</td>
					 											<td>
					 												<%=(broadCast != null ? broadCast.getRadioAirUsage() : "---")%>					 												
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.2. ቴሌቪዥን:</td>
					 											<td align="left">
					 												<%=(broadCast != null ? broadCast.getTelevisionAmount() : "---")%>					 												
					 											</td>
					 											<td>
					 												<%=(broadCast != null ? broadCast.getTelevisionAirUsage() : "---")%>					 												
					 											</td>
					 										</tr>					 										
					 										<tr>
					 											<td style="font-size:11pt" width="40%">9.4.5. ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<%=(broadCast != null ? broadCast.getOthersAmount() : "---")%>					 												
					 											</td>
					 											<td>
					 												<%=(broadCast != null ? broadCast.getOthersAirUsage() : "---")%>					 												
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
					 									<%
					 										PublicationContent publicationContent = PublicationContent.getPublicationContent(reportInputFormId);
					 									%>
					 									<table border="1" width="100%">					 										
					 										<tr style="background:#eee">
					 											<td>9.5.1. </td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_951() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.2. </td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_952() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.3. </td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_953() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.4. </td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_954() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.5. </td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_955() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.6.</td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_956() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.7.</td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_957() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.8.</td>					 											
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_958() : "---")%>					 												
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.9.</td>					 																 										
					 											<td align="left">
					 												<%=(publicationContent != null ? publicationContent.get_959() : "---")%>					 												
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
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:#ccc">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">10. በአፈፃፀም ያጋጠሙ ችግሮች እና የመፍትሔ ሃሳቦች:</td>
        			 			<%
        			 				ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = ProblemsAndSolutionsImplementation.getProblemsAndSolutionsImplementation(reportInputFormId);
        			 			%>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">        			 					
        			 					<tr style="background:#eee">
        			 						<td width="40%">10.1 በአዋጁ ስለተደነገጉ መብቶች የግንዛቤ ማነስ:</td>
        			 						<td align="center">
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getLackOfUnderstandingAboutRights() : "---")%>
        			 						</td>
        			 					</tr>
        			 					<tr>
        			 						<td>10.2 ከበላይ ኃላፊ ስለትግበራው ትኩረትና ተገቢዉን ድጋፊ አለማግኘት:</td>
        			 						<td align="center">
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getLackOfAttentionAndSupportFromHead() : "---")%>
        			 						</td>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.3 የመረጃ ስርአት ባለው መንገድ አለመደራጀቱ:</td>
        			 						<td align="center">
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getLackOfITInfrastructure() : "---")%>
        			 						</td>
        			 					</tr>
        			 					<tr>
        			 						<td>10.4 የበጀት እጥረት እና የግብአት ችግሮች:</td>
        			 						<td align="center">
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getLackOfBudgetAndInputProblem() : "---")%>
        			 						</td>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.5 ከሚመለከተው አካል የክትትልና ድጋፍ ማነስ:</td>
        			 						<td align="center">
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getLackOfFollowupAndSupportFromConcernedBody() : "---")%>
        			 						</td>
        			 					</tr>        			 					
        			 				</table> 
        			 				<table border="1" width="100%">
        			 					<tr>
        			 						<td>10.6 ሌሎች ካሉ</td>        			 						
        			 					</tr>
        			 					<tr>
        			 						<td>
        			 							<%=(problemsAndSolutionsImplementation != null ? problemsAndSolutionsImplementation.getOthers() : "---")%>
        			 						</td>
        			 					</tr>
        			 				</table>       			 				
        			 			</td>
        			 		</tr>
        			 		<tr>
        			 			<td align="left">
        			 				<%
        			 					Account acnt = (Account)session.getAttribute("account");
        			 					User usr = User.getUser(acnt.getUserId());
        			 					Signature signature = Signature.getSignatureForThisUser(usr.getId());	
        			 					
        			 				%>
        			 				Signature / ፊርማ : <img src="showsignatureofthisuser.jsp?signatureId=<%=signature.getId() %>" width="90" height="50"/>
        			 			</td>
        			 		</tr>        			 		
        			 	</table>
</div>
