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
	int numberOfPublicationInAYear = Integer.parseInt(request.getParameter("txtnumberofpublicationperyear"));
	int brochureAmount = Integer.parseInt(request.getParameter("txtbrochureamount"));
	int magazineAmount = Integer.parseInt(request.getParameter("txtmagazineamount"));
	int pamphletAmount = Integer.parseInt(request.getParameter("txtpamphletamount"));
	int newsPaperAmount = Integer.parseInt(request.getParameter("txtnewspaperamount"));
	int othersPaper = Integer.parseInt(request.getParameter("txtotherspaperamount"));
	int cdAmount = Integer.parseInt(request.getParameter("txtcdamount"));
	int dvdAmount = Integer.parseInt(request.getParameter("txtdvdamount"));
	int floppyAmount = Integer.parseInt(request.getParameter("txtfloppyamount"));
	int webAmount = Integer.parseInt(request.getParameter("txtwebamount"));
	int socialMediaAmount = Integer.parseInt(request.getParameter("txtsocialmediaamount"));
	int othersElectronic = Integer.parseInt(request.getParameter("txtotherselectronicamount"));
	int numberOfRadioBroadcast = Integer.parseInt(request.getParameter("txtradiobroadcastamount"));
	float numberOfRadioAirUsage = Float.parseFloat(request.getParameter("txtradioairusage"));
	int numberOfTelevisionBroadcast = Integer.parseInt(request.getParameter("txttelevisionbroadcastamount"));
	float numberOfTelevisionAirUsage = Float.parseFloat(request.getParameter("txttelevisionairusage"));
	int otherBroadcast = Integer.parseInt(request.getParameter("txtothersbroadcastamount"));
	float numberOfOthersBraodcastAirUsage = Float.parseFloat(request.getParameter("txtotherbroadcastairusage"));
	float brochureAmountCost = Float.parseFloat(request.getParameter("txtbrochureamountCost"));
	float magazineAmountCost = Float.parseFloat(request.getParameter("txtmagazineamountCost"));
	float pamphletAmountCost = Float.parseFloat(request.getParameter("txtpamphletamountCost"));
	float newsPaperAmountCost = Float.parseFloat(request.getParameter("txtnewspaperamountCost"));
	float othersPaperCost = Float.parseFloat(request.getParameter("txtotherspaperamountCost"));
	
	String _951="---";
	String _952="---";
	String _953="---";
	String _954="---";
	String _955="---";
	String _956="---";
	String _957="---";
	String _958="---";
	String _959="---";	
	
	if(request.getParameter("chk951") != null)
		_951 = new String(request.getParameter("chk951").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk952") != null)
		_952 = new String(request.getParameter("chk952").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk953") != null)
		_953 = new String(request.getParameter("chk953").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk954") != null)
		_954 = new String(request.getParameter("chk954").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk955") != null)
		_955 = new String(request.getParameter("chk955").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk956") != null)
		_956 = new String(request.getParameter("chk956").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk957") != null)
		_957 = new String(request.getParameter("chk957").getBytes("ISO-8859-1"), "UTF-8");
	if(request.getParameter("chk958") != null)
		_958 = new String(request.getParameter("chk958").getBytes("ISO-8859-1"), "UTF-8");
	
	
	String generalOthers = new String(request.getParameter("textareaotherspublicationcontent").getBytes("ISO-8859-1"), "UTF-8");
	
	////save data here...
	PublishingInformation publishingInformation = new PublishingInformation(reportInputFormId,numberOfPublicationInAYear,
			modifiedBy,modificationDate);
	publishingInformation.save();
	
	PaperPublication paperPublication = new PaperPublication(reportInputFormId,brochureAmount,magazineAmount,pamphletAmount,
			         newsPaperAmount,othersPaper,brochureAmountCost,magazineAmountCost,pamphletAmountCost,newsPaperAmountCost,othersPaperCost,
			         modifiedBy,modificationDate);
	paperPublication.save();
	
	ElectronicPublication electronicPublication = new ElectronicPublication(reportInputFormId,cdAmount,dvdAmount,floppyAmount,webAmount,socialMediaAmount,othersElectronic,
			modifiedBy,modificationDate);
	electronicPublication.save();
	
	BroadCast broadCast = new BroadCast(reportInputFormId,numberOfRadioBroadcast,numberOfRadioAirUsage,
			numberOfTelevisionBroadcast,numberOfTelevisionAirUsage,othersElectronic,numberOfOthersBraodcastAirUsage,
			modifiedBy,modificationDate);
	broadCast.save();
	
	PublicationContent publicationContent = new PublicationContent(reportInputFormId,_951,_952,_953,_954,_955,_956,_957,_958,_959,generalOthers,
			modifiedBy,modificationDate);
	publicationContent.save();
%>
<%@include file="showproblemsandsolutionsofimplementationform.jsp"%>