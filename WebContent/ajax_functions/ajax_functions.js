function showPrOrUmbundsmanReportingOfficerSelection(userType){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("prOrUmbudsmanOfficerDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showprorumbundsmanreportingofficerselection.jsp?userType="+userType, true);
	xmlhttp.send();
}

function showRoleForUser(userId) {
	//alert(userId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("roleDetailForEmployee").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showroleforuser.jsp?userId=" + userId, true);
	xmlhttp.send();
}
function showAllRegions(regionId) {
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("regionDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showAllregionsofThisregionId.jsp?regionId=" + regionId, true);
	xmlhttp.send();
}
function showAllZonesOfThisRegion(regionId){	
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("zoneDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallzonesofthisregion.jsp?regionId=" + regionId, true);
	xmlhttp.send();
}

function showAllWoredasOfThisZone(zoneId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("woredaDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallworedasofthiszone.jsp?zoneId=" + zoneId, true);
	xmlhttp.send();
}

function showAllKebelesOfThisWoreda(woredaId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("kebeleDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallkebelesofthisworeda.jsp?woredaId=" + woredaId, true);
	xmlhttp.send();
}

function showSignatureOfThisUser(userId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("signaturePic").src = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showsignatureofthisuser.jsp?userId=" + userId, true);
	xmlhttp.send();
}

function updateRole(roleId, accountId, functionalityId, chkRead, chkWrite,
		chkUpdate, chkDelete) {
	// now compose the check box names to get the actual selected item from the
	// list
	// alert(roleId+":"+accountId+":"+functionalityId+":"+chkRead+":"+chkWrite+":"+chkUpdate+":"+chkDelete);

	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;

	if (chkRead.checked == true)
		hasReadAccess = true;
	if (chkWrite.checked == true)
		hasWriteAccess = true;
	if (chkUpdate.checked == true)
		hasUpdateAccess = true;
	if (chkDelete.checked == true)
		hasDeleteAccess = true;
	// ///////////////////////////////////////now comes the ajax...
	// alert("role id: "+roleId+"account id: "+accountId+" operation id:
	// "+operationId+" read : "+hasReadAccess+" : write : "+hasWriteAccess+" :
	// update : "+hasUpdateAccess+" : delete : "+hasDeleteAccess);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			//document.getElementById("content").innerHTML = xmlhttp.responseText;
			document.getElementById("roleDetailForEmployee").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updaterole.jsp?roleId=" + roleId + "&accountId="
			+ accountId + "&functionalityId=" + functionalityId
			+ "&hasReadAccess=" + hasReadAccess + "&hasWriteAccess="
			+ hasWriteAccess + "&hasUpdateAccess=" + hasUpdateAccess
			+ "&hasDeleteAccess=" + hasDeleteAccess, true);
	xmlhttp.send();
}

function showListOfReportInputFormsForThisOrganization(orgId){
	//alert(orgId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportInputFormListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofreportinputformsforthisorganization.jsp?orgId=" + orgId, true);
	xmlhttp.send();
}

function selectAllCheckBoxes(totalNumFun) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = true;
		document.getElementById(canWriteChk).checked = true;
		document.getElementById(canUpdateChk).checked = true;
		document.getElementById(canDeleteChk).checked = true;
	}
}

function disselectAllCheckBoxes(totalNumFun) {
	// alert(totalNumFun);
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = false;
		document.getElementById(canWriteChk).checked = false;
		document.getElementById(canUpdateChk).checked = false;
		document.getElementById(canDeleteChk).checked = false;
	}
}

function updateAllRoles(totalNumFun, accountId) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";
	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;
	hiddenRoleId = "";
	hiddenRolIdVal = "";
	hiddenFunctionalityId = "";
	hiddenFunctionalityIdVal = "";

	// now i need to loop trough each check boxes....read their value and save it
	// to the database...
	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenFunctionalityId = "hiddenfunctionalityid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		hiddenFunctionalityIdVal = document.getElementById(hiddenRoleId).value;

		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;

		if (document.getElementById(canReadChk).checked == true)
			hasReadAccess = true;
		if (document.getElementById(canWriteChk).checked == true)
			hasWriteAccess = true;
		if (document.getElementById(canUpdateChk).checked == true)
			hasUpdateAccess = true;
		if (document.getElementById(canDeleteChk).checked == true)
			hasDeleteAccess = true;
		// /////////now update the role value in the database...
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				// document.getElementById("content").innerHTML =
				// xmlhttp.responseText;
				 document.getElementById("roleDetailForEmployee").innerHTML = xmlhttp.responseText;
				// "<strong><font color='green'>Role updated
				// successfully!</font></strong>";
			}
		}
		xmlhttp
				.open("GET", "updaterole.jsp?roleId=" + hiddenRoleIdVal
						+ "&accountId=" + accountId + "&functionalityId="
						+ hiddenFunctionalityIdVal + "&hasReadAccess="
						+ hasReadAccess + "&hasWriteAccess=" + hasWriteAccess
						+ "&hasUpdateAccess=" + hasUpdateAccess
						+ "&hasDeleteAccess=" + hasDeleteAccess, true);
		xmlhttp.send();
		hasReadAccess = false;
		hasWriteAccess = false;
		hasUpdateAccess = false;
		hasDeleteAccess = false;
	}// end for loop

	document.getElementById("content").innerHTML = xmlhttp.responseText;
	document.getElementById("roleDetailForEmployee").innerHTML = "<strong><font color='green'>Role updated successfully!</font></strong>";
}

function showListOfUsersOfThisUserType(userType){
	//alert(userType);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("userListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusersofthisusertype.jsp?userType=" + userType, true);
	xmlhttp.send();
}

function showListOfUsersOfThisUserTypeForEdit(userType){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("userListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusersofthisusertypeforedit.jsp?userType=" + userType, true);
	xmlhttp.send();
}

function showListOfUsersOfThisUserTypeForDelete(userType){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("userListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofusersofthisusertypefordelete.jsp?userType=" + userType, true);
	xmlhttp.send();
}

function showIndividualGovernmentOrganizationSummaryReport(govtOrgId,fromDate,toDate){
	//alert(fromDate+":"+toDate);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("reportDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showindividualgovernementorganizationsummaryreport.jsp?fromDate=" + fromDate+"&toDate="+
			toDate+"&govtOrgId="+govtOrgId, true);
	xmlhttp.send();
}

function showReportDetailsForThisReportFormInputId(reoprtInputFormId){	
	var divId = "reportDetailDiv" + reoprtInputFormId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showreportdetailsforthisreportforminputid.jsp?reoprtInputFormId=" + reoprtInputFormId, true);
	xmlhttp.send();
}

function printDiv(divName) {	
	//alert(divName);
    var printContents = document.getElementById(divName).innerHTML;    
    window.document.getElementById(divName).innerHTML = printContents;
    window.print();    
}

function deleteThisReportFormInputId(reportFormInputId){
	if(window.confirm('Are you sure you want to delete this record?')){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("reportInputFormListDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisreportforminputid.jsp?reportFormInputId="+reportFormInputId, true);
		xmlhttp.send();
	}
}

function showListOfZonesInThisRegion(regionId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("zoneDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofzonesinthisregion.jsp?regionId="+regionId, true);
	xmlhttp.send();
}