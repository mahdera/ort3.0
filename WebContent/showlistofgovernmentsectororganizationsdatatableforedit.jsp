<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	            	     	List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizations();
	            	     	if(!sectorOrganizationList.isEmpty()){
		            	     	Iterator<GovernmentSectorOrganization> sectorOrganizationItr = sectorOrganizationList.iterator();
		            	     	%>
		            	     	<table border="0" id="datatables" class="display">
		            	     	<thead>
		            	     		<tr style="background:#eee;font-size:12pt;font-weight:bolder">
		            	     			<th>Ser.No<br/>ተራ.ቁ</th>
		            	     			<th>Organization Name<br/>የተቋሙ ሥም</th>		            	     					            	     			
		            	     			<th>Description<br/>ገለፃ</th>
		            	     			<th>Sector Category<br/>የዘርፍ ምድብ</th>
		            	     			<th>Office Phone<br/>የቢሮ ስልክ</th>
		            	     			<th>Fax<br/>ፋክስ</th>
		            	     			<th>Region<br/>ክልል</th>
		            	     			<th>Zone<br/>ዞን</th>
		            	     			<th>Woreda<br/>ወረዳ</th>
		            	     			<th>Kebele<br/>ቀበሌ</th>
		            	     			<th>Modified By<br/>ይዘቱን የለወጠው ሠው</th>
		            	     			<th>Modification Date<br/>የተለወጠበት ቀን</th>
		            	     			<th>Edit<br/>አስተካክል</th>
		            	     		</tr>
		            	     		</thead>
		            	     		<tbody>
		            	     		<%
		            	     		int ctr=1;
		            	     		while(sectorOrganizationItr.hasNext()){
		            	     			GovernmentSectorOrganization sectorOrganization = sectorOrganizationItr.next();
		            	     			User govUser = User.getUser(sectorOrganization.getModifiedBy());
		            	     			String fullName = govUser.getFirstName()+" "+govUser.getLastName();
		            	     			%>
		            	     			<tr>		            	     			
		            	     				<td><%=ctr++ %></td>
		            	     				<td><%=sectorOrganization.getOrganizationName() %></td>		        
		            	     				<td><%=sectorOrganization.getDescription() %></td>    	     						            	     				
		            	     				<td><%=SectorCategory.getSectorCategory(sectorOrganization.getSectorCategoryId()).getSectorName() %></td>
		            	     				<td><%=sectorOrganization.getOfficePhone() %></td>
		            	     				<td><%=sectorOrganization.getFax() %></td>
		            	     				<td><%=Region.getRegion(sectorOrganization.getRegionId()).getRegionName() %></td>
		            	     				<td><%=(sectorOrganization.getZoneId() !=0 ? Zone.getZone(sectorOrganization.getZoneId()).getZoneName():"--") %></td>
		            	     				<td><%=(sectorOrganization.getWoredaId() !=0 ? Woreda.getWoreda(sectorOrganization.getWoredaId()).getWoredaName(): "---") %></td>
		            	     				<td><%=(sectorOrganization.getKebeleId() !=0 ? Kebele.getKebele(sectorOrganization.getKebeleId()).getKebeleName() : "---") %></td>
		            	     				<td><%=fullName %></td>
		            	     				<td><%=sectorOrganization.getModificationDate() %></td>		            	     				
		            	     				<td>
		            	     					<a href="showeditfieldsofthisgovernmentsectororganization.jsp?sectorOrganizationId=<%=sectorOrganization.getId() %>"><img src="design/edit-icon.gif" border="0"/></a>
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
	            	     		<div class='message warning'><h5>ማስታወሻ!</h5>ምንም ዓይነት የመንግሥት ተቋም በሲስተም ውስጥ አልተገኝም!</div>
	            	     		<%
	            	     	}
	            	     %>