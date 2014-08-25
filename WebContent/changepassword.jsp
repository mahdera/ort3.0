<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%	
	String currentUsername = request.getParameter("txtcurrentusername");
	String currentPassword = request.getParameter("txtcurrentpassword");
	String newPassword = request.getParameter("txtnewpassword");
	String confirmationPassword = request.getParameter("txtconfirmpassword");
	
	if(Account.isThereAnAccountWithThisUsernameAndPassword(currentUsername,currentPassword)){
		Account account = Account.getAccount(currentUsername,currentPassword);
		if(newPassword.equals(confirmationPassword)){
			Account.updatePassword(account.getAccountId(),currentUsername,currentPassword,newPassword,confirmationPassword);
			%>
			<jsp:forward page="showchangepasswordform.jsp">
	    		<jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Password changed successfully!</p></div>"/>
			</jsp:forward>
			<%
		}else{
			%>
			<jsp:forward page="showchangepasswordform.jsp">
	    		<jsp:param name="saveStatus" value="<div class='message error'><h5>Error!</h5><p>There new and confirmation password are not identical!</p></div>"/>
			</jsp:forward>
			<%
		}
	}else{
		%>
		<jsp:forward page="showchangepasswordform.jsp">
	    	<jsp:param name="saveStatus" value="<div class='message error'><h5>Error!</h5><p>There is no user with the given username and password combination!</p></div>"/>
		</jsp:forward>
		<%
	}
%>