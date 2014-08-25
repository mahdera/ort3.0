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
    
    
    <script type="text/javascript" src="validation/formValidation.js"></script>
    
    <script type="text/javascript" language="javascript" src="js/ajax_functions.js"></script>
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    
    
    <script src="js/setup.js" type="text/javascript"></script>  

</head>
<body>
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
                <h2>Report Data Entry Form/የሪፖርት ግብአት ፎርም/ቅፅ</h2>                	
                <div class="block" style="background:#fff">
                	 <div>
 						<%
 							String saveStatus = request.getParameter("saveStatus");
 							if(saveStatus != null)
 								out.print(saveStatus);
 						%>
 					</div>
        			 <form method="post" action="saveactivitiescompletedduringproclamationtimeperiodandcontinue.jsp" onsubmit="return validateClassifiedInformationCategoryForm();">
        			 	<table border="1" width="100%" >
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">6. Activities Performed As Per the Time Period Specified in Proclamation/በአዋጁ በተቀመጠው የጊዜ ገደብ ውስጥ በመስተናገድ ረገድ የተከናወኑ ተግባራት:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<fieldset>
        			 				<legend>Within 30 Days/በ30 የስራ ቀናት  የጊዜ ገደብ ውስጥ የተስተናገዱ </legend>
        			 				<table border="1" width="100%">
        			 							<tr style="background-color:#eee">
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.1. Information Requester in Percent<br/>የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtinformationrequestwithin30daysinpercent" id="txtinformationrequestwithin30daysinpercent" value="0"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.2. Number of Days Taken to Serve Request<br/>ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberofdaystakenforservinginformationrequestwithin30days" id="txtnumberofdaystakenforservinginformationrequestwithin30days" value="0"/>
					 							</td>
					 						</tr>					 						
					 				</table>
					 				</fieldset>
					 				
					 				<fieldset>
					 				<legend>Morethan 30 Days/ከ30 የስራቀናት በላይ የተስተናገዱ </legend>
					 				<table border="1" width="100%">
					 						<tr style="background-color:#eee">
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.3. Number of Requesters in Percent<br/>የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtinformationrequestgreaterthan30daysinpercent" id="txtinformationrequestgreaterthan30daysinpercent" value="0"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.4. Number of Days Taken to Serve Request<br/>ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberofdaystakenforservinginformationrequestgreaterthan30days" id="txtnumberofdaystakenforservinginformationrequestgreaterthan30days" value="0"/>
					 							</td>
					 						</tr>
					 				</table>
					 				</fieldset>
					 				
					 				<fieldset>
					 					<legend><font color="red">*</font>6.3. Urgent Reply Within 10 Days/አጣዳፊ ምላሽ በ10 ቀን የጊዜ ገደብ ውስጥ የተስተናገደ</legend>
					 					<table border="1" width="100%">
					 						<tr style="background-color:#eee">
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.5. Number of Requesters in Percent<br/>የመረጃ ጠያቂዎች ብዛት በመቶኛ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtinformationservedurgentlywithin10daysinpercent" id="txtinformationservedurgentlywithin10daysinpercent" value="0"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>6.6. Number of Days Taken to Serve<br/>ለማስተናገድ  የፈጀው ቀን በአማካይ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberofdaystakenforservinginformationrequestwithin10days" id="txtnumberofdaystakenforservinginformationrequestwithin10days" value="0"/>
					 							</td>
					 						</tr>
					 					</table>
					 				</fieldset>
					 			</td>
					 		</tr>        			 				
 			 				<tr> 							
	 							<td align="right">
	 								<input type="submit" value="Save and Continue/መዝግብና ቀጥል" class="btn btn-blue" id="btnSave"/>
	 								<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
	 							</td>
 							</tr>
        			 	</table>        			 	       			 	
        			 </form>   	                
            	</div>
        	</div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <%@include file="footer.jsp" %>  
    </div>  
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnSave').click(function(){
			var informationRequesterInPercentBn30Days = $('#txtinformationrequestwithin30daysinpercent').val();
			var numberOfDaysTakenToServeRequestBn30Days = $('#txtnumberofdaystakenforservinginformationrequestwithin30days').val();
			var numberOfRequestersInPercentMoreThan30Days = $('#txtinformationrequestgreaterthan30daysinpercent').val();
			var numberOfDaysTakenToServeMoreThan30Days = $('#txtnumberofdaystakenforservinginformationrequestgreaterthan30days').val();
			var numberOfRequestersInPercentLessThan10Days = $('#txtinformationservedurgentlywithin10daysinpercent').val();
			var numberOfDaysTakenToServeLessThan10Days = $('#txtnumberofdaystakenforservinginformationrequestwithin10days').val();
			
			if(informationRequesterInPercentBn30Days === ""){
				alert("Information Requester in Percent\nየመረጃ ጠያቂዎች ብዛት በመቶኛ");
				return false;
			}else if(numberOfDaysTakenToServeRequestBn30Days === ""){
				alert("Number of Days Taken to Serve Request\nለማስተናገድ የፈጀው ቀን በአማካይ");
				return false;
			}else if(numberOfRequestersInPercentMoreThan30Days === ""){
				alert("Number of Requesters in Percent\nየመረጃ ጠያቂዎች ብዛት በመቶኛ");
				return false;
			}else if(numberOfDaysTakenToServeMoreThan30Days === ""){
				alert("Number of Days Taken to Serve Request\nለማስተናገድ የፈጀው ቀን በአማካይ");
				return false;
			}else if(numberOfRequestersInPercentLessThan10Days === ""){
				alert("Number of Requesters in Percent\nየመረጃ ጠያቂዎች ብዛት በመቶኛ");
				return false;
			}else if(numberOfDaysTakenToServeLessThan10Days === ""){
				alert("Number of Days Taken to Serve\nለማስተናገድ የፈጀው ቀን በአማካይ");
				return false;
			}else{
				return true;
			}
		});
		
		$('input').keydown(function(e){
	 		//allow backspace, delete, tab, escape, enter and .
	 		if($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
	 				//Allow: Ctrl+A
	 				(e.keyCode == 65 && e.ctrlKey === true) ||
	 				//Allow: home, end, left, right
	 				(e.keyCode >= 35 && e.keyCode <= 39)){
	 					// let it happen, don't do anything...
	 					return;
	 				}
	 				//Ensure that it is a number and stop the keydown
	 				if((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)){
	 					e.preventDefault();
	 				}
	 	});
	});//end document.ready function
</script>
</html>
