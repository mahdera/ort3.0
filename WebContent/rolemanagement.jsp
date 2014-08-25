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
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>
    
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
        <%@include file="rolemanagement_sidebarmenu.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>የተጠቃሚዎች ሚና ማስተዳደሪያ</a></h2>                	
	                <div class="block" style="height:450px;background:#fff">
	                	<%
		                	Account acct = (Account)session.getAttribute("account");
		                	User usr = User.getUser(acct.getUserId());
	                		if(usr.getUserType().equalsIgnoreCase("System Administrator")){
	                	%>
	            	   	<table border="0" width="100%">
	            	   		<tr>
	            	   			<td align="left" width="20%">የሲስተም ተጠቃሚ ምረጥ፡</td>
	            	   			<td>
	            	   				<%
		            	   				List<User> userList = User.getAllUsers();
	        	   						if(!userList.isEmpty()){
	        	   							Iterator<User> userItr = userList.iterator();        	   							
	        	   							
	            	   				%>
			            	   				<select name="slctuser" id="slctuser" style="width:100%" onchange="showRoleForUser(this.value);">
			            	   					<option value="" selected="selected">--ምረጥ--</option>
			            	   					<%
			            	   						while(userItr.hasNext()){
			            	   							User u = userItr.next();
			            	   							String fullName = u.getFirstName()+"  "+u.getLastName();
			            	   							%>
			            	   							<option value="<%=u.getId() %>"><%=fullName %></option>
			            	   							<%
			            	   						}//end while loop
			            	   					%>
			            	   				</select>
	            	   				<%
	        	   						}else{
	        	   							out.print("no users found!");
	        	   						}
	            	   				%>
	            	   			</td>
	            	   		</tr>
	            	   	</table> 
	            	   	<%
	                		}else{
	                			%>
	                			<div class='message error'><h5>Warning!</h5>
            						<p>Only System Administrators are allowed to use this module!</p>
            					</div>
            					<%
	                		}
	            	   	%>
	            	   	<hr />
						<div id="roleDetailForEmployee" style="float:center"></div>            
	            	</div>
        	</div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            Copyright <a href="#">ORT1.0</a>. All Rights Reserved.
        </p>
    </div>
    </div>
</body>
</html>
