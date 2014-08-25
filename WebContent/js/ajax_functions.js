
function showNewCaseRegistrationFormByApplicant(){
	//alert("hi there");
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("applicantRegistrationDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewcaseregistrationformbyapplicant.jsp", true);
	xmlhttp.send();
}

function showViewCaseStatusCaseNumberEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("applicantRegistrationDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showviewcasestatuscasenumberentryform.jsp", true);
	xmlhttp.send();
}

function showTheCaseHistoryOfThisCaseNumberForApplicant(caseNumber){
	//alert(caseNumber);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("caseStatusDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showthecasehistoryofthiscasenumberforapplicant.jsp?caseNumber="+caseNumber, true);
	xmlhttp.send();
}

function saveApplicantDataAndContinueToCaseRegistration(applicantFullName,disabilityInformation,
		ageCategory,sex,jobStatus,applicantKilil,applicantZone,applicantKifleKetema,applicantWoreda,
		applicantKebele,applicantHousePhone,applicantOfficePhone,applicantMobilePhone,applicantFax,
		applicantEmail,emergencyContactFullName,emergencyContactKilil,emergencyContactZone,
		emergencyContactKifleKetema,emergencyContactWoreda,emergencyContactKebele,emergencyContactHousePhone,
		emergencyContactOfficePhone,emergencyContactMobilePhone,emergencyContactFax,emergencyContactEmail){
	if(applicantFullName == ""){
		document.getElementById("applicantFullNameErrorDiv").innerHTML = "<div class='message error'>Please enter applicant full name/የአመልካች ሙሉ ሥም አስገባ!</div>";
		document.getElementById("txtfullname").style.borderColor="red";
		document.getElementById("txtfullname").focus();
		return false;
	}else if(disabilityInformation == ""){
		document.getElementById("applicantFullNameErrorDiv").innerHTML = "";
		document.getElementById("disabilityInformationErrorDiv").innerHTML = "<div class='message error'>Please enter applicant disability information/የአካል ጉዳት መረጃ አልተገለፀም!</div>";
		document.getElementById("txtfullname").style.borderColor="green";
		document.getElementById("textareadisabilityinfo").style.borderColor="red";
		document.getElementById("textareadisabilityinfo").focus();
		return false;
	}else if(ageCategory == ""){
		document.getElementById("disabilityInformationErrorDiv").innerHTML = "";
		document.getElementById("ageCategoryErrorDiv").innerHTML = "<div class='message error'>Please enter applicant age category/የአመልካች ዕድሜ እርከን አልተገለፀም!</div>";
		document.getElementById("textareadisabilityinfo").style.borderColor="green";
		document.getElementById("txtagecategory").style.borderColor="red";
		document.getElementById("txtagecategory").focus();
		return false;
	}else if(sex == ""){
		document.getElementById("ageCategoryErrorDiv").innerHTML = "";
		document.getElementById("sexErrorDiv").innerHTML = "<div class='message error'>Please enter applicant sex/የአመልካች ፆታ ይምረጡ!</div>";
		document.getElementById("txtagecategory").style.borderColor="green";
		document.getElementById("slctsex").style.borderColor="red";
		document.getElementById("slctsex").focus();
		return false;
	}else if(jobStatus == ""){
		document.getElementById("sexErrorDiv").innerHTML = "";
		document.getElementById("jobStatusErrorDiv").innerHTML = "<div class='message error'>Please enter applicant job status/የአመልካች የሥራ ሁኔታ አልተጠቀሰም!</div>";
		document.getElementById("slctsex").style.borderColor="green";
		document.getElementById("textareajobstatus").style.borderColor="red";
		document.getElementById("textareajobstatus").focus();
		return false;
	}else if(applicantKilil == ""){
		document.getElementById("jobStatusErrorDiv").innerHTML = "";
		document.getElementById("applicantKililErrorDiv").innerHTML = "<div class='message error'>Please enter applicant kilil/የአመልካች ክልል አልተገለፀም!</div>";
		document.getElementById("textareajobstatus").style.borderColor="green";
		document.getElementById("slctkilil").style.borderColor="red";
		document.getElementById("slctkilil").focus();
		return false;
	}else if(applicantZone == ""){
		document.getElementById("applicantKililErrorDiv").innerHTML = "";
		document.getElementById("applicantZoneErrorDiv").innerHTML = "<div class='message error'>Please enter applicant zone/የአመልካች ዞን አልተገለፀም!</div>";
		document.getElementById("slctkilil").style.borderColor="green";
		document.getElementById("txtapplicantzone").style.borderColor="red";
		document.getElementById("txtapplicantzone").focus();
		return false;
	}else if(applicantKifleKetema == ""){
		document.getElementById("applicantZoneErrorDiv").innerHTML = "";
		document.getElementById("applicantKifleKetemaErrorDiv").innerHTML = "<div class='message error'>Please select applicant kifle ketema/የአመልካች ክፍለ ከተማ ይምረጡ!</div>";
		document.getElementById("txtapplicantzone").style.borderColor="green";
		document.getElementById("slctkifleketema").style.borderColor="red";
		document.getElementById("slctkifleketema").focus();
		return false;
	}else if(applicantWoreda == ""){
		document.getElementById("applicantKifleKetemaErrorDiv").innerHTML = "";
		document.getElementById("applicantWoredaErrorDiv").innerHTML = "<div class='message error'>Please enter applicant woreda/የአመልካች ወረዳ አልተጠቀሰም!</div>";
		document.getElementById("slctkifleketema").style.borderColor="green";
		document.getElementById("txtworeda").style.borderColor="red";
		document.getElementById("txtworeda").focus();
		return false;
	}else if(applicantKebele == ""){
		document.getElementById("applicantWoredaErrorDiv").innerHTML = "";
		document.getElementById("applicantKebeleErrorDiv").innerHTML = "<div class='message error'>Please enter applicant kebele/የአመልካች ቀበሌ አልተገለፀም!</div>";
		document.getElementById("txtworeda").style.borderColor="green";
		document.getElementById("txtkebele").style.borderColor="red";
		document.getElementById("txtkebele").focus();
		return false;
	}else if(applicantHousePhone == ""){
		document.getElementById("applicantKebeleErrorDiv").innerHTML = "";
		document.getElementById("applicantHousePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter applicant house phone/የአመልካች የቤት ስልክ ቁጥር አልተገለፀም!</div>";
		document.getElementById("txtkebele").style.borderColor="green";
		document.getElementById("txthousephone").style.borderColor="red";
		document.getElementById("txthousephone").focus();
		return false;
	}else if(applicantOfficePhone == ""){
		document.getElementById("applicantHousePhoneErrorDiv").innerHTML = "";
		document.getElementById("applicantOfficePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter applicant office phone/የአመልካች የቢሮ ስልክ ቁጥር አልተገለፀም!</div>";
		document.getElementById("txthousephone").style.borderColor="green";
		document.getElementById("txtofficephone").style.borderColor="red";
		document.getElementById("txtofficephone").focus();
		return false;
	}else if(applicantMobilePhone == ""){
		document.getElementById("applicantOfficePhoneErrorDiv").innerHTML = "";
		document.getElementById("applicantMobilePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter applicant mobile phone/የአመልካች የሞባይል ስልክ ቁጥር አልተገለፀም!</div>";
		document.getElementById("txtofficephone").style.borderColor="green";
		document.getElementById("txtmobilephone").style.borderColor="red";
		document.getElementById("txtmobilephone").focus();
		return false;
	}else if(applicantFax == ""){
		document.getElementById("applicantMobilePhoneErrorDiv").innerHTML = "";
		document.getElementById("applicantFaxErrorDiv").innerHTML = "<div class='message error'>Please enter applicant fax/የአመልካች ፋክስ ቁጥር አልተገለፀም!</div>";
		document.getElementById("txtmobilephone").style.borderColor="green";
		document.getElementById("txtfax").style.borderColor="red";
		document.getElementById("txtfax").focus();
		return false;
	}else if(applicantEmail == ""){
		document.getElementById("applicantFaxErrorDiv").innerHTML = "";
		document.getElementById("applicantEmailErrorDiv").innerHTML = "<div class='message error'>Please enter applicant email/የአመልካች ኢሜይል አልተገለፀም!</div>";
		document.getElementById("txtfax").style.borderColor="green";
		document.getElementById("txtemail").style.borderColor="red";
		document.getElementById("txtemail").focus();
		return false;
	}else if(emergencyContactFullName == ""){
		document.getElementById("applicantEmailErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactFullNameErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact full name/የአደጋ ግዜ ተጠሪ ሙሉ ሥም አልተጠቀሰም!</div>";
		document.getElementById("txtemail").style.borderColor="green";
		document.getElementById("txtemergencycontactfullname").style.borderColor="red";
		document.getElementById("txtemergencycontactfullname").focus();
		return false;
	}else if(emergencyContactKilil == ""){
		document.getElementById("emergencyContactFullNameErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactKililErrorDiv").innerHTML = "<div class='message error'>Please select emergency contact kilil/የአደጋ ግዜ ተጠሪ ክልል ይምረጡ!</div>";
		document.getElementById("txtemergencycontactfullname").style.borderColor="green";
		document.getElementById("slctemergencycontactkilil").style.borderColor="red";
		document.getElementById("slctemergencycontactkilil").focus();
		return false;
	}else if(emergencyContactZone == ""){
		document.getElementById("emergencyContactKililErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactZoneErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact zone/የአደጋ ግዜ ተጠሪ ዞን አልተገለፀም!</div>";
		document.getElementById("slctemergencycontactkilil").style.borderColor="green";
		document.getElementById("txtemergencycontactzone").style.borderColor="red";
		document.getElementById("txtemergencycontactzone").focus();
		return false;
	}else if(emergencyContactKifleKetema == ""){
		document.getElementById("emergencyContactZoneErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactKifleKetemaErrorDiv").innerHTML = "<div class='message error'>Please select emergency contact kifle ketema/የአደጋ ግዜ ተጠሪ ክፍለ ከተማ ይምረጡ!</div>";
		document.getElementById("txtemergencycontactzone").style.borderColor="green";
		document.getElementById("slctemergencycontactkifleketema").style.borderColor="red";
		document.getElementById("slctemergencycontactkifleketema").focus();
		return false;
	}else if(emergencyContactWoreda == ""){
		document.getElementById("emergencyContactKifleKetemaErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactWoredaErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact woreda/የአደጋ ግዜ ተጠሪ ወረዳ አልተገለፀም!</div>";
		document.getElementById("slctemergencycontactkifleketema").style.borderColor="green";
		document.getElementById("slctemergencycontactworeda").style.borderColor="red";
		document.getElementById("slctemergencycontactworeda").focus();
		return false;
	}else if(emergencyContactKebele == ""){
		document.getElementById("emergencyContactWoredaErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactKebeleErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact kebele/የአደጋ ግዜ ተጠሪ ቀበሌ ያስገቡ!</div>";
		document.getElementById("slctemergencycontactworeda").style.borderColor="green";
		document.getElementById("txtemergencycontactkebele").style.borderColor="red";
		document.getElementById("txtemergencycontactkebele").focus();
		return false;
	}else if(emergencyContactHousePhone == ""){
		document.getElementById("emergencyContactKebeleErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactHousePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact house phone/የአደጋ ግዜ ተጠሪ የቤት ስልክ ቁጥር ያስገቡ!</div>";
		document.getElementById("txtemergencycontactkebele").style.borderColor="green";
		document.getElementById("txtemergencycontacthousephone").style.borderColor="red";
		document.getElementById("txtemergencycontacthousephone").focus();
		return false;
	}else if(emergencyContactOfficePhone == ""){
		document.getElementById("emergencyContactHousePhoneErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactOfficePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact office phone/የአደጋ ግዜ ተጠሪ የቢሮ ስልክ ቁጥር ያስገቡ!</div>";
		document.getElementById("txtemergencycontacthousephone").style.borderColor="green";
		document.getElementById("txtemergencycontactofficephone").style.borderColor="red";
		document.getElementById("txtemergencycontactofficephone").focus();
		return false;
	}else if(emergencyContactMobilePhone == ""){
		document.getElementById("emergencyContactOfficePhoneErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactMobilePhoneErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact mobile phone/የአደጋ ግዜ ተጠሪ የሞባይል ቁጥር ያስገቡ!</div>";
		document.getElementById("txtemergencycontactofficephone").style.borderColor="green";
		document.getElementById("txtemergencycontactmobilephone").style.borderColor="red";
		document.getElementById("txtemergencycontactmobilephone").focus();
		return false;
	}else if(emergencyContactFax == ""){
		document.getElementById("emergencyContactMobilePhoneErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactFaxErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact fax/የአደጋ ግዜ ተጠሪ የፋክስ ቁጥር ያስገቡ!</div>";
		document.getElementById("txtemergencycontactmobilephone").style.borderColor="green";
		document.getElementById("txtemergencycontactfax").style.borderColor="red";
		document.getElementById("txtemergencycontactfax").focus();
		return false;
	}else if(emergencyContactEmail == ""){
		document.getElementById("emergencyContactFaxErrorDiv").innerHTML = "";
		document.getElementById("emergencyContactEmailErrorDiv").innerHTML = "<div class='message error'>Please enter emergency contact email/የአደጋ ግዜ ተጠሪ ኢሜይል ያስገቡ!</div>";
		document.getElementById("txtemergencycontactfax").style.borderColor="green";
		document.getElementById("txtemergencycontactemail").style.borderColor="red";
		document.getElementById("txtemergencycontactemail").focus();
		return false;
	}else{
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("applicantRegistrationDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "saveapplicantdataandcontinuetocaseregistration.jsp?applicantFullName="+applicantFullName+
				"&disabilityInformation="+disabilityInformation+"&ageCategory="+ageCategory+
				"&sex="+sex+"&jobStatus="+jobStatus+"&applicantKilil="+applicantKilil+"&applicantZone="+
				applicantZone+"&applicantKifleKetema="+applicantKifleKetema+"&applicantWoreda="+applicantWoreda+
				"&applicantKebele="+applicantKebele+"&applicantHousePhone="+applicantHousePhone+"&applicantOfficePhone="+
				applicantOfficePhone+"&applicantMobilePhone="+applicantMobilePhone+"&applicantFax="+applicantFax+"&applicantEmail="+applicantEmail+
				"&emergencyContactFullName="+emergencyContactFullName+"&emergencyContactKilil="+
				emergencyContactKilil+"&emergencyContactZone="+emergencyContactZone+"&emergencyContactKifleKetema="+
				emergencyContactKifleKetema+"&emergencyContactWoreda="+emergencyContactWoreda+"&emergencyContactKebele="+
				emergencyContactKebele+"&emergencyContactHousePhone="+emergencyContactHousePhone+"&emergencyContactOfficePhone="+
				emergencyContactOfficePhone+"&emergencyContactMobilePhone="+emergencyContactMobilePhone+
				"&emergencyContactFax="+emergencyContactFax+"&emergencyContactEmail="+emergencyContactEmail, true);
		xmlhttp.send();
		//return true;
	}
}

function saveCaseByApplicant(applicantId,methodOfApplication,caseCategoryId,
		caseStatusId,evidenceId,appliedBy,decisionGiven,casePriority,caseTypeId,rejectionReason,
		acceptanceReason,pointsToAnalize){
	alert(applicantId+":"+methodOfApplication+":"+caseCategoryId+":"+
			caseStatusId+":"+evidenceId+":"+appliedBy+":"+decisionGiven+":"+casePriority+":"+caseTypeId+":"+rejectionReason+":"+
			acceptanceReason+":"+pointsToAnalize);
	if(methodOfApplication == ""){		
		document.getElementById("methodOfApplicationErrorDiv").innerHTML = "<div class='message error'>Please enter the method of application/አቤቱታው የቀረበበት መንገድ አልተገለፀም!</div>";		
		document.getElementById("slctmethodofapplication").style.borderColor="red";
		document.getElementById("slctmethodofapplication").focus();
		return false;
	}else if(caseCategoryId == ""){
		document.getElementById("methodOfApplicationErrorDiv").innerHTML = "";
		document.getElementById("caseCategoryErrorDiv").innerHTML = "<div class='message error'>Please select the case category/የአቤቱታውን ምድብ ይምረጡ!</div>";
		document.getElementById("slctmethodofapplication").style.borderColor="green";
		document.getElementById("slctcasecategory").style.borderColor="red";
		document.getElementById("slctcasecategory").focus();
		return false;
	}else if(caseStatusId == ""){
		document.getElementById("caseCategoryErrorDiv").innerHTML = "";
		document.getElementById("caseStatusErrorDiv").innerHTML = "<div class='message error'>Please select the case status/የአቤቱታውን ሁኔታ ይምረጡ!</div>";
		document.getElementById("slctcasecategory").style.borderColor="green";
		document.getElementById("slctcasestatus").style.borderColor="red";
		document.getElementById("slctcasestatus").focus();
		return false;
	}else if(evidenceId == ""){
		document.getElementById("caseStatusErrorDiv").innerHTML = "";
		document.getElementById("evidenceErrorDiv").innerHTML = "<div class='message error'>Please select evidence/ፍንጭ ይምረጡ!</div>";
		document.getElementById("slctcasestatus").style.borderColor="green";
		document.getElementById("slctevidence").style.borderColor="red";
		document.getElementById("slctevidence").focus();
		return false;
	}else if(appliedBy == ""){
		document.getElementById("evidenceErrorDiv").innerHTML = "";
		document.getElementById("appliedByErrorDiv").innerHTML = "<div class='message error'>Please select applicant/አመልካቹን ይምረጡ!</div>";
		document.getElementById("slctevidence").style.borderColor="green";
		document.getElementById("slctappliedby").style.borderColor="red";
		document.getElementById("slctappliedby").focus();
		return false;
	}else if(decisionGiven == ""){
		document.getElementById("appliedByErrorDiv").innerHTML = "";
		document.getElementById("decisionGivenErrorDiv").innerHTML = "<div class='message error'>Please enter decision given/የተላለፊ ውሳኔ አልተገለፀም!</div>";
		document.getElementById("slctappliedby").style.borderColor="green";
		document.getElementById("textareadecisiongiven").style.borderColor="red";
		document.getElementById("textareadecisiongiven").focus();
		return false;
	}else if(casePriority == ""){
		document.getElementById("decisionGivenErrorDiv").innerHTML = "";
		document.getElementById("casePriorityErrorDiv").innerHTML = "<div class='message error'>Please select case priority/የአቤቱታውን አጣዳፊነት ይምረጡ!</div>";
		document.getElementById("textareadecisiongiven").style.borderColor="green";
		document.getElementById("slctcasepriority").style.borderColor="red";
		document.getElementById("slctcasepriority").focus();
		return false;
	}else if(caseTypeId == ""){
		document.getElementById("casePriorityErrorDiv").innerHTML = "";
		document.getElementById("caseTypeErrorDiv").innerHTML = "<div class='message error'>Please select case type/የአቤቱታውን ዓይነት ይምረጡ!</div>";
		document.getElementById("slctcasepriority").style.borderColor="green";
		document.getElementById("slctcasetype").style.borderColor="red";
		document.getElementById("slctcasetype").focus();
		return false;
	}else if(rejectionReason == ""){
		document.getElementById("caseTypeErrorDiv").innerHTML = "";
		document.getElementById("rejectionReasonErrorDiv").innerHTML = "<div class='message error'>Please enter rejection reason/አቤቱታው ተቀባይነት ያላገኝበትን ምክንያት ያስገቡ!</div>";
		document.getElementById("slctcasetype").style.borderColor="green";
		document.getElementById("textarearejectionreason").style.borderColor="red";
		document.getElementById("textarearejectionreason").focus();
		return false;
	}else if(acceptanceReason == ""){
		document.getElementById("rejectionReasonErrorDiv").innerHTML = "";
		document.getElementById("acceptanceReasonErrorDiv").innerHTML = "<div class='message error'>Please enter acceptance reason/አቤቱታው ተቀባይነት ያገኝበት ምክንያት ያስገቡ!</div>";
		document.getElementById("textarearejectionreason").style.borderColor="green";
		document.getElementById("textareaacceptancereason").style.borderColor="red";
		document.getElementById("textareaacceptancereason").focus();
		return false;
	}else if(pointsToAnalize == ""){
		document.getElementById("acceptanceReasonErrorDiv").innerHTML = "";
		document.getElementById("pointsToAnalizeErrorDiv").innerHTML = "<div class='message error'>Please enter points to analize/ትኩረት የሚሹ ነጥቦችን ያስገቡ!</div>";
		document.getElementById("textareaacceptancereason").style.borderColor="green";
		document.getElementById("textareapointstoanalize").style.borderColor="red";
		document.getElementById("textareapointstoanalize").focus();
		return false;
	}else{
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("applicantRegistrationDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "savecasebyapplicant.jsp?applicantId="+applicantId+"&methodOfApplication="+methodOfApplication+
				"&caseCategoryId="+caseCategoryId+"&caseStatusId="+caseStatusId+"&evidenceId="+evidenceId+
				"&appliedBy="+appliedBy+"&decisionGiven="+decisionGiven+"&casePriority="+casePriority+"&caseTypeId="+
				caseTypeId+"&rejectionReason="+rejectionReason+"&acceptanceReason="+acceptanceReason+
				"&pointsToAnalize="+pointsToAnalize, true);
		xmlhttp.send();
	}
}


function showAllCasesThisRespondantIsCurrentlyFollowing(respondantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("caseDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasesthisrespondantiscurrentlyfollowing.jsp?respondantId="+respondantId, true);
	xmlhttp.send();
}

function deleteThisReportFormInputId(reportFormInputId){
	if(window.confirm('Are you sure you want to delete this record?')){
		alert(reportFormInputId);
	}
}

function printDiv(divName) {	
	//alert(divName);
    var printContents = document.getElementById(divName).innerHTML;    
    window.document.getElementById(divName).innerHTML = printContents;
    window.print();    
}

