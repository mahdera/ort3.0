<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	List<Functionality> functionalityList = Functionality.getAllFunctionalities();
	Iterator<Functionality> functionalityItr = functionalityList.iterator();
	Account acc = (Account)session.getAttribute("account");
	User user2 = User.getUser(acc.getUserId());
%>
<div class="grid_12" style="background:#204562">
	<ul class="nav main">
		<%
			
			while(functionalityItr.hasNext()){
				Functionality functionality = functionalityItr.next();
				if((user2.getUserType().equalsIgnoreCase("Public Relation Officer")&& functionality.getFunctionalityName().equalsIgnoreCase("reportinputformmanagement"))||(user2.getUserType().equalsIgnoreCase("Public Relation Officer")&& functionality.getFunctionalityName().equalsIgnoreCase("accountmanagement"))){
				%>
				<li class="ic-dashboard">
					<a href="<%=functionality.getFunctionalityName()%>.jsp" title="<%=functionality.getDescription() %>"><span style="font-size:10pt;color:lightgreen"><%=functionality.getMenuName() %></span></a>
				</li>
				<%
				}else if(!user2.getUserType().equalsIgnoreCase("Public Relation Officer")&& !functionality.getFunctionalityName().equalsIgnoreCase("reportinputformmanagement")){
					%>
					<li class="ic-dashboard">
					<a href="<%=functionality.getFunctionalityName()%>.jsp" title="<%=functionality.getDescription() %>"><span style="font-size:10pt;color:lightgreen"><%=functionality.getMenuName() %></span></a>
				</li>
					<%
				}//end of the if condition
			}//end while loop
		%>		
	</ul>
</div>