<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	List<Zone> zoneList = Zone.getAllZones();
	if (!zoneList.isEmpty()) {
		Iterator<Zone> zoneItr = zoneList.iterator();
%>
<table border="0" id="datatables" class="display">
	<thead>
		<tr style="background: #eee; font-size: 12pt; font-weight: bolder">
			<th>Ser.No / ተራ.ቁ</th>
			<th>Region Name / የክልል ሥም</th>
			<th>Zone Name / የዞን ሥም</th>
			<th>Modified By / ይዘቱን የለወጠው ሠው</th>
			<th>Modification Date / የተለወጠበት ቀን</th>
			<th>Edit / አስተካክል</th>
		</tr>
	</thead>
	<tbody>
		<%
			int ctr = 1;
				while (zoneItr.hasNext()) {
					Zone zone = zoneItr.next();
					Region region = Region.getRegion(zone.getRegionId());
					User modifiedByUser = User.getUser(zone.getModifiedBy());
					String fullName = modifiedByUser.getFirstName()+" "+modifiedByUser.getLastName();
			%>
		<tr>
			<td><%=ctr++ %></td>			
			<td><%=region.getRegionName()%></td>
			<td><%=zone.getZoneName() %></td>
			<td><%=fullName %></td>
			<td><%=zone.getModificationDate() %></td>
			<td>
				<a href="showeditfieldsofthiszone.jsp?zoneId=<%=zone.getId() %>"><img src="design/edit-icon.gif" border="0"/></a>
			</td>
		</tr>
		<%
			}//end while loop
		%>
	</tbody>
</table>
<%
	} else {
%>
<div class='message warning'>
	<h5>ማስታወሻ!</h5>
	ምንም ዓይነት መረጃ በሲስተም ውስጥ አልተገኝም!
</div>
<%
	}
%>
