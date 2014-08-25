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
  <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();
			setSidebarHeight();
        });
    </script>

</head>
<body>
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
		
		Account at = (Account)session.getAttribute("account");
		
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
                <h2>Report Data Entry Form/የሪፖርት ግብአት ፎርም/ቅፅ</h2>                	
                <div class="block" style="background:#fff">
                	 <div>
 						<%
 							String saveStatus = request.getParameter("saveStatus");
 							if(saveStatus != null)
 								out.print(saveStatus);
 						%>
 					</div>
        			 <form method="post" action="savecomplieanceandappealformandcontinue.jsp" onsubmit="return validateRequestToObtainInformationForm();">
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">3. Appeals/የቀረቡ አቤቱታዎች/ቅሬታዎች:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<fieldset>
        			 				<legend>3.1 Appeal to Organization Head/ለተቋሙ የበላይ አላፊ የቀረቡ አቤቱታዎች</legend>
        			 				<table border="1" width="100%">        			 						
        			 							<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.1.1 Number of Appeals<br/>የአቤቱታዎች ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtnumberofappealsfororganizationhead" id="txtnumberofappealsfororganizationhead" value="0"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.1.2 Number of Appeal Rejected by PR<br/>የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtpublicrelationrejectedinformationrequestamountorganizationhead" id="txtpublicrelationrejectedinformationrequestamountorganizationhead" value="0"/>
	       			 							</td>
       			 							</tr>
       			 							<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.1.3 Number of Appeal Approved by PR<br/>የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtpublicrelationapprovedinformationrequestamountorganizationhead" id="txtpublicrelationapprovedinformationrequestamountorganizationhead" value="0"/>
	       			 							</td>
       			 							</tr>
       			 							<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.1.4 Number of Appeal Improved by PR<br/>የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ጥያቄ  ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtpublicrelationenhancedinformationrequestamountorganizationhead" id="txtpublicrelationenhancedinformationrequestamountorganizationhead" value="0"/>
	       			 							</td>
       			 							</tr>  
       			 							<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.1.5 Decision in Progress<br/>በሂደት ላይ ያለ ውሳኔ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtdecisioninprocessamountorganizationhead" id="txtdecisioninprocessamountorganizationhead" value="0"/>
	       			 							</td>
	       			 						</tr>  
	       			 					</table> 
	       			 					</fieldset>
	       			 					<fieldset>
	       			 					<legend>3.2. Appeal to Main Ombudsman Office/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች</legend>
	       			 					<table width="100%">
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.2.1 Number of Administration Appeals<br/>የአስተዳደራዊ ይግባኞች  ብዛት:</label></td>
	       			 							<td align="left" colspan="2">
	       			 								<input type="text" class="large" name="txtadminappealamountmainombudsman" id="txtadminappealamountmainombudsman" value="0"/>
	       			 							</td>
	       			 						</tr>  	
	       			 						<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.2.2 Number of Appeals Rejected by Organization Head<br/>የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሻረበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left" colspan="2">
	       			 								<input type="text" class="large" name="txtorganizationheadrejectedappealamountmainobmbudsman" id="txtorganizationheadrejectedappealamountmainobmbudsman" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.2.3 Number of Appeals Approved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left" colspan="2">
	       			 								<input type="text" class="large" name="txtorganizationheadapprovedappealamountmainombudsman" id="txtorganizationheadapprovedappealamountmainombudsman" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.2.4 Number of Appeals Improved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ  ውሳኔ የተሸሻለበት ይግባኝ ብዛት:</label></td>
	       			 							<td align="left" colspan="2">
	       			 								<input type="text" class="large" name="txtorganizationheadenhanceddecisionamountmainobmbudsman" id="txtorganizationheadenhanceddecisionamountmainobmbudsman" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.2.5 Decision in Progress<br/>በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት:</label></td>
	       			 							<td align="left" colspan="2">
	       			 								<input type="text" class="large" name="txtappealdecisioninprocessamountmainombudsman" id="txtappealdecisioninprocessamountmainombudsman" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						</table>
	       			 					</fieldset>     			 								 						
        			 						<fieldset>
        			 							<legend>3.3. Appeal to Court/ለፍርድ ቤት የቀረቡ ይግባኞች</legend>
        			 							<table>
	       			 						<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.1 Number of Decision by Gov Body Rejecting Previous Verdict<br/>በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt" id="txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt" value="0"/>
	       			 							</td>
	       			 						</tr>  	
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.2 Number of Deicision by Gov Body Approving Previous Verdict<br/>በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt" id="txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.3 Number of Decision by Gov Body Improving Previous Verdict<br/>በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt" id="txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.4 Number of Decision by Information Requesters Rejecting Previous Verdict<br/>በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt" id="txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr style="background-color:#eee">
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.5 Number of Decision by Information Requesters Approving Previous Verdict<br/>በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt" id="txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt" value="0"/>
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>3.3.6 Number of Decision by Information Requesters Improving Previous Verdict<br/>በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት:</label></td>
	       			 							<td align="left">
	       			 								<input type="text" class="large" name="txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt" id="txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt" value="0"/>
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
        			 	</table><!-- up to here -->       			 	
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
			var numberOfAppeals = $('#txtnumberofappealsfororganizationhead').val();
			var numberOfRejectedAppeals = $('#txtpublicrelationrejectedinformationrequestamountorganizationhead').val();
			var numberOfApprovedAppeals = $('#txtpublicrelationapprovedinformationrequestamountorganizationhead').val();
			var numberOfImprovedAppeals = $('#txtpublicrelationenhancedinformationrequestamountorganizationhead').val();
			var decisionsInProgress = $('#txtdecisioninprocessamountorganizationhead').val();
			var administrationAppeals = $('#txtadminappealamountmainombudsman').val();
			var numberOfAppealsRejectedByOrganizationHead = $('#txtorganizationheadrejectedappealamountmainobmbudsman').val();
			var numberOfAppealsApprovedByOrganizationHead = $('#txtorganizationheadapprovedappealamountmainombudsman').val();
			var numberOfAppealsImprovedByOrganizationHead = $('#txtorganizationheadenhanceddecisionamountmainobmbudsman').val();
			var decisionsInProgressOrganizationHead = $('#txtappealdecisioninprocessamountmainombudsman').val();
			var numberOfRejectedDecisionsByGovtBody = $('#txtrejectionofpreviousdecisionpresentedbygovtbodyamountcourt').val();
			var numberOfApprovedDecisionsByGovtBody = $('#txtapprovalpreviousdecisionpresentedbygovtbodyamountcourt').val();
			var numberOfImprovedDecisionsbyGovtBody = $('#txtenhancementofpreviousdecisionpresentedbygovtbodyamountcourt').val();
			var numberOfDecisionsByInfoRequestRejectingPrevVerdict = $('#txtrejectionofpreviousdecisionpresentedbyinformationrequesterscourt').val();
			var numberOfDecisionsByInfoRequestApprovingPrevVerdict = $('#txtapprovalpreviousdecisionpresentedbyinformationrequesterscourt').val();
			var numberOfDecisionsByInfoRequestImprovingPrevVerdict = $('#txtenhancementofpreviousdecisionpresentedbyinformationrequesterscourt').val();
			
			if(numberOfAppeals === ""){
				alert("Number of Appeals\nየአቤቱታዎች ብዛት");
				return false;
			}else if(numberOfRejectedAppeals === ""){
				alert("Number of Appeal Rejected by PR\nየህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት");
				return false;
			}else if(numberOfApprovedAppeals === ""){
				alert("Number of Appeal Approved by PR\nየህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት");
				return false;
			}else if(numberOfImprovedAppeals === ""){
				alert("Number of Appeal Improved by PR\nየህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ጥያቄ ብዛት");
				return false;
			}else if(decisionsInProgress === ""){
				alert("Decision in Progress\nበሂደት ላይ ያለ ውሳኔ ብዛት");
				return false;
			}else if(administrationAppeals === ""){
				alert("Number of Administration Appeals\nየአስተዳደራዊ ይግባኞች ብዛት");
				return false;
			}else if(numberOfAppealsRejectedByOrganizationHead === ""){
				alert("Number of Appeals Rejected by Organization Head\nየተቋሙ የበላይ ኃላፊ ውሳኔ የተሻረበት ይግባኝ ብዛት");
				return false;
			}else if(numberOfAppealsApprovedByOrganizationHead === ""){
				alert("Number of Appeals Approved by Organization Head\nየተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት");
				return false;
			}else if(numberOfAppealsImprovedByOrganizationHead === ""){
				alert("Number of Appeals Improved by Organization Head\nየተቋሙ የበላይ ኃላፊ ውሳኔ የተሸሻለበት ይግባኝ ብዛት");
				return false;
			}else if(decisionsInProgressOrganizationHead === ""){
				alert("Decision in Progress\nበሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት");
				return false;
			}else if(numberOfRejectedDecisionsByGovtBody === ""){
				alert("Number of Decision by Gov Body Rejecting Previous Verdict\nበመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት");
				return false;
			}else if(numberOfApprovedDecisionsByGovtBody === ""){
				alert("Number of Deicision by Gov Body Approving Previous Verdict\nበመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት");
				return false;
			}else if(numberOfImprovedDecisionsbyGovtBody === ""){
				alert("Number of Decision by Gov Body Improving Previous Verdict\nበመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት");
				return false;
			}else if(numberOfDecisionsByInfoRequestRejectingPrevVerdict === ""){
				alert("Number of Decision by Information Requesters Rejecting Previous Verdict\nበመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት");
				return false;
			}else if(numberOfDecisionsByInfoRequestApprovingPrevVerdict === ""){
				alert("Number of Decision by Information Requesters Approving Previous Verdict\nበመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት");
				return false;
			}else if(numberOfDecisionsByInfoRequestImprovingPrevVerdict === ""){
				alert("Number of Decision by Information Requesters Improving Previous Verdict\nበመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት");
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
