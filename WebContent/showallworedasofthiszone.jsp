<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*"%>
<%
String tempZoneId = request.getParameter("zoneId");
if (tempZoneId != null && !tempZoneId.equalsIgnoreCase("") && !tempZoneId.equalsIgnoreCase("undefined")) {
	int zoneId = Integer.parseInt(tempZoneId);
	List<Woreda> woredaList = Woreda.getAllWoredasOfThisZone(zoneId);
	if(!woredaList.isEmpty()){
		Iterator<Woreda> woredaItr = woredaList.iterator();
		%>
		<select name="slctworeda" id="slctworeda" style="width:100%" onchange="showAllKebelesOfThisWoreda(this.value);">
			<option value="" selected="selected">--Select--</option>
			<%
				while(woredaItr.hasNext()){
					Woreda woreda = woredaItr.next();
					%>
					<option value="<%=woreda.getId() %>"><%=woreda.getWoredaName() %></option>
					<%
				}//end while loop
			%>
		</select>
		<%
	}
}
%>