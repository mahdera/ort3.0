<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	List<Signature> signatureList = Signature.getAllSignatures();
	if (!signatureList.isEmpty()) {
		Iterator<Signature> signatureItr = signatureList.iterator();
%>
<table border="0" id="datatables" class="display">
	<thead>
		<tr style="background: #eee; font-size: 12pt; font-weight: bolder">
			<th>Ser.No / ተራ.ቁ</th>			
			<th>System User Name / የሲስተም ተጠቃሚ ሥም</th>
			<th>System User Type / የሲስተም ተጠቃሚ ዓይነት</th>
			<th>Signature / ፊርማ</th>
			<th>Modified By / ይዘቱን የለወጠው ሠው</th>
			<th>Modification Date / የተለወጠበት ቀን</th>
			<th>Delete / አስወግድ</th>
		</tr>
	</thead>
	<tbody>
		<%
			int ctr = 1;
				while (signatureItr.hasNext()) {
					Signature signature = signatureItr.next();
					User usr = User.getUser(signature.getUserId());
					String fullName = usr.getFirstName()+" "+usr.getLastName();
					User signatureUser = User.getUser(signature.getModifiedBy());
					String theFullName = signatureUser.getFirstName()+" "+signatureUser.getLastName();
			%>
		<tr>
			<td><%=ctr++ %></td>			
			<td><%=fullName %></td>
			<td><%=usr.getUserType() %></td>
			<td>
				<img src="showsignatureofthisuser.jsp?signatureId=<%=signature.getId() %>" width="90" height="50"/>
			</td>
			<td><%=theFullName %></td>
			<td><%=signature.getModificationDate() %></td>
			<td>
				<a href="deletethissignature.jsp?signatureId=<%=signature.getId() %>" onclick="return window.confirm('Are you sure you want to delete this signature?');"><img src="design/delete.png" border="0"/></a>
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
