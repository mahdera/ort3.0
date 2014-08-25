<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	            	     	List<Region> regionList = Region.getAllRegions();
	            	     	if(!regionList.isEmpty()){
		            	     	Iterator<Region> regionItr = regionList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">
		            	     			<td>Ser.No / ተራ.ቁ</td>
		            	     			<td>Region Name / የክልል ሥም</td>
		            	     			<td>Modified By / ይዘቱን የለወጠው ሠው</td>
		            	     			<td>Modification Date / የተለወጠበት ቀን</td>
		            	     			<td>Delete / አስወግድ</td>		            	     					            	     			
		            	     		</tr>
		            	     	</thead>
		            	     	<tbody>
		            	     		<%
		            	     		int ctr=1;
		            	     		while(regionItr.hasNext()){
		            	     			Region region = regionItr.next();
		            	     			User regionUser = User.getUser(region.getModifiedBy());
		            	     			String fullName = regionUser.getFirstName()+" "+regionUser.getLastName();
		            	     			%>		            	     		
		            	     			<tr>	
		            	     				<td><%=ctr++ %></td>
		            	     				<td><%=region.getRegionName() %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=region.getModificationDate() %></td>
		            	     				<td>
		            	     					<a href="deletethisregion.jsp?id=<%=region.getId()%>" onclick="return confirm('ይህንን ክልል ለማስወገድ ወስነዋል?');">Delete/አስወግድ</a>
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
	            	     		<div class='message warning'><h5>Notification/ማስታወሻ!</h5>No region found in the database/ምንም ዓይነት ክልል በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>