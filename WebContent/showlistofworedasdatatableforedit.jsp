<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	List<Woreda> woredaList = Woreda.getAllWoredas();
	if (!woredaList.isEmpty()) {
		Iterator<Woreda> woredaItr = woredaList.iterator();
%>
<table border="0" id="datatables" class="display">
	<thead>
		<tr style="background: #eee; font-size: 12pt; font-weight: bolder">
			<th>Ser.No / ተራ.ቁ</th>
			<th>Zone Name / የዞን ሥም</th>
			<th>Woreda Name / የወረዳ ሥም</th>
			<th>Modified By / ይዘቱን የለወጠው ሠው</th>
			<th>Modification Date / የተለወጠበት ቀን</th>
			<th>Edit / አስተካክል</th>
		</tr>
	</thead>
	<tbody>
		<%
			int ctr = 1;
				while (woredaItr.hasNext()) {
					Woreda woreda = woredaItr.next();
					Zone zone = Zone.getZone(woreda.getZoneId());
					User modifiedByUser = User.getUser(woreda.getModifiedBy());
					String fullName = modifiedByUser.getFirstName()+" "+modifiedByUser.getLastName();
			%>
		<tr>
			<td><%=ctr++ %></td>			
			<td><%=zone.getZoneName() %></td>
			<td><%=woreda.getWoredaName() %></td>
			<td><%=fullName %></td>
			<td><%=woreda.getModificationDate() %></td>
			<td>
				<a href="showeditfieldsofthisworeda.jsp?woredaId=<%=woreda.getId() %>"><img src="design/edit-icon.gif" border="0"/></a>
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
