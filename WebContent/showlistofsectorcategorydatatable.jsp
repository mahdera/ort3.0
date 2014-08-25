<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	List<SectorCategory> sectorCategoryList = SectorCategory
			.getAllSectorCategories();
	if (!sectorCategoryList.isEmpty()) {
		Iterator<SectorCategory> sectorCategoryItr = sectorCategoryList
				.iterator();
%>
<table width="100%" id="datatables" class="display">
	<thead>
		<tr style="background: #eee; font-size: 12pt; font-weight: bolder">
			<th align="left">S.No / ተራ.ቁ</th>
			<th align="left">Sector Category Name / የዘርፍ ምድብ ሥም</th>
			<th align="left">Description / ገለፃ</th>
			<th align="left">Modified By / ይዘቱን የለወጠው ሠው</th>
			<th align="left">Modification Date / የተለወጠበት ቀን</th>
		</tr>
	</thead>
	<tbody>
		<%
			int ctr = 1;
				while (sectorCategoryItr.hasNext()) {
					SectorCategory sectorCategory = sectorCategoryItr.next();
					User sectorCategoryUser = User.getUser(sectorCategory.getModifiedBy());
					String fullName = sectorCategoryUser.getFirstName()+" "+sectorCategoryUser.getLastName();
					if (ctr % 2 == 0) {
		%>
		<tr class="odd">
			<%
				} else {
			%>
		
		<tr>
			<%
				}
			%>
			<td><%=ctr++%></td>
			<td><%=sectorCategory.getSectorName()%></td>
			<td><%=sectorCategory.getDescription()%></td>
			<td><%=fullName %></td>
			<td><%=sectorCategory.getModificationDate() %></td>
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
	ምንም ዓይነት የዘርፍ ምድቦች በሲስተም ውስጥ የሉም!
</div>
<%
	}
%>