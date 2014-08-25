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
    <!-- BEGIN: load jqplot -->
    <!-- <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />-->
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <!-- <script language="javascript" type="text/javascript" src="js/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.donutRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.bubbleRenderer.min.js"></script> -->
    <!-- END: load jqplot -->
    
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
                <h2>Report Data Entry Form/የሪፖርት ግብአት ፎርም/ቅፅ</h2>                	
                <div class="block" style="height:600px;background:#fff">
                	 <div>
 						<%
 							String saveStatus = request.getParameter("saveStatus");
 							if(saveStatus != null)
 								out.print(saveStatus);
 						%>
 					</div> 		
 					<%
	            		Functionality fun = Functionality.getFunctionalityByFunctionalityName("reportinputformmanagement");
	                	Account acct = (Account)session.getAttribute("account");	                	
	                	Role role = Role.getRole(acct.getAccountId(), fun.getId());
	                	if(role != null && role.isWritable() && !user.getUserType().equalsIgnoreCase("system administrator") &&
	                			!user.getUserType().equalsIgnoreCase("Umbudsman Reporting Officer	")){
            		%> 					
        			 <form method="post" action="savebasicinformationaboutreoprtandcontinue.jsp">
        			 	<table border="0" width="100%" class="form1">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">1. Basic Information About the Report/ሪፖርቱን የተመለከቱ መሰረታዊ መረጃዎች:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
        			 							<td style="font-size:11pt" width="60%" colspan="2"><label>Plan Regarding Freedom of Information/የመረጃ ነጻነት በተመለከተ ሊከናወን ታቅዶ የነበረ ስራ:</label></td>        			 							
        			 						</tr>        			 						
        			 						<tr style="background-color:#eee">
        			 							<td style="font-size:11pt" width="40%"><font color="red">*</font>1.1. Publishing Information<br/>መረጃን አትሞ ለማውጣት</td>
        			 							<td>
        			 								<input type="text" name="txtpublishinginformation" id="txtpublishinginformation" class="large" value="0"/>
        			 							</td>
        			 						</tr>
        			 						<tr>
        			 							<td style="font-size:11pt" width="40%"><font color="red">*</font>1.2. Organizing Document and Archive Section<br/>የሰነድና ማህደር ክፍል ማደራጀት</td>
        			 							<td>
        			 								<input type="text" name="txtorganizingrecordoffice" id="txtorganizingrecordoffice" class="large" value="0"/>
        			 							</td>
        			 						</tr>
        			 						<tr style="background-color:#eee">
        			 							<td style="font-size:11pt" width="40%"><font color="red">*</font>1.3. Providing Training for Heads and Professionals<br/>ለኃላፉዎችና ባለሙያዎች  ስልጠና መስጠት</td>
        			 							<td>
        			 								<input type="text" name="txttrainingprovisionforheadsandprofessionals" id="txttrainingprovisionforheadsandprofessionals" class="large" value="0"/>
        			 							</td>
        			 						</tr>
        			 						<tr>
        			 							<td style="font-size:11pt" width="40%"><font color="red">*</font>1.4. Establishing System to Serve Information Requests<br/>የመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት</td>
        			 							<td>
        			 								<input type="text" name="txtestablishingsystemtoserveinformationrequesters" id="txtestablishingsystemtoserveinformationrequesters" class="large" value="0"/>
        			 							</td>
        			 						</tr>
        			 						<tr style="background-color:#eee">
        			 							<td style="font-size:11pt" width="40%" colspan="2"><font color="red">*</font>1.5. Others<br/>ሌሎች ካሉ</td>        			 							
        			 						</tr>        			 						
        			 						<tr>
        			 							<td colspan="2">       			 								
        			 								<textarea class="tinymce" style="width:100%" name="textareaothers" id="textareaothers" rows="10">---</textarea>
        			 							</td>
        			 						</tr>
        			 						<tr>        			 							
        			 							<td colspan="2" align="right">
        			 								<input type="submit" value="Save and Continute/መዝግብና ቀጥል" class="btn btn-blue" id="btnSave"/>
        			 								<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
        			 							</td>
        			 						</tr>
        			 				</table>        			 				
        			 			</td>
        			 		</tr>
        			 	</table>        			 	        			 	
        			 </form>
        			 
        			<%
                	}else{
	                		%>
	                		<div class='message error'><h5>Warning!</h5>
            					<p>You dont have enough previledge to perform this activity! (N.B System Administrators and Umbudsman Reporting Officers are not allowed to <strong>ENTER</strong> report data)</p>
            				</div>
	                		<%
	                	}
	                %>   	                
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
    	 	
    	 	
         $('#btnSave').click(function(){
        	 	var publishingInformation = $('#txtpublishinginformation').val();
        	 	var organizingDocument = $('#txtorganizingrecordoffice').val();
        	 	var providingTraining = $('#txttrainingprovisionforheadsandprofessionals').val();
        	 	var establishingSystem = $('#txtestablishingsystemtoserveinformationrequesters').val();
        	 	var others = $('#textareaothers').val();
        	 	
        	 	if(publishingInformation === ""){
        	 		alert("Enter publishing information\nመረጃን አትሞ ለማውጣት");
        	 		return false;
        	 	}else if(organizingDocument === ""){
        	 		alert("Enter organizing document and archive section\nየሰነድና ማህደር ክፍል ማደራጀት");
        	 		return false;
        	 	}else if(providingTraining === ""){
        	 		alert("Enter providing Training for Heads and Professionals\nለኃላፉዎችና ባለሙያዎች ስልጠና መስጠት");
        	 		return false;
        	 	}else if(establishingSystem === ""){
        	 		alert("Enter establishing System to Serve Information Requests\nየመረጃ ጠያቂዎችን ለማስተናገድ ስርዓት ለመዘርጋት");
        	 		return false;
        	 	}else if(others === ""){
        	 		alert("Enter others\nሌሎች ካሉ");
        	 		return false;
        	 	}else{
        	 		return true;
        	 	}
         });
         
         
     });//end document.ready function...
 </script>
</html>
