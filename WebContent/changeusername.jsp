<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	String currentUsername = request.getParameter("txtcurrentusername");
	String newUsername = request.getParameter("txtnewusername");
	String currentPassword = request.getParameter("txtpassword");
	
	//first check if there exists a user with the given username and password...
	if(Account.isThereAnAccountWithThisUsernameAndPassword(currentUsername,currentPassword)){
		Account account = Account.getAccount(currentUsername,currentPassword);
		Account.updateUsername(account.getAccountId(),currentUsername,newUsername,currentPassword);
		%>
		<jsp:forward page="showchangeusernameform.jsp">
	    	<jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Username changed successfully!</p></div>"/>
		</jsp:forward>
		<%
	}else{
		%>
		<jsp:forward page="showchangeusernameform.jsp">
	    	<jsp:param name="saveStatus" value="<div class='message error'><h5>Error!</h5><p>There is no user with the given username and password combination!</p></div>"/>
		</jsp:forward>
		<%
	}
%>