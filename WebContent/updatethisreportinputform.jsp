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
	
		long reportInputFormId = Long.parseLong(request.getParameter("hiddenreportinputformid"));
		//for the basic info about the report
		int publishingInformation = Integer.parseInt(request.getParameter("txtpublishinginformationbasic"));
	 	int organizingRecordOffice = Integer.parseInt(request.getParameter("txtorganizingrecordofficebasic"));
		int providingTrainingToProfessionalsAndHeads = Integer.parseInt(request.getParameter("txttrainingprovisionforheadsandprofessionalsbasic"));
		int establishingSystemToServeInformationRequesters = Integer.parseInt(request.getParameter("txtestablishingsystemtoserveinformationrequestersbasic"));
		String basicInfoOthers = new String(request.getParameter("textareaothersbasic").getBytes("ISO-8859-1"), "UTF-8");
		BasicInfoAboutReport basicInfoAboutReport = BasicInfoAboutReport.getBasicInfoAboutReport(reportInputFormId);
		basicInfoAboutReport.setPublishingInformation(publishingInformation);
		basicInfoAboutReport.setOrganizingRecordOffice(organizingRecordOffice);
		basicInfoAboutReport.setTrainingProvisionsForHeadsAndProfessionals(providingTrainingToProfessionalsAndHeads);
		basicInfoAboutReport.setEstablishingSystemToServeInformationRequesters(establishingSystemToServeInformationRequesters);
		basicInfoAboutReport.setOthers(basicInfoOthers);
		basicInfoAboutReport.setModifiedBy(modifiedBy);
		basicInfoAboutReport.setModificationDate(modificationDate);
		BasicInfoAboutReport.update(basicInfoAboutReport);
		
		//for request to obtain information
		int yearlyInformationRequestToGovBodyAmountMale = Integer.parseInt(request.getParameter("txtyearlyinformationrequestmaleinforequest"));
		int yearlyInformationRequestToGovBodyAmountFemale = Integer.parseInt(request.getParameter("txtyearlyinformationrequestfemaleinforequest"));
		int yearlyInformationRequestToGovBodyAmountBoth = Integer.parseInt(request.getParameter("txtyearlyinformationrequestbothinforequest"));
		int yearlyInformationRequestToGovBodyAmountOrganization = Integer.parseInt(request.getParameter("txtyearlyinformationrequestorganizationinforequest"));
		int numberOfInformationRequestFullyAccepted = Integer.parseInt(request.getParameter("txtfullyacceptedinformationrequestinforequest"));
		int numberOfInformationRequestPartiallyAccepted = Integer.parseInt(request.getParameter("txtpartiallyacceptedinformationrequestinforequest"));
		int numberOfInformationRequestFullyRejected = Integer.parseInt(request.getParameter("txtfullyrejectedinformationrequestinforequest"));
		RequestToObtainInformation requestToObtainInformation = RequestToObtainInformation.getRequestToObtainInformation(reportInputFormId);
		requestToObtainInformation.setYearlyInformationRequestMale(yearlyInformationRequestToGovBodyAmountMale);
		requestToObtainInformation.setYearlyInformationRequestFemale(yearlyInformationRequestToGovBodyAmountFemale);
		requestToObtainInformation.setYearlyInformationRequestBoth(yearlyInformationRequestToGovBodyAmountBoth);
		requestToObtainInformation.setYearlyInformationRequestOrganization(yearlyInformationRequestToGovBodyAmountOrganization);
		requestToObtainInformation.setFullyAcceptedInformationRequest(numberOfInformationRequestFullyAccepted);
		requestToObtainInformation.setPartiallyAcceptedInformationRequest(numberOfInformationRequestPartiallyAccepted);
		requestToObtainInformation.setFullyRejectedInformationRequest(numberOfInformationRequestFullyRejected);
		requestToObtainInformation.setModifiedBy(modifiedBy);
		requestToObtainInformation.setModificationDate(modificationDate);
		RequestToObtainInformation.update(requestToObtainInformation);
		
		//for appeal to organization head
		int numberOfAppealToOrganizationHead = Integer.parseInt(request.getParameter("txtnumberofappealsfororganizationhead"));
		int informationRequestRejectedByPROrganizationHead = Integer.parseInt(request.getParameter("txtpublicrelationrejectedinformationrequestamountorganizationhead"));
		int informationRequestApprovedByPROrganizationHead = Integer.parseInt(request.getParameter("txtpublicrelationapprovedinformationrequestamountorganizationhead"));
		int informationRequestImprovedByPROrganizationHead = Integer.parseInt(request.getParameter("txtpublicrelationenhancedinformationrequestamountorganizationhead"));
		int numberOfDecisionInProgressOrganizationHead = Integer.parseInt(request.getParameter("txtdecisioninprocessamountorganizationhead"));
		AppealToOrganizationHead appealToOrganizationHead = AppealToOrganizationHead.getAppealToOrganizationHead(reportInputFormId);
		appealToOrganizationHead.setNumberOfAppeal(numberOfAppealToOrganizationHead);
		appealToOrganizationHead.setNumberOfRequestRejectedByPR(informationRequestRejectedByPROrganizationHead);
		appealToOrganizationHead.setNumberOfRequestApprovedByPR(informationRequestApprovedByPROrganizationHead);
		appealToOrganizationHead.setNumberOfRequestImprovedByPR(informationRequestImprovedByPROrganizationHead);
		appealToOrganizationHead.setNumberOfDecisionInProgress(numberOfDecisionInProgressOrganizationHead);
		appealToOrganizationHead.setModifiedBy(modifiedBy);
		appealToOrganizationHead.setModificationDate(modificationDate);
		AppealToOrganizationHead.update(appealToOrganizationHead);
		
		//for appeal to main ombudsman office
		int numberOfAppealToMainOmbudsman = Integer.parseInt(request.getParameter("txtadminappealamountmainombudsman"));
		int numberOfDecisionsRejectedByHeadOfMainOmbudsman = Integer.parseInt(request.getParameter("txtorganizationheadrejectedappealamountmainobmbudsman"));
		int numberOfDecisionsApprovedByHeadOfMainOmbudsman = Integer.parseInt(request.getParameter("txtorganizationheadapprovedappealamountmainombudsman"));
		int numberOfDecisionsImprovedByHeadOfMainOmbudsman = Integer.parseInt(request.getParameter("txtorganizationheadenhanceddecisionamountmainobmbudsman"));
		int numberOfDecisionInProgressMainOmbudsman = Integer.parseInt(request.getParameter("txtappealdecisioninprocessamountmainombudsman"));
		AppealToMainOmbudsman appealToMainOmbudsman = AppealToMainOmbudsman.getAppealToMainOmbudsman(reportInputFormId);
		appealToMainOmbudsman.setNumberOfAppeal(numberOfAppealToMainOmbudsman);
		appealToMainOmbudsman.setNumberOfRequestRejectedByHead(numberOfDecisionsRejectedByHeadOfMainOmbudsman);
		appealToMainOmbudsman.setNumberOfRequestApprovedByHead(numberOfDecisionsApprovedByHeadOfMainOmbudsman);
		appealToMainOmbudsman.setNumberOfRequestImprovedByHead(numberOfDecisionsImprovedByHeadOfMainOmbudsman);
		appealToMainOmbudsman.setNumberOfDecisionInProgress(numberOfDecisionInProgressMainOmbudsman);
		appealToMainOmbudsman.setModifiedBy(modifiedBy);
		appealToMainOmbudsman.setModificationDate(modificationDate);
		AppealToMainOmbudsman.update(appealToMainOmbudsman);
		
		//for appeal to court
		int numberOfDecisionsRejectingPreviousVerdictByGovBodyCourt = Integer.parseInt(request.getParameter("txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt"));
		int numberOfDecisionsApprovingPreviousVerdictByGovBodyCourt = Integer.parseInt(request.getParameter("txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt"));
		int numberOfDecisionsImprovingPreviousVerdictByGovBodyCourt = Integer.parseInt(request.getParameter("txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt"));
		int numberOfDecisionsRejectingPreviousVerdictByInformationRequestersCourt = Integer.parseInt(request.getParameter("txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt"));
		int numberOfDecisionsApprovingPreviousVerdictByInformationRequestersCourt = Integer.parseInt(request.getParameter("txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt"));
		int numberOfDecisionsImprovingPreviousVerdictByInformationRequestersCourt = Integer.parseInt(request.getParameter("txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt"));
		AppealToCourt appealToCourt = AppealToCourt.getAppealToCourt(reportInputFormId);
		appealToCourt.setGovBodyNumberOfDecisionRejectingPreviousDecision(numberOfDecisionsRejectingPreviousVerdictByGovBodyCourt);
		appealToCourt.setGovBodyNumberOfDecisionApprovingPreviousDecision(numberOfDecisionsApprovingPreviousVerdictByGovBodyCourt);
		appealToCourt.setGovBodyNumberOfDecisionImprovingPreviousDecision(numberOfDecisionsImprovingPreviousVerdictByGovBodyCourt);
		appealToCourt.setInfoRequesterNumberOfDecisionRejectingPreviousDecision(numberOfDecisionsRejectingPreviousVerdictByInformationRequestersCourt);
		appealToCourt.setInfoRequesterNumberOfDecisionApprovingPreviousDecision(numberOfDecisionsApprovingPreviousVerdictByInformationRequestersCourt);
		appealToCourt.setInfoRequesterNumberOfDecisionImprovingPreviousDecision(numberOfDecisionsImprovingPreviousVerdictByInformationRequestersCourt);
		appealToCourt.setModifiedBy(modifiedBy);
		appealToCourt.setModificationDate(modificationDate);
		AppealToCourt.update(appealToCourt);
		
		//for classified information
		int thirdPartyRelatedPrivateInformationClassifiedInfo = Integer.parseInt(request.getParameter("txtthirdpartyrelatedprivateinformationclassifiedinfo"));
		int thirdPartyRelatedCommercialInformationClassifiedInfo = Integer.parseInt(request.getParameter("txtthirdpartyrelatedcommercialinformationclassifiedinfo"));
		int thirdPartyTrustedInformationClassifiedInfo = Integer.parseInt(request.getParameter("txtthirdpartyrelatedtrustedinformationclassifiedinfo"));
		int privateAndPropertyRelatedInformationClassifiedInfo = Integer.parseInt(request.getParameter("txtprivatesaftyandpropertyrelatedinformationclassifiedinfo"));
		int lawEnforcmentRelatedInformationClassifiedInfo = Integer.parseInt(request.getParameter("txtlawenforcmentandjusticerelatedinformationclassifiedinfo"));
		int protectedInformationDuringCourtProceduresClassifiedInfo = Integer.parseInt(request.getParameter("txtclassifiedinformationduringinvestigationinformationclassifiedinfo"));
		int defenceSecurityAndInternationalRelationClassifiedInfo = Integer.parseInt(request.getParameter("txtdefencesecurityandinternationalrelationinformationclassifiedinfo"));
		int cabinDocumentsClassifiedInfo = Integer.parseInt(request.getParameter("txtcabinedocumentsclassifiedinfo"));
		int countryRelatedClassifiedInfo = Integer.parseInt(request.getParameter("txtcountryrelatedinformationclassifiedinfo"));
		int governmentWorkDocumentsClassifiedInfo = Integer.parseInt(request.getParameter("txtgovernmentworkdocumentsclassifiedinfo"));
		ClassifiedInformationCategory classifiedInformationCategory = ClassifiedInformationCategory.getClassifiedInformationCategory(reportInputFormId);
		classifiedInformationCategory.setThirdPartyRelatedPrivateInformation(thirdPartyRelatedPrivateInformationClassifiedInfo);
		classifiedInformationCategory.setThirdPartyRelatedCommercialInformation(thirdPartyRelatedCommercialInformationClassifiedInfo);
		classifiedInformationCategory.setThirdPartyRelatedTrustedInformation(thirdPartyTrustedInformationClassifiedInfo);
		classifiedInformationCategory.setPrivateSaftyAndPropertyRelatedInformation(privateAndPropertyRelatedInformationClassifiedInfo);
		classifiedInformationCategory.setLawEnforcementAndJusticeRelatedInformation(lawEnforcmentRelatedInformationClassifiedInfo);
		classifiedInformationCategory.setClassifiedInformationDuringInvestigation(protectedInformationDuringCourtProceduresClassifiedInfo);
		classifiedInformationCategory.setDefenseSecurityAndInternationalRelationInformation(defenceSecurityAndInternationalRelationClassifiedInfo);
		classifiedInformationCategory.setCabineDocuments(cabinDocumentsClassifiedInfo);
		classifiedInformationCategory.setCountryRelatedInformation(countryRelatedClassifiedInfo);
		classifiedInformationCategory.setGovernmentWorkDocuments(governmentWorkDocumentsClassifiedInfo);
		classifiedInformationCategory.setModifiedBy(modifiedBy);
		classifiedInformationCategory.setModificationDate(modificationDate);
		ClassifiedInformationCategory.update(classifiedInformationCategory);
		
		//for rejection certificate
		int numberOfInformationIssuedRejectionCertificate = Integer.parseInt(request.getParameter("txtnumberofsecretinformationissuedrejectioncertificate"));
		RejectionCertificate rejectionCertificate = RejectionCertificate.getRejectionCertificate(reportInputFormId);
		rejectionCertificate.setNumberOfSecretInformationGivenRejectionCertificate(numberOfInformationIssuedRejectionCertificate);		
		rejectionCertificate.setModifiedBy(modifiedBy);
		rejectionCertificate.setModificationDate(modificationDate);
		RejectionCertificate.update(rejectionCertificate);
		
		//for services and activities served under the time period of the proclamation
		float informationRequestPercentBetween30Days = Float.parseFloat(request.getParameter("txtinformationrequestwithin30daysinpercent"));
		float numberOfDaysTakenToServeInformationRequestBetween30Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestwithin30days"));
		float informationRequestPercentMorethan30Days = Float.parseFloat(request.getParameter("txtinformationrequestgreaterthan30daysinpercent"));
		float numberOfDaysTakenToServeInformationRequestMorethan30Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestgreaterthan30days"));
		float informationRequestPercentUrgentBetween10Days = Float.parseFloat(request.getParameter("txtinformationservedurgentlywithin10daysinpercent"));
		float numberOfDaysTakenToServeInformationRequestUrgentBetween10Days = Float.parseFloat(request.getParameter("txtnumberofdaystakenforservinginformationrequestwithin10days"));
		ServicePerformedByTheGivenTimeDuration servicePerformedByTheGivenTimeDuration = ServicePerformedByTheGivenTimeDuration.getServicePerformedByTheGivenTimeDuration(reportInputFormId);
		servicePerformedByTheGivenTimeDuration.setNumberOfInformationRequestBetween30Days(informationRequestPercentBetween30Days);
		servicePerformedByTheGivenTimeDuration.setNumberOfDaysRequiredToServeRequestBetween30Days(numberOfDaysTakenToServeInformationRequestBetween30Days);
		servicePerformedByTheGivenTimeDuration.setNumberOfInformationRequestTookMoreThan30Days(informationRequestPercentMorethan30Days);
		servicePerformedByTheGivenTimeDuration.setNumberOfDaysRequiredToServeRequestTookMoreThan30Days(numberOfDaysTakenToServeInformationRequestMorethan30Days);
		servicePerformedByTheGivenTimeDuration.setNumberOfDaysRequiredToServeUrgentRequestBetween10Days(informationRequestPercentUrgentBetween10Days);
		servicePerformedByTheGivenTimeDuration.setNumberOfDaysRequiredToServeUrgentRequestBetween10Days(numberOfDaysTakenToServeInformationRequestUrgentBetween10Days);
		servicePerformedByTheGivenTimeDuration.setModifiedBy(modifiedBy);
		servicePerformedByTheGivenTimeDuration.setModificationDate(modificationDate);
		ServicePerformedByTheGivenTimeDuration.update(servicePerformedByTheGivenTimeDuration);
				
		//information right and admin implementation....
		float costEncuredToServeInformationRequest = Float.parseFloat(request.getParameter("txtcostofservinginformationrequest"));
		float costEncuredToPublishInformation = Float.parseFloat(request.getParameter("txtcostofproducinginformation"));
		float revenuCollectedFromInformationRequestersToCoverAdminCost = Float.parseFloat(request.getParameter("txtcostcollectedfrominformationrequesterstocoveradmincost"));
		int numberOfInformationRequestsServedFreeOfCost = Integer.parseInt(request.getParameter("txtinformationrequestservedfreeofcost"));
		InformationServiceAdminCost informationServiceAdminCost = InformationServiceAdminCost.getInformationServiceAdminCost(reportInputFormId);
		informationServiceAdminCost.setCostOfServingInformationRequest(costEncuredToServeInformationRequest);
		informationServiceAdminCost.setCostOfPublishingInformation(costEncuredToPublishInformation);
		informationServiceAdminCost.setRevenueCollectedFromUsersCoverAdminCost(revenuCollectedFromInformationRequestersToCoverAdminCost);
		informationServiceAdminCost.setNumberOfInformationRequestServedFreeOfCharge(numberOfInformationRequestsServedFreeOfCost);
		informationServiceAdminCost.setModifiedBy(modifiedBy);
		informationServiceAdminCost.setModificationDate(modificationDate);
		InformationServiceAdminCost.update(informationServiceAdminCost);
		
		//other issues the report must contain
		int numberOfTrainingsGivenToHeadsAndProfessionalsMale = Integer.parseInt(request.getParameter("txtnumberoftrainingsgiventomaleheadsandprofessionals"));
		int numberOfTrainingsGivenToHeadsAndProfessionalsFemale = Integer.parseInt(request.getParameter("txtnumberoftraningsgiventofemaleheadsandprofessionals"));
		String techniquesDesignedAndUsedForFastResponseToInformationRequest = new String(request.getParameter("textareatechniqueforfastresponse").getBytes("ISO-8859-1"), "UTF-8");
		String experienceRegardingInformationTechnologyUtilization = new String(request.getParameter("textareaitexperence").getBytes("ISO-8859-1"), "UTF-8");
		OtherIssuesReportMustContain otherIssuesReportMustContain = OtherIssuesReportMustContain.getOtherIssuesReportMustContain(reportInputFormId);
		otherIssuesReportMustContain.setNumberOfTrainingsGivenToMaleHeadAndProfessionals(numberOfTrainingsGivenToHeadsAndProfessionalsMale);
		otherIssuesReportMustContain.setNumberOfTrainingsGivenToFemaleHeadAndProfessionals(numberOfTrainingsGivenToHeadsAndProfessionalsFemale);
		otherIssuesReportMustContain.setTechniqueForFastResponse(techniquesDesignedAndUsedForFastResponseToInformationRequest);
		otherIssuesReportMustContain.setItExperience(experienceRegardingInformationTechnologyUtilization);
		otherIssuesReportMustContain.setModifiedBy(modifiedBy);
		otherIssuesReportMustContain.setModificationDate(modificationDate);
		OtherIssuesReportMustContain.update(otherIssuesReportMustContain);
		
		//publishing information...for paper
		int numberOfPublicationsInAYear = Integer.parseInt(request.getParameter("txtnumberofpublicationperyear"));
		PublishingInformation publishingInformationObj = PublishingInformation.getPublishingInformation(reportInputFormId);
		publishingInformationObj.setYearlyNumberOfPublication(numberOfPublicationsInAYear);
		publishingInformationObj.setModifiedBy(modifiedBy);
		publishingInformationObj.setModificationDate(modificationDate);
		PublishingInformation.update(publishingInformationObj);
		
		//...for paper publications		
		int numberOfBrouchurePublications = Integer.parseInt(request.getParameter("txtbrochureamount"));
		int numberOfMagazinePublications = Integer.parseInt(request.getParameter("txtmagazineamount"));
		int numberOfPamphletPublications = Integer.parseInt(request.getParameter("txtpamphletamount"));
		int numberOfNewsPaperPublications = Integer.parseInt(request.getParameter("txtnewspaperamount"));
		int numberOfOtherPaperPublications = Integer.parseInt(request.getParameter("txtotherspaperamount"));
		float brochureAmountCostupdate = Float.parseFloat(request.getParameter("txtbrochureamountCost"));
		float magazineAmountCostupdate = Float.parseFloat(request.getParameter("txtmagazineamountCost"));
		float pamphletAmountCostupdate = Float.parseFloat(request.getParameter("txtpamphletamountCost"));
		float newsPaperAmountCostupdate = Float.parseFloat(request.getParameter("txtnewspaperamountCost"));
		float othersPaperCostupdate = Float.parseFloat(request.getParameter("txtotherspaperamountCost"));
		PaperPublication paperPublication = PaperPublication.getPaperPublication(reportInputFormId);
		paperPublication.setBrochureAmount(numberOfBrouchurePublications);
		paperPublication.setMagazineAmount(numberOfMagazinePublications);
		paperPublication.setPamphletAmount(numberOfPamphletPublications);
		paperPublication.setNewsPaperAmount(numberOfNewsPaperPublications);
		paperPublication.setOthersAmount(numberOfOtherPaperPublications);
		paperPublication.setBrochureAmountCost(brochureAmountCostupdate);
		paperPublication.setMagazineAmountCost(magazineAmountCostupdate);
		paperPublication.setPamphletAmountCost(pamphletAmountCostupdate);
		paperPublication.setNewsPaperAmountCost(newsPaperAmountCostupdate);
		paperPublication.setOthersAmountCost(othersPaperCostupdate);
		paperPublication.setModifiedBy(modifiedBy);
		paperPublication.setModificationDate(modificationDate);
		PaperPublication.update(paperPublication);
		
		//...for electronic publications
		int numberOfCDPublications = Integer.parseInt(request.getParameter("txtcdamount"));
		int numberOfDVDPublications = Integer.parseInt(request.getParameter("txtdvdamount"));
		int numberOfFloppyPublications = Integer.parseInt(request.getParameter("txtfloppyamount"));
		int numberOfWWWPublications = Integer.parseInt(request.getParameter("txtwebamount"));
		int numberOfSocialMediaPublications = Integer.parseInt(request.getParameter("txtsocialmediaamount"));
		int numberOfOtherElectronicPublications = Integer.parseInt(request.getParameter("txtotherselectionelectronicamount"));
		ElectronicPublication electronicPublication = ElectronicPublication.getElectronicPublication(reportInputFormId);
		electronicPublication.setCdAmount(numberOfCDPublications);
		electronicPublication.setDvdAmount(numberOfDVDPublications);
		electronicPublication.setFloppyDiskAmount(numberOfFloppyPublications);
		electronicPublication.setWebAmount(numberOfWWWPublications);
		electronicPublication.setSocialMediaAmount(numberOfSocialMediaPublications);
		electronicPublication.setOthers(numberOfOtherElectronicPublications);
		electronicPublication.setModifiedBy(modifiedBy);
		electronicPublication.setModificationDate(modificationDate);
		ElectronicPublication.update(electronicPublication);
		
		//...for broadcast publications
		int numberOfRadioBroadCast = Integer.parseInt(request.getParameter("txtradiobroadcastamount"));
		float radioBroadCastAirUsage = Float.parseFloat(request.getParameter("txtradioairusage"));
		int numberOfTelevisionBroadCast = Integer.parseInt(request.getParameter("txttelevisionbroadcastamount"));
		float televisionBroadCastAirUsage = Float.parseFloat(request.getParameter("txttelevisionairusage"));
		int numberOfOtherBroadCasts = Integer.parseInt(request.getParameter("txtothersbroadcastamount"));
		float otherBraodCastAirUsage = Float.parseFloat(request.getParameter("txtotherbroadcastairusage"));
		BroadCast broadCast = BroadCast.getBroadCast(reportInputFormId);
		broadCast.setRadioAmount(numberOfRadioBroadCast);
		broadCast.setRadioAirUsage(radioBroadCastAirUsage);
		broadCast.setTelevisionAmount(numberOfTelevisionBroadCast);
		broadCast.setTelevisionAirUsage(televisionBroadCastAirUsage);
		broadCast.setOthersAmount(numberOfOtherBroadCasts);
		broadCast.setOthersAirUsage(otherBraodCastAirUsage);
		broadCast.setModifiedBy(modifiedBy);
		broadCast.setModificationDate(modificationDate);
		BroadCast.update(broadCast);
		
		//for publication content
		String _951="---";
		String _952="---";
		String _953="---";
		String _954="---";
		String _955="---";
		String _956="---";
		String _957="---";
		String _958="---";
		String _959="---";	
		if(request.getParameter("chk951") != null)
			_951 = new String(request.getParameter("chk951").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk952") != null)
			_952 = new String(request.getParameter("chk952").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk953") != null)
			_953 = new String(request.getParameter("chk953").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk954") != null)
			_954 = new String(request.getParameter("chk954").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk955") != null)
			_955 = new String(request.getParameter("chk955").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk956") != null)
			_956 = new String(request.getParameter("chk956").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk957") != null)
			_957 = new String(request.getParameter("chk957").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk958") != null)
			_958 = new String(request.getParameter("chk958").getBytes("ISO-8859-1"), "UTF-8");
		if(request.getParameter("chk959") != null)
			_959 = new String(request.getParameter("chk959").getBytes("ISO-8859-1"), "UTF-8");
		
		String publicationContentOthers = new String(request.getParameter("textareaotherspublicationcontent").getBytes("ISO-8859-1"), "UTF-8");
		PublicationContent publicationContent = PublicationContent.getPublicationContent(reportInputFormId);
		publicationContent.set_951(_951);
		publicationContent.set_952(_952);
		publicationContent.set_953(_953);
		publicationContent.set_954(_954);
		publicationContent.set_955(_955);
		publicationContent.set_956(_956);
		publicationContent.set_957(_957);
		publicationContent.set_958(_958);
		publicationContent.set_959(_959);
		publicationContent.setModifiedBy(modifiedBy);
		publicationContent.setModificationDate(modificationDate);
		PublicationContent.update(publicationContent);
		
		//for problems and solutions during implementation
		String rad10_1problem = request.getParameter("rad10_1problem");//lack of attention and support
		String rad10_2problem = request.getParameter("rad10_2problem");//lack of it infrastruction
		String rad10_3problem = request.getParameter("rad10_3problem");//lack of budget and input problem
		String rad10_4problem = request.getParameter("rad10_4problem");//lack of followup and support from concerned body
		String rad10_5problem = request.getParameter("rad10_5problem");//others
		String problemAndSolutionOthers = new String(request.getParameter("textareaothersproblemsandsolutions").getBytes("ISO-8859-1"), "UTF-8");
		ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = ProblemsAndSolutionsImplementation.getProblemsAndSolutionsImplementation(reportInputFormId);
		problemsAndSolutionsImplementation.setLackOfUnderstandingAboutRights(rad10_1problem);
		problemsAndSolutionsImplementation.setLackOfAttentionAndSupportFromHead(rad10_2problem);
		problemsAndSolutionsImplementation.setLackOfITInfrastructure(rad10_3problem);
		problemsAndSolutionsImplementation.setLackOfBudgetAndInputProblem(rad10_4problem);
		problemsAndSolutionsImplementation.setLackOfFollowupAndSupportFromConcernedBody(rad10_5problem);
		problemsAndSolutionsImplementation.setOthers(problemAndSolutionOthers);
		problemsAndSolutionsImplementation.setModifiedBy(modifiedBy);
		problemsAndSolutionsImplementation.setModificationDate(modificationDate);
		ProblemsAndSolutionsImplementation.update(problemsAndSolutionsImplementation);
	%>
	<%@include file="showendofreportinputupdateform.jsp"%>
		
	