<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	long reportFormInputId = Long.parseLong(request.getParameter("reportFormInputId"));
	ReportInputForm.delete(reportFormInputId);
%>
<div class='message success'>
	<h5>Success!</h5><p>Report input data deleted successfully!</p>
</div>