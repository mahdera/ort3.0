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
	
	long reportInputFormId = Long.parseLong(String.valueOf(session.getAttribute("reportInputFormId").toString()));
	String rad10_1problem = request.getParameter("rad10_1problem");
	String rad10_2problem = request.getParameter("rad10_2problem");
	String rad10_3problem = request.getParameter("rad10_3problem");
	String rad10_4problem = request.getParameter("rad10_4problem");
	String rad10_5problem = request.getParameter("rad10_5problem");
	String others = new String(request.getParameter("textareaothers").getBytes("ISO-8859-1"), "UTF-8");
	
	ProblemsAndSolutionsImplementation problemsAndSolutionsImplementation = new ProblemsAndSolutionsImplementation(reportInputFormId,
			rad10_1problem,rad10_2problem,rad10_3problem,rad10_4problem,rad10_5problem,others,
			modifiedBy,modificationDate);
	problemsAndSolutionsImplementation.save();
%>
<%@include file="showendofreportinputform.jsp"%>