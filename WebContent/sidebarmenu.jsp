<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%
	Account acct = (Account)session.getAttribute("account");
	User usr = User.getUser(acct.getUserId());
%>
<div class="grid_2">
	<div class="box sidemenu" style="color: #204562">
		<div class="block" id="section-menu">
			<ul class="section menu">
				<%
					if(usr.getUserType().equalsIgnoreCase("System Administrator")){
				%>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Admin Tool<br/>የአድሚኒስትሬተር መገልገያዎች</a>
					<ul class="submenu" style="background: lightyellow">
						<li><a style="color: #204562" href="sectorcategorymanagement.jsp">Sector Category<br/>የዘርፍ ምድቦች</a></li>
						<li><a style="color: #204562" href="regionmanagement.jsp">Region Management<br/>ክልል ማስተዳደሪያ</a></li>
						<li><a style="color: #204562" href="branchmanagement.jsp">Ombudsman Branch Management<br/>የሕዝብ እንባ ጠባቂ ቅ/ጽ/ቤት ማስተዳደሪያ</a></li>
						<li><a style="color: #204562" href="umbudsmanreportingofficemanagement.jsp">Ombudsman Office<br/>የሕዝብ እንባ ጠባቂ መሥሪያ ቤት</a></li>
						<li><a style="color: #204562" href="governmentsectororganizationmanagement.jsp">Government Organization<br/>የመንግሥት ተቋም</a></li>						
						<li><a style="color: #204562" href="usermanagement.jsp">System User<br/>ሲስተም ተጠቃሚ</a></li>						
						<li><a style="color: #204562" href="zoneamanagement.jsp">Zone Management<br/>ዞን ማስተዳደሪያ</a></li>
						<li><a style="color: #204562" href="woredaamanagement.jsp">Woreda Management<br/>ወረዳ ማስተዳደሪያ</a></li>
						<li><a style="color: #204562" href="kebelemanagement.jsp">Kebele Management<br/>ቀበሌ ማስተዳደሪያ</a></li>
						<li><a style="color: #204562" href="signaturemanagement.jsp">Signature Management<br/>የፊርማ ማስተዳደሪያ</a></li>
					</ul>
				</li>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Public Relation Officer<br/>የሕዝብ ግንኙነት ክፍል ሃላፊ</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="showaddpublicrelationofficerform.jsp">Add Public Relation Officer<br/>የሕዝብ ግንኙነት ክፍል ሃላፊ መዝግብ</a></li>
						<li><a style="color: #204562" href="showlistofpublicrelationofficers.jsp">View Public Relation Officers<br/>የሕዝብ ግንኙነት ክፍል ሃላፊ ዘርዝር</a></li>
						<li><a style="color: #204562" href="showlistofpublicrelationofficerforedit.jsp">Edit Public Relation Officer<br/>የሕዝብ ግንኙነት ክፍል ሃላፊ ማስተካከያ</a></li>
						<li><a style="color: #204562" href="showlistofpublicrelationofficerfordelete.jsp">Delete Public Relation Officer<br/>የሕዝብ ግንኙነት ክፍል ሃላፊ አስወግድ</a></li>
					</ul>
				</li>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Role<br/>ሚና</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="rolemanagement.jsp">Manage User's Role<br/>የተጠቃሚዎች ሚና ወስን</a></li>						
					</ul>
				</li>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Account<br/>አካውንት</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="showchangeusernameform.jsp">Change Username<br/>የተጠቃሚ ሥም ቀይር</a></li>
						<li><a style="color: #204562" href="showchangepasswordform.jsp">Change Password<br/>የይለፍ ቃል ቀይር</a></li>
					</ul>
				</li>				
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Report<br/>ሪፖርት</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="showindividualgovernmentorganizationsummaryreport.jsp">Report<br/>ሪፖርት</a></li>												
					</ul></li>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">User Manual<br/>የተጠቃሚ ማንዋል</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="userManual.jsp">User Manual<br/>የተጠቃሚ ማንዋል</a></li>												
					</ul></li>
					<% 
					} else{
				%>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Account<br/>አካውንት</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="showchangeusernameform.jsp">Change Username<br/>የተጠቃሚ ሥም ቀይር</a></li>
						<li><a style="color: #204562" href="showchangepasswordform.jsp">Change Password<br/>የይለፍ ቃል ቀይር</a></li>
					</ul>
				</li>		
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">Report Data Entry Form<br/>የሪፖርት ግብዓት ቅጽ/ፎርም</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="reportinputformmanagement.jsp">Register Data for Report<br/>ለሪፖርት የሚሆን ዳታ መዝግብ</a></li>
						<!-- <li><a style="color: #204562" href="showlistofreportinputforms.jsp">List Data for Report<br/>ለሪፖርት የሚሆን ዳታ ዘርዝር</a></li> -->						
					</ul>
				</li>
				<li><a class="menuitem" style="font-size: 11pt; color: #204562">User Manual<br/>የተጠቃሚ ማንዋል</a>
					<ul class="submenu">
						<li><a style="color: #204562" href="userManual.jsp">User Manual<br/>የተጠቃሚ ማንዋል</a></li>												
					</ul>
				</li>
				<% 
					}
				%>
			</ul>
		</div>
	</div>
</div>