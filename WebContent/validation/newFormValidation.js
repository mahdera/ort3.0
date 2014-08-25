function validate(form) {
	var fnMap ={
			'validate-nameAmharic':{
				checkFn: isAmharicValidName,
				checkMsg: 'ስም ማስገባት አስፈላጊ ነው'
			},
			'validate-nameEnglish':{
				checkFn: isEnglishValidName,
				checkMsg: 'Please Enter Name'
			},
			'validate-phoneMobile':{
				checkFn: isMobilePhone,
				checkMsg: 'Please Enter the correct phone number'
			},
			'validate-phoneOffice':{
				checkFn: isOfficePhone,
				checkMsg: 'Please Enter the correct phone number'
			},
			'validate-fax':{
				checkFn: isValidFax,
				checkMsg: 'Please Enter the correct Fax number'
			},
			'validate-email':{
				checkFn: isValidEmail,
				checkMsg: 'Please Enter the correct Email'
			},
			'validate-poBox':{
				checkFn: isValidPoBox,
				checkMsg: 'Please Enter the correct P.O.Box'
			},
			'validate-TextBoxes':{
				checkFn: isValidChar,
				checkMsg: 'Please enter the appropriate character'
			}
	};
	var reClass = /(^|\s*)validate-[^\s]*/g;
	var control,controls = form.elements;
	var check,checks;
	var fn,value;
	
	for(var i=0, iLen=controls.Length; i<iLen; i++){
		control = controls[i];
		
		value = control.value;
		checks = control.className.match(reClass);
		
		if(checks){
			for(var j=0, jLen=checks.Length; j<jLen; j++){
				check = checks[j].replace(/\s/g,'');
				
				if(fnMap.hasOwenrProperty(check)){
					check = fnMap[check];
					
					if(check.checkFn(value)){
						alert(check.checkMsg);
						control.focus();
						return false;
					}
				}
			}
		}
	}
}
function isAmharicValidName(){
	var patternAmharic = /^[ሀ-ፖ0-9]/i;
	return patternAmharic;
}
function isEnglishValidName(){
	var patternEnglish = /^[a-zA-Z0-9]/i;
	return patternEnglish;
}
function isMobilePhone(){
	var patMobile = /^([+0-9]{3})?([0-9]{3})?([+0-9]{6})$/i;
	return patMobile;
}
function isOfficePhone(){
	var patOfficephone = /^([+0-9]{3})?([0-9]{3})?([+0-9]{6})$/i;
	return patOfficephone;
}
function isValidFax(){
	var patFax = /^([+0-9]{3})?([0-9]{3})?([+0-9]{6})$/i;
	return patFax;
}
function isValidEmail(){
	var patternEmail = /^[a-z0-9._-]+@[a-z]+.[a-z.]{2,5}$/i;
	return patternEmail;
}
function isValidPoBox(){
	var patternPObox = /^[0-9]+$/i;
	return patternPObox;
}
function isValidChar(form){
	var patternChar = /^[+a-zA-Z]$/i;
	return patternChar;
}