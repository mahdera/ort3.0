<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%
	            	     	List<PublicRelationOfficer> publicRelationOfficerList = PublicRelationOfficer.getAllPublicRelationOfficers();
	            	     	if(!publicRelationOfficerList.isEmpty()){
		            	     	Iterator<PublicRelationOfficer> publicRelationOfficerItr = publicRelationOfficerList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">
		            	     			<td>Ser.No<br/>ተራ.ቁ</td>
		            	     			<td>Full Name<br/>ሙሉ ሥም</td>		            	     					            	     			
		            	     			<td>Mobile Phone<br/>የሞባይል ስልክ</td>
		            	     			<td>Email<br/>ኢሜይል</td>
		            	     			<td>Gov Organization<br/>የመንግሥት መሥሪያ ቤት/ተቋም</td>
		            	     			<td>Modified By<br/>ይዘቱን የለወጠው ሠው</td>		
		            	     			<td>Modification Date<br/>የተለወጠበት ቀን</td>
		            	     			<td>Delete<br/>አስወግድ</td>            	     			
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
		            	     				<td><%=GovernmentSectorOrganization.getGovernmentSectorOrganization(publicRelationOfficer.getGovernmentSectorOrganizationId()).getOrganizationName() %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=publicRelationOfficer.getModificationDate() %></td>
		            	     				<td>
		            	     					<a href="deletethispublicrelationofficer.jsp?id=<%=publicRelationOfficer.getId() %>" onclick="return confirm('ይህንን መረጃ ለማጥፋት ወስነዋል። እርግጠኛ ነዎት?');">Delete/አስወግድ</a>
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
	            	     		<div class='message warning'><h5>ማስታወሻ!</h5>ምንም ዓይነት የሕዝብ ግንኙነት ሃላፊ በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>  