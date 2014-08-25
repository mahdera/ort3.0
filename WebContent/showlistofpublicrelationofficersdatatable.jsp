<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	            	     	List<PublicRelationOfficer> publicRelationOfficerList = PublicRelationOfficer.getAllPublicRelationOfficers();
	            	     	if(!publicRelationOfficerList.isEmpty()){
		            	     	Iterator<PublicRelationOfficer> publicRelationOfficerItr = publicRelationOfficerList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">
		            	     			<th>Ser.No<br/>ተራ.ቁ</th>
		            	     			<th>Full Name<br/>ሙሉ ሥም</th>		            	     					            	     			
		            	     			<th>Mobile Phone<br/>የሞባይል ስልክ</th>
		            	     			<th>Email<br/>ኢሜይል</th>
		            	     			<th>POBox<br/>ፖስታ ሳጥን ቁጥር</th>
		            	     			<th>Gov Sector Organization<br/>የመንግሥት መሥሪያ ቤት/ተቋም</th>
		            	     			<th>Modified By<br/>ይዘቱን የለወጠው ሠው</th>
		            	     			<th>Modification Date<br/>የተለወጠበት ቀን</th>		            	     			
		            	     		</tr>
		            	     		</thead>
		            	     		<tbody>
		            	     		<%
		            	     		int ctr=1;
		            	     		while(publicRelationOfficerItr.hasNext()){
		            	     			PublicRelationOfficer publicRelationOfficer = publicRelationOfficerItr.next();
		            	     			User publicRelationOfficerUser = User.getUser(publicRelationOfficer.getModifiedBy());
		            	     			String fullName = publicRelationOfficerUser.getFirstName()+" "+publicRelationOfficerUser.getLastName();
		            	     			%>		 
		            	     			<tr>           	     			
		            	     				<td><%=ctr++ %></td>
		            	     				<td><%=publicRelationOfficer.getFullName() %></td>		        
		            	     				<td><%=publicRelationOfficer.getMobilePhone() %></td>    	     						            	     				
		            	     				<td><%=publicRelationOfficer.getEmail() %></td>
		            	     				<td><%=publicRelationOfficer.getPobox() %></td>
		            	     				<td><%=GovernmentSectorOrganization.getGovernmentSectorOrganization(publicRelationOfficer.getGovernmentSectorOrganizationId()).getOrganizationName() %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=publicRelationOfficer.getModificationDate() %></td>		            	     				
		            	     			</tr>
		            	     			<%
		            	     		}//end while loop
		            	     		%>
		            	     		</tbody>
		            	     	</table>
		            	     	<%
	            	     	}else{
	            	     		%>
	            	     		<div class='message warning'><h5>ማስታወሻ!</h5>ምንም ዓይነት የሕዝብ ግንኙነት ሃላፊ በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>