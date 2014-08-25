<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	List<Kebele> kebeleList = Kebele.getAllKebeles();
	if (!kebeleList.isEmpty()) {
		Iterator<Kebele> kebeleItr = kebeleList.iterator();
%>
<table border="0" id="datatables" class="display">
	<thead>
		<tr style="background: #eee; font-size: 12pt; font-weight: bolder">
			<th>Ser.No / ተራ.ቁ</th>			
			<th>Woreda Name / የወረዳ ሥም</th>
			<th>Kebele / ቀበሌ</th>
			<th>Modified By / ይዘቱን የለወጠው ሠው</th>
			<th>Modification Date / የተለወጠበት ቀን</th>
		</tr>
	</thead>
	<tbody>
		<%
			int ctr = 1;
				while (kebeleItr.hasNext()) {
					Kebele kebele = kebeleItr.next();
					Woreda woreda = Woreda.getWoreda(kebele.getWoredaId());
					User kebeleUser = User.getUser(kebele.getModifiedBy());
					String fullName = kebeleUser.getFirstName()+" "+kebeleUser.getLastName();
			%>
		<tr>
			<td><%=ctr++ %></td>			
			<td><%=woreda.getWoredaName() %></td>
			<td><%=kebele.getKebeleName() %></td>
			<td><%=fullName %></td>
			<td><%=kebele.getModificationDate() %></td>
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
