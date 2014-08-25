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
        			 <form method="post" action="saveproblemsandsolutionsofimplementationandend.jsp">
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">10. Implementation Problems and Their Solutions/በአፈፃፀም ያጋጠሙ ችግሮች እና የመፍትሔ ሃሳቦች:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 					<tr>
        			 						<th rowspan="2" width="40%">Problems/ችግሮቹ</th>
        			 						<th colspan="3">Magnitude of Problems/የችግሮቹ ደረጃ</th>        			 						
        			 					</tr>        			 						
        			 					<tr>
        			 						<th>High/ከፍተኛ</th>
        			 						<th>Medium/መካከለኛ</th>
        			 						<th>Low/ዝቅተኛ</th>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td width="40%">10.1 Lack of Awareness About Rights on Proclamation<br/>በአዋጁ ስለተደነገጉ መብቶች የግንዛቤ ማነስ:</td>
        			 						<td align="center"><input type="radio" name="rad10_1problem" id="rad10_1problem" value="High"/></td>
        			 						<td align="center"><input type="radio" name="rad10_1problem" id="rad10_1problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_1problem" id="rad10_1problem" value="Low" checked="checked"/></td>
        			 					</tr>
        			 					<tr>
        			 						<td>10.2 Lack of Support and Attention from Head<br/>ከበላይ ኃላፊ ስለትግበራው ትኩረትና ተገቢዉን ድጋፊ አለማግኘት:</td>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="High"/></td>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_2problem" id="rad10_2problem" value="Low" checked="checked"/></td>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.3 Lack of ICT Infrastructure<br/>የመረጃ ስርአት ባለው መንገድ አለመደራጀቱ:</td>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="High"/></td>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_3problem" id="rad10_3problem" value="Low" checked="checked"/></td>
        			 					</tr>
        			 					<tr>
        			 						<td>10.4 Lack of Budget and Input Problems<br/>የበጀት እጥረት እና የግብአት ችግሮች:</td>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="High"/></td>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_4problem" id="rad10_4problem" value="Low" checked="checked"/></td>
        			 					</tr>
        			 					<tr style="background:#eee">
        			 						<td>10.5 Lack of Followup from Concerned Office<br/>ከሚመለከተው አካል የክትትልና ድጋፍ ማነስ:</td>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="High"/></td>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Medium"/></td>
        			 						<td align="center"><input type="radio" name="rad10_5problem" id="rad10_5problem" value="Low" checked="checked"/></td>
        			 					</tr>        			 					
        			 				</table> 
        			 				<table border="1" width="100%">
        			 					<tr>
        			 						<td style="vertical-align:middle">10.6 Others<br/>ሌሎች ካሉ</td>
        			 						<td colspan="3">
        			 							<textarea class="tinymce" style="width:100%" id="textareaothers" name="textareaothers" rows="10">---</textarea>
        			 						</td>
        			 					</tr>
        			 				</table>       			 				
        			 			</td>
        			 		</tr>
        			 		<tr>
        			 			<td left>
        			 				<%
        			 					Account acnt = (Account)session.getAttribute("account");
        			 					User usr = User.getUser(acnt.getUserId());
        			 					Signature signature = Signature.getSignatureForThisUser(usr.getId());	
        			 					if(signature != null){
        			 				%>
        			 				Signature / ፊርማ : <img src="showsignatureofthisuser.jsp?signatureId=<%=signature.getId() %>" width="90" height="50"/>
        			 				<%
        			 					}else{
        			 						out.print("ይህን ሪፖርት ወደ ዳታቤዙ ለማስገባት የእርሶ ፊርማ ያስፈልጋል። እባክዎን ይህን ጉዳይ በተመለከተ የሲስተም አድሚንስትሬተሩን ያማክሩት።");
        			 					}
        			 				%>
        			 			</td>
        			 		</tr>
        			 		<tr>	 							
	 							<td align="right">
	 								<%
	 									if(signature != null){
	 								%>
			 								<input type="submit" value="Save and Continue/መዝግብና ቀጥል" class="btn btn-blue"/>
			 								<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
	 								<%
	 									}
	 								%>
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
         
     });//end document.ready function...
 </script>
</html>
