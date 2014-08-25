<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	String tempRegionId = request.getParameter("regionId");
if (tempRegionId != null && !tempRegionId.equalsIgnoreCase("") && !tempRegionId.equalsIgnoreCase("undefined") && !tempRegionId.equalsIgnoreCase("all")) {
	int regionId = Integer.parseInt(tempRegionId);
	List<Zone> zoneList = Zone.getAllZonesOfThisRegion(regionId);
	if(!zoneList.isEmpty()){
		Iterator<Zone> zoneItr = zoneList.iterator();
		%>
		<select name="slctzone" id="slctzone" style="width:100%" onchange="showAllWoredasOfThisZone(this.value);">
			<option value="" selected="selected">--Select--</option>
			<%
				while(zoneItr.hasNext()){
					Zone zone = zoneItr.next();
					%>
					<option value="<%=zone.getId() %>"><%=zone.getZoneName() %></option>
					<%
				}//end while loop
			%>
		</select>
		<%
	}
}
%>