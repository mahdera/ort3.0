<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>ORT3.0</title>
   <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.donutRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.bubbleRenderer.min.js"></script>
    <!-- END: load jqplot -->
    <script src="js/setup.js" type="text/javascript"></script>
  <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();

          			setSidebarHeight();


        });
    </script>

</head>
<body>
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
		
		Account at = (Account)session.getAttribute("account");
		
		if(session.getAttribute("account") == null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>
    <div class="container_12">
        <%@include file="userhomeheader.jsp" %>
        <div class="clear">
        </div>
        <%@include file="dashboard.jsp" %>
        <div class="clear">
        </div>
        <%@include file="changeusername_sidebarmenu.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Username and Password Modification Form/የሲስተም ተጠቃሚዎች ሥም እና የይለፍ ቃል ማስተካከያ ቅፅ</h2>
                
                <div class="block" style="height:450px;background:#fff">
                	<%
                		Functionality fun = Functionality.getFunctionalityByFunctionalityName("accountmanagement");
	                	Account acct = (Account)session.getAttribute("account");	                	
	                	Role role = Role.getRole(acct.getAccountId(), fun.getId());
	                	if(role != null && role.isWritable() && role.isUpdateable()){
                	%> 
                	<form method="post" action="changeusername.jsp">
                		<table border="0" width="100%" class="form">
                			<tr>
                				<td colspan="2">
                					<div>
                						<%
                							String saveStatus = request.getParameter("saveStatus");
                							if(saveStatus != null)
                								out.print(saveStatus);
                						%>
                					</div>
                				</td>
                			</tr>
                			<tr>
                				<td align="right" width="50%"><label><font color="red">*</font>Enter the current username/የአሁኑን የተጠቃሚ ሥም እዚህ ያስገቡ፡</label></td>
                				<td>
                					<input type="text" name="txtcurrentusername" id="txtcurrentusername" class="medium"/>
                				</td>
                			</tr>
                			<tr>
                				<td align="right"><label><font color="red">*</font>Enter the new username/አዲሱን የተጠቃሚ ሥም እዚህ ያስገቡ፡</label></td>
                				<td>
                					<input type="text" name="txtnewusername" id="txtnewusername" class="medium"/>
                				</td>
                			</tr>
                			<tr>
                				<td align="right"><label><font color="red">*</font>Enter password/የይለፍ ቃሎን እዚህ ያስገቡ፡<label></td>
                				<td>
                					<input type="password" name="txtpassword" id="txtpassword" class="medium"/>
                				</td>
                			</tr>
                			<tr>
                				<td></td>
                				<td>
                					<input type="submit" value="Update/አድስ" class="btn btn-blue" id="btnSave"/>
                					<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
                				</td>
                			</tr>
                		</table>
                	</form>
                	<%
	                	}else{
	                		%>
	                		<div class='message error'><h5>Warning!</h5>
            					<p>You dont have enough previledge to perform this activity!</p>
            				</div>
	                		<%
	                	}
                	%>
            	</div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <%@include file="footer.jsp" %>
    </div>   
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnSave').click(function(){
			var currentUsername = $('#txtcurrentusername').val();
			var newUsername = $('#txtnewusername').val();
			var password = $('#txtpassword').val();
			
			if(currentUsername === ""){
				alert("Enter current username\nየአሁኑን የተጠቃሚ ሥም እዚህ ያስገቡ");
				return false;
			}else if(newUsername === ""){
				alert("Enter the new username\nአዲሱን የተጠቃሚ ሥም እዚህ ያስገቡ");
				return false;
			}else if(password === ""){
				alert("Enter password\nየይለፍ ቃሎን እዚህ ያስገቡ");
				return false;
			}else{
				return true;
			}
		});
	});//end document.ready function
</script>
</html>
