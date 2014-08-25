<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div class="grid_12 header-repeat">
	<div id="branding">
		<div class="floatleft">
			<h2>
				<font color="lightgreen">OR</font><font color="lightblue">T</font><font color="lightgreen">3.0</font>
				<font color="lightblue" size="1"></font> <font color="white" size="2"><span style="font-size:14pt">የኢፌድሪ የሕዝብ እንባ ጠባቂ ተቋም የመረጃ ነፃነት ትግበራ ሪፖርት ማጠናቀሪያ ሲስተም</span></font>
			</h2>
		</div>
		<%
			/*if(session.getAttribute("account") == null){
				response.sendRedirect("index.jsp");
				return;
			}*/
			Account account = (Account) session.getAttribute("account");
			User user = User.getUser(account.getUserId());
		%>
		<div class="floatright">
			<div class="floatleft">
				<!-- <img src="img/img-profile.jpg" alt="Profile Pic" /> -->
			</div>
			<div class="floatleft marginleft10">
				<ul class="inline-ul floatleft">
					<li><%=user.getFirstName() %> <%=user.getLastName() %></li>
					<li>
						የተጠቃሚ ዓይነት <a href="#"><%=user.getUserType() %>  
							<%
								if(user.getUserType().equalsIgnoreCase("Public Relation Officer")){
									PublicRelationOfficer publicRelationOfficer = PublicRelationOfficer.getpPublicRelationOfficer(user.getPrId());
									GovernmentSectorOrganization govtOrganization = GovernmentSectorOrganization.getGovernmentSectorOrganization(publicRelationOfficer.getGovernmentSectorOrganizationId());
									out.print(govtOrganization.getOrganizationName());
									out.print("ሕዝብ ግንኙነት");
								}else if(user.getUserType().equalsIgnoreCase("Umbudsman Reporting Officer")){
									UmbudsmanReportingOffice reportingOffice = UmbudsmanReportingOffice.getUmbudsmanReportingOffice(user.getOmbudsmanReportingOfficeId());
									out.print(reportingOffice.getReportingOfficeName());
								}else if(user.getUserType().equalsIgnoreCase("System Administrator")){
									out.print("ሲስተም አድሚኒስትሬተር");
								}
							%> 
						</a>						
					</li>
					<li><a href="logout.jsp">Click to exit/ለመውጣት እዚህ ጠቅ ያድርጉ</a>
					</li>
				</ul>
				<br /> <!-- <span class="small grey">Last Login: 3 hours ago</span> -->
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
<script type="text/javascript">
	function killBrowserWindow(){
		if(window.confirm("Are you sure you want to close the application?")){
			var s=window.opener;
			s.close();
		}
	}
</script>