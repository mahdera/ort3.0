<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*"%>
<%
String tempWoredaId = request.getParameter("woredaId");
if (tempWoredaId != null && !tempWoredaId.equalsIgnoreCase("") && !tempWoredaId.equalsIgnoreCase("undefined")) {
	int woredaId = Integer.parseInt(tempWoredaId);
	List<Kebele> kebeleList = Kebele.getAllKebelesOfThisWoreda(woredaId);
	if(!kebeleList.isEmpty()){
		Iterator<Kebele> kebeleItr = kebeleList.iterator();
		%>
		<select name="slctkebele" id="slctkebele" style="width:100%">
			<option value="" selected="selected">--Select--</option>
			<%
				while(kebeleItr.hasNext()){
					Kebele kebele = kebeleItr.next();
					%>
					<option value="<%=kebele.getId() %>"><%=kebele.getKebeleName() %></option>
					<%
				}//end while loop
			%>
		</select>
		<%
	}
}
%>