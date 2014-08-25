<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	            	     	List<Branch> branchList = Branch.getAllBranchs();
	            	     	if(!branchList.isEmpty()){
		            	     	Iterator<Branch> branchItr = branchList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">
		            	     			<td>Ser.No / ተራ.ቁ</td>
		            	     			<td>Branch Name / የቅርንጫፍ ሥም</td>	
		            	     			<td>Description / ገለፃ</td>
		            	     			<td>Region / ክልል</td>
		            	     			<td>Modified By / ይዘቱን የለወጠው ሠው</td>
		            	     			<td>Modification Date / የተለወጠበት ቀን</td>
		            	     			<td>Edit / አስተካክል</td>	            	     					            	     			
		            	     		</tr>
		            	     		</thead>
		            	     		<tbody>
		            	     		<%
		            	     		int ctr=1;
		            	     		while(branchItr.hasNext()){
		            	     			Branch branch = branchItr.next();
		            	     			User branchUser = User.getUser(branch.getModifiedBy());
		            	     			String fullName = branchUser.getFirstName()+" "+branchUser.getLastName();
		            	     			%>		            	     		
		            	     			<tr>	
		            	     				<td><%=ctr++ %></td>
		            	     				<td><%=branch.getBranchName() %></td>
		            	     				<td><%=branch.getDescription() %></td>
		            	     				<td><%=Region.getRegion(branch.getRegionId()).getRegionName() %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=branchUser.getModificationDate() %></td>
		            	     				<td>
		            	     					<a href="showeditfieldsofthisbranch.jsp?branchId=<%=branch.getId() %>">Edit/አስተካክል</a>
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
	            	     		<div class='message warning'><h5>ማስታወሻ!</h5>ምንም ዓይነት ቅርንጫፍ በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>