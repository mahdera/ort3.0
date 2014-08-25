<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%
	int signatureId = Integer.parseInt(request.getParameter("signatureId"));
	Signature.deleteSignature(signatureId);
%>
<jsp:forward page="showlistofsignaturesfordelete.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Signature deleted successfully!</p></div>"/>
</jsp:forward>
