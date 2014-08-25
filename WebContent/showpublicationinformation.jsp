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
        			 <form method="post" action="savepublicationinformationandcontinue.jsp">
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">9. Publishing Information/አትሞ ስለማውጣት:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 							<tr style="background-color:#eee">
					 							<td style="font-size:11pt" width="40%"><label><font color="red">*</font>9.1. Number of Paper Publication<br/>በሕትመት መልክ በዓመት ለምን ያህል ጊዜ ታትሞ ወጣ:</label></td>
					 							<td align="left">
					 								<input type="text" class="large" name="txtnumberofpublicationperyear" id="txtnumberofpublicationperyear" value="0"/>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.2. Paper Publicationየሕትመቱ ዘርፍ (በወረቀት)</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>Type of Publication/የሕትመቱ ዓይነት</th>
					 											<th>Number of Publication/የሕትመቱ ብዛት</th>
					 											<th>Cost/ዋጋ</th>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt;width:40%"><font color="red">*</font>9.2.1. Brochure/ብሮሸር:</td>
					 											<td align="left">
					 												<input type="text" name="txtbrochureamount" id="txtbrochureamount" class="medium" value="0"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtbrochureamountCost" id="txtbrochureamountCost" class="medium" value="0" />
					 											</td>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt;width:40%"><font color="red">*</font>9.2.2. Magazine/መፅሔት:</td>
					 											<td align="left">
					 												<input type="text" name="txtmagazineamount" id="txtmagazineamount" class="medium" value="0"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtmagazineamountCost" id="txtmagazineamountCost" class="medium" value="0" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt;width:40%"><font color="red">*</font>9.2.3. Pamphlet/ፓምፍሌት:</td>
					 											<td align="left">
					 												<input type="text" name="txtpamphletamount" id="txtpamphletamount" class="medium" value="0"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtpamphletamountCost" id="txtpamphletamountCost" class="medium" value="0" />
					 											</td>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt;width:40%"><font color="red">*</font>9.2.4. News paper/ጋዜጣ:</td>
					 											<td align="left">
					 												<input type="text" name="txtnewspaperamount" id="txtnewspaperamount" class="medium" value="0"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtnewspaperamountCost" id="txtnewspaperamountCost" class="medium" value="0" />
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt;width:40%"><font color="red">*</font>9.2.5. Others/ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtotherspaperamount" id="txtotherspaperamount" class="medium" value="0"/>
					 											</td>
					 											<td align="left">
					 												<input type="text" name="txtotherspaperamountCost" id="txtotherspaperamountCost" class="medium" value="0" />
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.3. Publication Category (Electronics)/የሕትመቱ ዘርፍ (9.2.2. በኤሌክትሮኒክስ)</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>Publication Type/የሕትመቱ ዓይነት</th>
					 											<th>Number of Publication/የሕትመቱ ብዛት</th>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.1. CD/ሲዲ:</td>
					 											<td align="left">
					 												<input type="text" name="txtcdamount" id="txtcdamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.2. DVD/ዲቪዲ:</td>
					 											<td align="left">
					 												<input type="text" name="txtdvdamount" id="txtdvdamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.3. Floppy/ፍሎፒ:</td>
					 											<td align="left">
					 												<input type="text" name="txtfloppyamount" id="txtfloppyamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.4. Website/ድረ-ገጽ:</td>
					 											<td align="left">
					 												<input type="text" name="txtwebamount" id="txtwebamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.5. Social Media/የማህበረሰብ ሚዲያ:</td>
					 											<td align="left">
					 												<input type="text" name="txtsocialmediaamount" id="txtsocialmediaamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.3.6. Others/ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtotherselectronicamount" id="txtotherselectronicamount" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.4. Broadcast/ብሮድካስት</legend>
					 									<table border="1" width="100%">
					 										<tr>
					 											<th>Type/ዓይነት</th>
					 											<th>Broadcast Amount/የሥርጭቱ ብዛት</th>
					 											<th>Consumed Airtime/የወሠደው የአየር ሰዓት ብዛት</th>
					 										</tr>
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.4.1. Radio/ሬዲዬ:</td>
					 											<td align="left">
					 												<input type="text" name="txtradiobroadcastamount" id="txtradiobroadcastamount" class="medium" value="0"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txtradioairusage" id="txtradioairusage" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 										<tr>
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.4.2. Television/ቴሌቪዥን:</td>
					 											<td align="left">
					 												<input type="text" name="txttelevisionbroadcastamount" id="txttelevisionbroadcastamount" class="medium" value="0"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txttelevisionairusage" id="txttelevisionairusage" class="medium" value="0"/>
					 											</td>
					 										</tr>					 										
					 										<tr style="background-color:#eee">
					 											<td style="font-size:11pt" width="40%"><font color="red">*</font>9.4.5. Others/ሌሎች ካሉ:</td>
					 											<td align="left">
					 												<input type="text" name="txtothersbroadcastamount" id="txtothersbroadcastamount" class="medium" value="0"/>
					 											</td>
					 											<td>
					 												<input type="text" name="txtotherbroadcastairusage" id="txtotherbroadcastairusage" class="medium" value="0"/>
					 											</td>
					 										</tr>
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>	
					 						<tr>
					 							<td colspan="2">
					 								<fieldset>
					 									<legend>9.5. Publication Content/የህትመቱ ይዘት</legend>
					 									<table border="1" width="100%">					 										
					 										<tr style="background:#eee">
					 											<td>9.5.1. </td>
					 											<td style="font-size:11pt" width="40%">About the Organizational Structure, Objectives and Authority<br/>ስለመስርያ ቤቱ መዋቅር፣ አደረጃጀት፣ ስለ ዋና ተግባራቱና ኃላፊነቱ:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk951" id="chk951" value="ስለመስርያ ቤቱ መዋቅር፣ አደረጃጀት፣ ስለ ዋና ተግባራቱና ኃላፊነቱ" checked="checked"/>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.2. </td>
					 											<td style="font-size:11pt" width="40%">Decision Making Ethics of Heads<br/>የኃላፊዎቹን ስልጣንና ኃላፊነት እዲሁም በውሳኔ አሰጣጥ ላይ ተፈጻሚ ስለሚሆነው ስነ-ስረአት:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk952" id="chk952" value="የኃላፊዎቹን ስልጣንና ኃላፊነት እዲሁም በውሳኔ አሰጣጥ ላይ ተፈጻሚ ስለሚሆነው ስነ-ስረአት"/>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.3. </td>
					 											<td style="font-size:11pt" width="40%">Services to Citizens<br/>ለሕዝብ ስለሚሰጣቸው አገልግሎቶች ዝርዝር:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk953" id="chk953" value="ለሕዝብ ስለሚሰጣቸው አገልግሎቶች ዝርዝር"/>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.4. </td>
					 											<td style="font-size:11pt" width="40%">Handling of Appales of Public and Response of the Organization<br/>ለተገልጋዩ ሕዝብ ስለተዘረጋው የቅሬታ አሰማም ስርአትና ከሕዝብ ዘውትር ለሚቀርቡ ጥያቄዎች ወይም ቅሬታዎች የመስርያ ቤቱን ምላሽ የሚያሳዩ ዘገባዎች:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk954" id="chk954" value="ለተገልጋዩ ሕዝብ ስለተዘረጋው የቅሬታ አሰማም ስርአትና ከሕዝብ ዘውትር ለሚቀርቡ ጥያቄዎች ወይም ቅሬታዎች የመስርያ ቤቱን ምላሽ የሚያሳዩ ዘገባዎች"/>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.5. </td>
					 											<td style="font-size:11pt" width="40%">Description of Document Content to Information Requesters<br/>በእጅ ስለሚገዩ መዝገቦች አይነትና በመዝገቦቹ ውስጥ ስለሚገኙ መረጃዎች ይዘት አጭር ማቢራርያ እዲሁም መረጃ ለማግኘት የሚፈልጉ ሰወች  የመረጃ ጥያቄዎች አቀራረብ ስነስርአት ዝርዝር ማብራርያዎችን:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk955" id="chk955" value="በእጅ ስለሚገዩ መዝገቦች አይነትና በመዝገቦቹ ውስጥ ስለሚገኙ መረጃዎች ይዘት አጭር ማቢራርያ እዲሁም መረጃ ለማግኘት የሚፈልጉ ሰወች  የመረጃ ጥያቄዎች አቀራረብ ስነስርአት ዝርዝር ማብራርያዎችን"/>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.6.</td>
					 											<td style="font-size:11pt" width="40%">Rules and Regulations of the Organization<br/>የመስርያቤቱ መተዳደርያ ደንብ፣ የመስርያቤቱ ልዩ ልዩ አካላት ስራዎች የሚመሩባቸውን ደንቦች፣ ማንዋሎች እዲሁም የተሸሻሉ ውይም የተሸሩ መመርያዎች የሚገኙባቸውን  መዝገቦች ዝርዝር:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk956" id="chk956" value="የመስርያቤቱ መተዳደርያ ደንብ፣ የመስርያቤቱ ልዩ ልዩ አካላት ስራዎች የሚመሩባቸውን ደንቦች፣ ማንዋሎች እዲሁም የተሸሻሉ ውይም የተሸሩ መመርያዎች የሚገኙባቸውን  መዝገቦች ዝርዝር"/>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.7.</td>
					 											<td style="font-size:11pt" width="40%">Explanation of the Rules and Regulations of the Organization<br/>የድርጅቱ ሰራተኞች የሚሰሩባቸውን መመርያዎች ፣ ደንቦች ፣ ማብራርያዎችና ሌሎች ሰነዶች:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk957" id="chk957" value="የድርጅቱ ሰራተኞች የሚሰሩባቸውን መመርያዎች ፣ ደንቦች ፣ ማብራርያዎችና ሌሎች ሰነዶች"/>
					 											</td>					 											
					 										</tr>
					 										<tr>
					 											<td>9.5.8.</td>
					 											<td style="font-size:11pt" width="40%">PR Name and Address<br/>የሕዝብ ግንኙነቱ ኃላፊው ስም እና አድራሻ:</td>
					 											<td align="center">
					 												<input type="checkbox" name="chk958" id="chk958" value="የሕዝብ ግንኙነቱ ኃላፊው ስም እና አድራሻ"/>
					 											</td>					 											
					 										</tr>
					 										<tr style="background:#eee">
					 											<td>9.5.9.</td>
					 											<td style="font-size:11pt" width="40%" colspan="2">Others/ሌሎች ዝርዝሮች ካሉ:</td>					 																 											
					 										</tr>					 							
					 										<tr>
					 											<td colspan="3" align="center">
					 												<textarea style="width:100%" class="tinymce" id="textareaotherspublicationcontent" name="textareaotherspublicationcontent" style="width:100%" rows="10">---</textarea>
					 											</td>
					 										</tr>			
					 									</table>
					 								</fieldset>
					 							</td>
					 						</tr>			 									 						
        			 						<tr>        			 							
        			 							<td align="right" colspan="2">
        			 								<input type="submit" value="መዝግብና ቀጥል" class="btn btn-blue" id="btnSave"/>
        			 								<input type="reset" value="አፅዳ" class="btn btn-blue"/>
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
        	 	var numberOfPaperPublication = $('#txtnumberofpublicationperyear').val();
        	 	var brochureQty = $('#txtbrochureamount').val();
        	 	var magazineQty = $('#txtmagazineamount').val();
        	 	var phamphletQty = $('#txtpamphletamount').val();
        	 	var newsPaperQty = $('#txtnewspaperamount').val();
        	 	var othersPaperQty = $('#txtotherspaperamount').val();
        	 	var brochureCost = $('#txtbrochureamountCost').val();
        	 	var magazineCost = $('#txtmagazineamountCost').val();
        	 	var phamphletCost = $('#txtpamphletamountCost').val();
        	 	var newsPaperCost = $('#txtnewspaperamountCost').val();
        	 	var otherCost = $('#txtotherspaperamountCost').val();
        	 	var cdQty = $('#txtcdamount').val();
        	 	var dvdQty = $('#txtdvdamount').val();
        	 	var floppyQty = $('#txtfloppyamount').val();
        	 	var websiteQty = $('#txtwebamount').val();
        	 	var socialMediaQty = $('#txtsocialmediaamount').val();
        	 	var othersElectronicQty = $('#txtotherselectronicamount').val();
        	 	var radioBroadcastQty = $('#txtradiobroadcastamount').val();
        	 	var televisionBroadcastQty = $('#txttelevisionbroadcastamount').val();
        	 	var othersBroadcastQty = $('#txtothersbroadcastamount').val();
        	 	var radioAirtime = $('#txtradioairusage').val();
        	 	var televisionAirtime = $('#txttelevisionairusage').val();
        	 	var othersAirtime = $('#txtotherbroadcastairusage').val();
        	 	
        	 	if(numberOfPaperPublication === ""){
        	 		alert("Number of Paper Publication\nበሕትመት መልክ በዓመት ለምን ያህል ጊዜ ታትሞ ወጣ");
        	 		return false;
        	 	}else if(brochureQty === ""){
        	 		alert("Brochure/ብሮሸር");
        	 		return false;
        	 	}else if(magazineQty === ""){
        	 		alert("Magazine/መፅሔት");
        	 		return false;
        	 	}else if(phamphletQty === ""){
        	 		alert("Pamphlet/ፓምፍሌት");
        	 		return false;
        	 	}else if(newsPaperQty === ""){
        	 		alert("News paper/ጋዜጣ");
        	 		return false;
        	 	}else if(othersPaperQty === ""){
        	 		alert("Others/ሌሎች ካሉ");
        	 		return false;
        	 	}else if(brochureCost === ""){
        	 		alert("Brochure cost/ብሮሸር ዋጋ");
        	 		return false;
        	 	}else if(magazineCost === ""){
        	 		alert("Magazine cost/መፅሔት ዋጋ");
        	 		return false;
        	 	}else if(phamphletCost === ""){
        	 		alert("Pamphlet cost/ፓምፍሌት ዋጋ");
        	 		return false;
        	 	}else if(newsPaperCost === ""){
        	 		alert("News paper cost/ጋዜጣ ዋጋ");
        	 		return false;
        	 	}else if(otherCost === ""){
        	 		alert("Others cost/ሌሎች ካሉ ዋጋ");
        	 		return false;
        	 	}else if(cdQty === ""){
        	 		alert("CD/ሲዲ");
        	 		return false;
        	 	}else if(dvdQty === ""){
        	 		alert("DVD/ዲቪዲ");
        	 		return false;
        	 	}else if(floppyQty === ""){
        	 		alert("Floppy/ፍሎፒ");
        	 		return false;
        	 	}else if(websiteQty === ""){
        	 		alert("Website/ድረ-ገጽ");
        	 		return false;
        	 	}else if(socialMediaQty === ""){
        	 		alert("Social Media/የማህበረሰብ ሚዲያ");
        	 		return false;
        	 	}else if(othersElectronicQty === ""){
        	 		alert("Others/ሌሎች ካሉ");
        	 		return false;
        	 	}else if(radioBroadcastQty === ""){
        	 		alert("Radio/ሬዲዬ");
        	 		return false;
        	 	}else if(televisionBroadcastQty === ""){
        	 		alert("Television/ቴሌቪዥን");
        	 		return false;
        	 	}else if(othersBroadcastQty === ""){
        	 		alert("Others/ሌሎች ካሉ");
        	 		return false;
        	 	}else if(radioAirtime === ""){
        	 		alert("Radio airtime/ሬዲዬ የወሠደው የአየር ሰዓት");
        	 		return false;
        	 	}else if(televisionAirtime === ""){
        	 		alert("Television airtime/ቴሌቪዥን የወሠደው የአየር ሰዓት");
        	 		return false;
        	 	}else if(othersAirtime === ""){
        	 		alert("Others airtime/ሌሎች ካሉ የወሠደው የአየር ሰዓት");
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
