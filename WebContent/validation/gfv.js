/*
Generic Form Validation.
tboland@gmail.com
http://www.techtoolblog.com
License: Free To Use, If Modified/Added
please send updated source to tboland@gmail.com
 
To Validate a Form Element Add the Custom Attribute:
validate="VALIDATEHOW"
 
Your Current Options Are:
"not_empty"
"integer"
"number" - decimal allowed
"email"
"phone" - includes international phone numbers
 
Multiple Validation uses the following syntax:
validate="not_empty|integer"
 
To Add a Message Add the Custom Attribute:
msg="Name is a required field"
 
By Default the Messages are shown next to the form element.
To Show Alert Boxes add a Custom Attribute in the form tag (show_alert):
<form action="mypage.aspx" show_alert="1" onSubmit="return Validate(this);">
 
Examples:
<html>
<head>
<script language="JavaScript" src="gfv.js" type="text/javascript"></script>
</head>
<body>
<form action="mypage.php" show_alert="1" onSubmit="return Validate(this);">
First Name <input type="Text" name="FirstName" maxlength="25" validate="not_empty" msg="First Name is Required" /><br/>
Email <input type="text" name="Email" maxlength="25" validate="email" msg="Email is Required" /><br/>
<input type="submit" value="Go">
</form></body></html>
 
ADVANCED USERS:
Add Your Own Function Calls to the validate attribute.
It Must return true or false
example:
<input type="text" name="Age" validate="ValidateAge" />
*/
 
function Validate(objForm) {
 
 
 var arrValidated=new Array();
 
 for (var i=0; i<objForm.elements.length; i++) {
var element=objForm.elements[i];
var elName=element.name;
if ((!elName)||(elName.length == 0)||(arrValidated[elName]))
continue;
arrValidated[elName] = true;
var validationType = element.getAttribute("validate");
if ((!validationType)||(validationType.length == 0))
continue;
var strMessages=element.getAttribute("msg");
if (!strMessages)
strMessages = "";
var arrMessages = strMessages.split("|");
var arrValidationTypes = validationType.split("|");
for (var j=0; j<arrValidationTypes.length; j++) {
var curValidationType = arrValidationTypes[j];
var blnValid=true;
switch (curValidationType) {
case "not_empty":
blnValid = ValidateNotEmpty(element);
break;
case "integer":
blnValid = ValidateInteger(element);
break;
case "number":
blnValid = ValidateNumber(element);
break;
case "email":
blnValid = ValidateEmail(element);
break;
case "phone":
blnValid = ValidatePhone(element);
break;
default:
try {
blnValid = eval(curValidationType+"(element)");
}
catch (ex) {
blnValid = true;
}
}
if (blnValid == false) {
var message="invalid value for "+element.name;
if ((j < arrMessages.length)&&(arrMessages[j].length > 0))
message = arrMessages[j];
InsertError(element, message);
if ((typeof element.focus == "function")||(element.focus)) {
element.focus();
}
return false;
}
else
ClearError(element);
}
 
 }
 
 return true;
}
 
//Empty Validation
function ValidateNotEmpty(objElement) {
 var strValue = GetElementValue(objElement);
 //var pattern = /^[a-ZA-Zሀ-ፖ]+$/i;
 var blnResult = true;
 if(allTrim(strValue) == "") //check for nothing
 {
 blnResult = false;
 }
 return blnResult;
}
 
//Integer Validation
function ValidateInteger(objElement)
// check for valid numeric strings
{
var strString = GetElementValue(objElement);
var strValidChars = "0123456789";
var strChar;
var blnResult = true;
 
// test strString consists of valid characters listed above
for (i = 0; i < strString.length && blnResult == true; i++)
{
strChar = strString.charAt(i);
if (strValidChars.indexOf(strChar) == -1)
{
blnResult = false;
}
}
return blnResult;
}
 
//Number Validation
function ValidateNumber(objElement)
// check for valid numeric strings
{
var strString = GetElementValue(objElement);
var strValidChars = ".0123456789"; //decimal ok
var strChar;
var blnResult = true;
 
// test strString consists of valid characters listed above
for (i = 0; i < strString.length && blnResult == true; i++)
{
strChar = strString.charAt(i);
if (strValidChars.indexOf(strChar) == -1)
{
blnResult = false;
}
}
return blnResult;
}
 
//Email Validation
function ValidateEmail(objElement) {
 // Will check for @, period after @ and text in between
 var strValue = GetElementValue(objElement);
 var in_space = strValue.indexOf(" ");
 if (in_space != -1)
 { return false; }
 
 var len = strValue.length;
 var alpha = strValue.indexOf("@");
 var last_alpha = strValue.lastIndexOf("@");
 
 if (alpha != last_alpha)
{ return false; }
 
 // No @, in first position, or name too short
 if (alpha == -1 || alpha == 0 || len<6 )
{ return false; }
 
 var last_p = strValue.lastIndexOf(".");
// Be sure period at least two spaces after @, but not last char.
 
 if (last_p - alpha < 2 || last_p == (len - 1) )
{ return false; }
 }
 
 
 
 //Valid PhoneNumber
 function ValidatePhone(objElement){
 // non-digit characters which are allowed in phone numbers
 var phoneNumberDelimiters = "()- ";
 // characters which are allowed in international phone numbers
 // (a leading + is OK)
 var validWorldPhoneChars = phoneNumberDelimiters + "+";
 // Minimum no of digits in an international phone no.
 var minDigitsInIPhoneNumber = 10;
 
 var strValue = GetElementValue(objElement);
 s=stripCharsInBag(strValue,validWorldPhoneChars);
 return (ValidateInteger(s) && s.length >= minDigitsInIPhoneNumber);
 }
 
 
function GetElementValue(objElement) {
 var result="";
 switch (objElement.type) {
case "text":
case "hidden":
case "textarea":
case "password":
result = objElement.value;
break;
case "select-one":
case "select":
if (objElement.selectedIndex >= 0)
result = objElement.options[objElement.selectedIndex].value;
break;
case "radio":
case "checkbox":
for (var i=0; i<objElement.form.elements.length; i++) {
if (objElement.form.elements[i].name == objElement.name) {
if (objElement.form.elements[i].checked)
result += objElement.form.elements[i].value+",";
}
}
break;
 }
 return result;
}
 
function InsertError(element, strMessage) {
 if ((element.form.getAttribute("show_alert")) && (element.form.getAttribute("show_alert") != "0")) {
alert(strMessage);
return;
 }
 
 var strSpanID = element.name+"_val_error";
 var objSpan = document.getElementById(strSpanID);
 if (!objSpan) {
if ((element.type == "radio")||(element.type == "checkbox")) {
for (var i=0; i<element.form.elements.length; i++) {
if (element.form.elements[i].name == element.name) {
element = element.form.elements[i];
}
}
}
objSpan = document.createElement("span");
objSpan.id = strSpanID;
objSpan.className = "validation_error";
var nodeAfter=0;
var nodeParent = element.parentNode;
for (var i=0; i<nodeParent.childNodes.length; i++) {
if (nodeParent.childNodes[i] == element) {
if (i < (nodeParent.childNodes.length-1))
nodeAfter = nodeParent.childNodes[i+1];
break;
}
}
if ((!nodeAfter)&&(nodeParent.parentNode)) {
nodeParent = nodeParent.parentNode;
for (var i=0; i<nodeParent.childNodes.length; i++) {
if (nodeParent.childNodes[i] == element.parentNode) {
if (i < (nodeParent.childNodes.length-1))
nodeAfter = nodeParent.childNodes[i+1];
break;
}
}
}
if (nodeAfter)
nodeParent.insertBefore(objSpan, nodeAfter);
else
document.body.appendChild(objSpan);
 }
 objSpan.innerHTML = strMessage;
}
 
function ClearError(element) {
 var strSpanID = element.name+"_val_error";
 var objSpan = document.getElementById(strSpanID);
 if (objSpan) {
objSpan.innerHTML = "";
 }
}
 
function allTrim(cValue){
 var lDone=false;
 while (lDone==false){
if (cValue.length==0) {return cValue;}
if (cValue.indexOf(' ')==0){cValue=cValue.substring(1);lDone=false; continue;}
else {lDone=true;}
		if (cValue.lastIndexOf(' ')==cValue.length-1){cValue=cValue.substring(0, cValue.length-1);lDone=false;continue;}
else {lDone=true;}
 }
 return cValue;
}
 
function stripCharsInBag(s, bag)
{ var i;
var returnString = "";
// Search through stringÕs characters one by one.
// If character is not in bag, append to returnString.
for (i = 0; i < s.length; i++)
{
// Check that current character isnÕt whitespace.
var c = s.charAt(i);
if (bag.indexOf(c) == -1) returnString += c;
}
return returnString;
}