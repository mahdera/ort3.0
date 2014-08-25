<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%
	            	     	List<UmbudsmanReportingOffice> umbudsmanReportingOfficeList = UmbudsmanReportingOffice.getAllllUmbudsmanReportingOffices();
	            	     	if(!umbudsmanReportingOfficeList.isEmpty()){
		            	     	Iterator<UmbudsmanReportingOffice> umbudsmanReportingOfficeItr = umbudsmanReportingOfficeList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">		            	     		
		            	     			<td>Ser.No / ተራ.ቁ</td>
		            	     			<td>Organization Name / የእንባ ጠባቂው መሥሪያ ቤት ሥም</td>	
		            	     			<td>Description / ገለፃ</td>
		            	     			<td>Branch / ቅርንጫፍ</td>
		            	     			<td>Modified By / ይዘቱን የለወጠው ሠው</td>
		            	     			<td>Modification Date / የተለወጠበት ቀን</td>
		            	     			<td>Edit / አስተካክል</td>	            	     					            	     			
		            	     		</tr>
		            	     		</thead>
		            	     		<tbody>
		            	     		<%
		            	     		int ctr=1;
		            	     		while(umbudsmanReportingOfficeItr.hasNext()){
		            	     			UmbudsmanReportingOffice reportingOffice = umbudsmanReportingOfficeItr.next();
		            	     			User reportingOfficeUser = User.getUser(reportingOffice.getModifiedBy());
		            	     			String fullName = reportingOfficeUser.getFirstName()+" "+reportingOfficeUser.getLastName();
		            	     			%>
		            	     			<tr>		            	     			
		            	     				<td><%=ctr++ %></td>
		            	     				<td><%=reportingOffice.getReportingOfficeName() %></td>
		            	     				<td><%=reportingOffice.getDescription() %></td>
		            	     				<td><%=Branch.getBranch(reportingOffice.getBranchId()).getBranchName() %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=reportingOffice.getModificationDate() %></td>
		            	     				<td>
		            	     					<a href="showeditfieldsofthisumbudsmanreportingoffice.jsp?id=<%=reportingOffice.getId() %>">Edit/አስተካክል</a>
		            	     				</td>		            	     						            	     				
		            	     			</tr>
		            	     			<%
		            	     		}//end while loop
		            	     		%>
		            	     		</tbody>
		            	     	</table>
		            	     	<%
	            	     	}else{
	            	     		%>
	            	     		<div class='message warning'><h5>ማስታወሻ!</h5>ምንም ዓይነት የእንባ ጠባቂ መሥሪያ ቤት በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>