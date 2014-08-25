<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%
    int uId = Integer.parseInt(request.getParameter("userId"));
    String ctrName = null;    
    User userObj = User.getUser(uId);    
    Account acctForUser = Account.getAccountForUser(userObj.getId());    
    List<Role> roleList = Role.getAllRolesForAccount(acctForUser);
    //now its time to display the roles in a greed the way Ermi wants it...with a check box
    if(!roleList.isEmpty()){
    Iterator<Role> roleItr = roleList.iterator();
    out.print("<table border='0' width='100%' style='background:white' class='form'>");
    out.print("<tr class='best-header'>");
    out.print("<th align='center'>Ser.No</th>");
    out.print("<th align='center'>Account</th>");
    out.print("<th align='center'>Functionality</th>");
    out.print("<th align='center'>Can Read</th>");
    out.print("<th align='center'>Can Write</th>");
    out.print("<th align='center'>Can Update</th>");
    out.print("<th align='center'>Can Delete</th>");
    out.print("<th align='center'>Update</th>");
    int index = 1;
    
    int totalNumberOfFunctionality = roleList.size();
    //out.print("there are "+totalNumberOfFunctionality);
    int roleIdContainer[] = new int[totalNumberOfFunctionality];
    int arrayIndex = 0;
    int accountIdPara = 0;
    
    while (roleItr.hasNext()) {
        Role role = roleItr.next();
        System.out.println(role.toString());
        int roleId = role.getId();
    	//roleIdContainer[arrayIndex] = roleId;    
        
        accountIdPara = role.getAccountId();
        int functionalityIdPara = role.getFunctionalityId();
        
        
        boolean canRead = role.isReadable();
        boolean canWrite = role.isWritable();
        boolean canUpdate = role.isUpdateable();
        boolean canDelete = role.isDeletable();
        
        Account acctObj = Account.getAccount(accountIdPara);
        Functionality fun = Functionality.getFunctionality(functionalityIdPara);
        
        
        if (index % 2 == 0) {
            out.print("<tr style='background:#e4dfdf'>");
        } else {
            out.print("<tr>");
        }
        out.print("<td align='center'>" + index + "</td>");
        out.print("<td align='center'>" + userObj.getUserType() + "</td>");
        out.print("<td align='left'>" + fun.getFunctionalityName() + "</td>");
%>
<td align="center">
	<%
		String hiddenControlName = "hiddenroleid"+index;
	%>
	<input type="hidden" name="<%=hiddenControlName %>" id="<%=hiddenControlName %>" value="<%=roleId %>"/>
    <%
        ctrName = "chkcanread"+roleId;
    	//out.print(ctrName);
        if (canRead == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">	
    <%
        ctrName = "chkcanwrite"+roleId;
    	//out.print(ctrName);
        if (canWrite == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
	<%
		String hiddenFunctionalityControlName = "hiddenfunctionalityid"+index;
	%>
	<input type="hidden" name="<%=hiddenFunctionalityControlName %>" id="hiddenFunctionalityControlName" value="<%=functionalityIdPara %>"/>
    <%
        ctrName = "chkcanupdate"+roleId;
    	//out.print(hiddenFunctionalityControlName);
        if (canUpdate == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
    <%
        ctrName = "chkcandelete"+roleId;
        if (canDelete == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
    <%
        String readCheck = "chkcanread"+roleId;
        String writeCheck = "chkcanwrite"+roleId;
        String updateCheck = "chkcanupdate"+roleId;
        String deleteCheck = "chkcandelete"+roleId;
    %>
    <a href="#.jsp" onclick="updateRole(<%=roleId%>,<%=accountIdPara%>,<%=functionalityIdPara%>,document.getElementById('<%=readCheck%>'),document.getElementById('<%=writeCheck%>'),document.getElementById('<%=updateCheck%>'),document.getElementById('<%=deleteCheck%>'));"><img src="design/save-icon.gif" border="0" align="absmiddle"/></a>
</td>
<%
        out.print("</tr>");
        index++;
        arrayIndex++;
    }//end while loop
    /* out.print("<tr>");
    	out.print("<td colspan='8'>");
    		out.print("<hr/>");
    	out.print("</td>");
    out.print("</tr"); */
    out.print("<tr>");
    	out.print("<td colspan='7' align='left'>");
    		%>
    		<a href="#.jsp" onclick="selectAllCheckBoxes(<%=totalNumberOfFunctionality%>);">
    			Check All/ሁሉንም ምረጥ  
    		</a>
    		 |
    		<a href="#.jsp" onclick="disselectAllCheckBoxes(<%=totalNumberOfFunctionality%>);">
    			Uncheck All/ሁሉንም ተው
    		</a>
    		<%
    	out.print("</td>");
    	out.print("<td>");
    		%>
    		<input type="button" value="Update All" class="btn btn-blue" onclick="updateAllRoles(<%=totalNumberOfFunctionality%>,<%=accountIdPara%>);"/>
    		<%
    	out.print("</td>");
    out.print("</tr>");
    out.print("</table>");
    }
%>