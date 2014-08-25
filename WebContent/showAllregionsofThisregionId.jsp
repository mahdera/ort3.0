<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.signetitsolutions.ort.server.classes.*"%>
<%@ page import="java.util.*"%>

<%
	String tempRegionId = request.getParameter("regionId");
	
	if(tempRegionId != null && !tempRegionId.equalsIgnoreCase("")&& !tempRegionId.equalsIgnoreCase("undefine")&& tempRegionId.equalsIgnoreCase("all")){
		int regionID = Integer.parseInt(tempRegionId);
		List<Region> regionList = Region.getAllRegions();
		if(!regionList.isEmpty()){
			Iterator<Region> regionItr = regionList.iterator();
			%>
			<select name="slctregion" id="slctregion" style="width:40%" onchange="showAllRegions(this.value);">
				<option value="" selected="selected">---Select---</option>
				<%
					while(regionItr.hasNext()){
						Region region = regionItr.next();
						%>
							<option value="<%=region.getId()%>"<%=region.getRegionName() %>></option>
						<% 
					}
				%>
			</select>
			<%
		}
	}
%>