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
                <div class="block" style="background:#fff">
                	 <div>
 						<%
 							String saveStatus = request.getParameter("saveStatus");
 							if(saveStatus != null)
 								out.print(saveStatus);
 						%>
 					</div>
        			 <form method="post" action="saveotherissuesthereportmustincludeandcontinue.jsp">
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">8. Other Issues Report Must Contain/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 							<tr style="background-color:#eee">
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>8.1. Training Given to Heads and Professionals (Male)<br/>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ):</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberoftrainingsgiventomaleheadsandprofessionals" id="txtnumberoftrainingsgiventomaleheadsandprofessionals" value="0"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>8.2. Training Given to Heads and Professionals (Female)<br/>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት):</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberoftraningsgiventofemaleheadsandprofessionals" id="txtnumberoftraningsgiventofemaleheadsandprofessionals" value="0"/>
					 							</td>
					 						</tr>
					 						<tr style="background-color:#eee">
					 							<td style="font-size:11pt;vertical-align:middle" width="40%"><label>8.3. Techniques Used for Fast Service<br/>ለመረጃ ጥያቄ ፈጣን ምላሽ ለመስጠት የተቀየሱና ሥራ ላይ የዋሉ ስልቶች ካሉ:</label></td>
					 							<td align="left">
					 								<textarea class="tinymce" style="width:100%" id="textareatechniqueforfastresponse" name="textareatechniqueforfastresponse" style="width:100%" rows="10">---</textarea>
					 							</td>
					 						</tr>	
					 						<tr>
					 							<td style="font-size:11pt;vertical-align:middle" width="40%"><label>8.4. Experience Regarding ICT Utilization<br/>በኢንፎርሜሽን ቴክኖሎጂ በመጠቀም ረገድ ያሉ ተሞክሮዎች ካሉ:</label></td>
					 							<td align="left">
					 								<textarea class="tinymce" style="width:100%" id="textareaitexperence" name="textareaitexperence" style="width:100%" rows="10">---</textarea>
					 							</td>
					 						</tr>				 									 						
        			 						<tr>        			 							
        			 							<td colspan="2" align="right">
        			 								<input type="submit" value="Save and Continue/መዝግብና ቀጥል" class="btn btn-blue" id="btnSave"/>
        			 								<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
        			 							</td>
        			 						</tr>
        			 				</table>        			 				
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
         
         $('#btnSave').click(function(){
        	 	var trainingGivenToHeadsAndProfessionalsMale = $('#txtnumberoftrainingsgiventomaleheadsandprofessionals').val();
        	 	var trainingGivenToHeadsAndProfessionalsFemale = $('#txtnumberoftraningsgiventofemaleheadsandprofessionals').val();
        	 	
        	 	if(trainingGivenToHeadsAndProfessionalsMale === ""){
        	 		alert("Training Given to Heads and Professionals (Male)\nለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)");
        	 		return false;
        	 	}else if(trainingGivenToHeadsAndProfessionalsFemale === ""){
        	 		alert("Training Given to Heads and Professionals (Female)\nለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)");
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
         
     });//end document.ready function...
 </script>
</html>
