function validateBasicInformationAboutReport(){
	if(document.getElementById('freedomofinformationplan').value == ""){
		alert("Please enter the freedom of information value!");
		document.getElementById('freedomofinformationplan').focus();
		return false;
	}else
		return true;
}

function validateRequestToObtainInformationForm(){
	if(document.getElementById('txtyearlyinformationrequestmale').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtyearlyinformationrequestmale').focus();
		return false;
	}else if(document.getElementById('txtyearlyinformationrequestfemale').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtyearlyinformationrequestfemale').focus();
		return false;
	}else if(document.getElementById('txtfullyacceptedinformationrequest').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtfullyacceptedinformationrequest').focus();
		return false;
	}else if(document.getElementById('txtpartiallyacceptedinformationrequest').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtpartiallyacceptedinformationrequest').focus();
		return false;
	}else if(document.getElementById('txtfullyrejectedinformationrequest').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtfullyrejectedinformationrequest').focus();
		return false;
	}else if(document.getElementById('txtinformationrequesttransferredfromlastyear').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtinformationrequesttransferredfromlastyear').focus();
		return false;
	}else if(document.getElementById('txtappealstoorganizationhead').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtappealstoorganizationhead').focus();
		return false;
	}else if(document.getElementById('txtappealtomainumbudsmanoffice').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtappealtomainumbudsmanoffice').focus();
		return false;
	}else if(document.getElementById('appealresult').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('appealresult').focus();
		return false;
	}else if(document.getElementById('numberofcourtappeal').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('numberofcourtappeal').focus();
		return false;
	}else if(document.getElementById('courtappealresult').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('courtappealresult').focus();
		return false;
	}else{
		return true;
	}
}

function validateClassifiedInformationCategoryForm(){
	if(document.getElementById('txtnumberofclassifiedinformation').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofclassifiedinformation').focus();
		return false;
	}else if(document.getElementById('classifiedinformation').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('classifiedinformation').focus();
		return false;
	}else{
		return true;
	}
}

function validateAppealToGovBodyForm(){
	if(document.getElementById('txtnumberofappeal').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofappeal').focus();
		return false;
	}else if(document.getElementById('txtnumberofresolvedappeals').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofresolvedappeals').focus();
		return false;
	}else if(document.getElementById('txtnumberoffullyacceptedappealsbygovtorganization').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberoffullyacceptedappealsbygovtorganization').focus();
		return false;
	}else if(document.getElementById('txtnumberofpartiallyacceptedappealsbygovtorganization').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofpartiallyacceptedappealsbygovtorganization').focus();
		return false;
	}else if(document.getElementById('txtnumberoffullyrejectedappealsbygovtorganization').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberoffullyrejectedappealsbygovtorganization').focus();
		return false;
	}else{
		return true;
	}
}

function validateServicePerformedByTheGivenTimeDurationForm(){
	if(document.getElementById('txt30percentofinformationrequestservice').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txt30percentofinformationrequestservice').focus();
		return false;
	}else if(document.getElementById('txtnumberofdaysrequired').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofdaysrequired').focus();
		return false;
	}else if(document.getElementById('txtnumberofinformationrequesttakingmorethan30days').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofinformationrequesttakingmorethan30days').focus();
		return false;
	}else if(document.getElementById('txturgentreplyin10dayspercent').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txturgentreplyin10dayspercent').focus();
		return false;
	}else if(document.getElementById('txtnumberofdaysrequiredtoserveurgentreply').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofdaysrequiredtoserveurgentreply').focus();
		return false;
	}else{
		return true;
	}
}

function validateInformationImplementationAdminCostForm(){
	if(document.getElementById('txtcostofservinginformationrequest').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtcostofservinginformationrequest').focus();
		return false;
	}else if(document.getElementById('txtcostofpublishinginformation').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtcostofpublishinginformation').focus();
		return false;
	}else if(document.getElementById('txtrevenuecollectedtocoveradmincost').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtrevenuecollectedtocoveradmincost').focus();
		return false;
	}else if(document.getElementById('txtnumberofinformationrequestfreeofcharge').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofinformationrequestfreeofcharge').focus();
		return false;
	}else{
		return true;
	}
}

function validateOtherIssuesReportMustIncludeForm(){
	if(document.getElementById('txtnumberoftrainingsforprofessional').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberoftrainingsforprofessional').focus();
		return false;
	}else if(document.getElementById('fastresponsetechniques').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('fastresponsetechniques').focus();
		return false;
	}else if(document.getElementById('ictutilizationexperience').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('ictutilizationexperience').focus();
		return false;
	}else{
		return true;
	}
}

function validatePublicationInformationForm(){
	if(document.getElementById('txtnumberofpublication').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtnumberofpublication').focus();
		return false;
	}else if(document.getElementById('publicationtype').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('publicationtype').focus();
		return false;
	}else if(document.getElementById('publicationcontent').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('publicationcontent').focus();
		return false;
	}else if(document.getElementById('txtpublicationamount').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtpublicationamount').focus();
		return false;
	}else if(document.getElementById('txtelectronicepublicationamount').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('txtelectronicepublicationamount').focus();
		return false;
	}else if(document.getElementById('electronicepublicationtype').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('electronicepublicationtype').focus();
		return false;
	}else if(document.getElementById('electronicpublicationcontent').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('electronicpublicationcontent').focus();
		return false;
	}else{
		return true;
	}
}

function validateProblemsAndSolutionsofImplementationForm(){
	if(document.getElementById('problemsandsolutionsimplementation').value == ""){
		alert("Missing Data! Please Enter!");
		document.getElementById('problemsandsolutionsimplementation').focus();
		return false;
	}else{
		return true;
	}
}
function validatePublicRelationOfficerForm(){
	if(document.getElementById('txtfullname').value == ""){
		alert("You should have to insert the name!!");
		document.getElementById('txtfullname').focus();
		return false;
	}else{
		return true;
	}
}