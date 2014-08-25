<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%	
response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
response.addHeader("Pragma", "no-cache"); 
response.addDateHeader ("Expires", 0);

		
if(session.getAttribute("account") == null){
	response.sendRedirect("index.jsp");
	return;
}

	Account acct = (Account) session.getAttribute("account");
	int modifiedBy = acct.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	String firstName = new String(request.getParameter("txtname").getBytes("ISO-8859-1"), "UTF-8");
	String fatherName = new String(request.getParameter("txtfathername").getBytes("ISO-8859-1"), "UTF-8");	
	String userType = new String(request.getParameter("slctsystemusertype").getBytes("ISO-8859-1"), "UTF-8");;
	int selectionId = Integer.parseInt(request.getParameter("slctadminselection"));
	String username = request.getParameter("txtusername");
	String password = request.getParameter("txtpassword");
	
	User u = null;
	if(userType.equalsIgnoreCase("Public Relation Officer")){
		u = new User(firstName,fatherName,"Public Relation Officer",selectionId,0,modifiedBy,modificationDate);
		userType = "Public Relation Officer";
	}else if(userType.equalsIgnoreCase("Umbudsman Reporting Officer")){
		u = new User(firstName,fatherName,"Umbudsman Reporting Officer",0,selectionId,modifiedBy,modificationDate);
		userType = "Umbudsman Reporting Officer";
	}else if(userType.equalsIgnoreCase("System Administrator")){
		u = new User(firstName,fatherName,"System Administrator",0,0,modifiedBy,modificationDate);
		userType = "System Administrator";
	}
	u.save();
	User fetchedUser = User.getUserWith(firstName,fatherName, userType);
	
	Account acct2 = new Account(fetchedUser.getId(),username,password,modifiedBy,modificationDate);
	acct2.addAccount();
	int getMaxRecentAccount = Account.getMaxAccountIdValue();
	Role.createBlankRoleUponUserCreation(getMaxRecentAccount,modifiedBy,modificationDate);
%>
<jsp:forward page="showadduserform.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>User created successfully!</p></div>"/>
</jsp:forward>