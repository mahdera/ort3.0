<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*"%>
<select name="slctzone" id="slctzone" style="width:50%">
	<option value="" selected="selected">--Select--</option>
	<%
		int regionId = Integer.parseInt(request.getParameter("regionId"));
		List<Zone> zoneList = Zone.getAllZonesOfThisRegion(regionId);
		if(!zoneList.isEmpty()){
			Iterator<Zone> zoneItr = zoneList.iterator();
			while(zoneItr.hasNext()){
				Zone zone = zoneItr.next();
				%>
				<option value="<%=zone.getId() %>"><%=zone.getZoneName() %></option>
				<%
			}//end while loop
		}
	%>
</select>