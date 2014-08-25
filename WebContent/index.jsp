<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>ORT3.0 Ombudsman Online Reporting Tool</title>
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
    
    <link rel="stylesheet" href="jwysiwyg/jquery.wysiwyg.css" type="text/css" />
	  <link rel="stylesheet" href="examples.css" type="text/css" />
	  <script type="text/javascript" src="jQuery/jquery.js"></script>
	  <script type="text/javascript" src="jwysiwyg/jquery.wysiwyg.js"></script>
	  <script type="text/javascript">
	  $(function(){
	      $('#wysiwyg').wysiwyg();
	  });
	</script>
    
    <script src="js/setup.js" type="text/javascript"></script>
  
    <script type="text/javascript" src="js/ajax_functions.js"></script>
</head>
<body>
    <div class="container_12">
        <%@include file="indexheader.jsp" %>
        <div class="clear">
        </div>
        
        <div class="clear">
        </div>
        <div class="grid_2">
            <%-- <%@include file="indexboxsidemenu.jsp" %> --%>
            <div class="box sidemenu">
            	<img src="img/logo.jpg" width="100%" alt="Logo"/>
            </div>
        </div>
        <div class="grid_10" style="height:600px">
            <div class="box round first">
                <h2>
                    Member login Box/የአባላቶች መግቢያ ሣጥን</h2>
                <div class="block" style="height:480px">
                    <%@include file="showmemberloginform.jsp" %>
                    <br/>
                    <div style="background:#eee">
                    		የኢፊድሪ የሕዝብ እንባ ጠባቂ ተቋም ዋና ዓላማ 
                    </div>
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    <br/>
                    <div style="float:right">
						<img src="images/signetlogo.jpg" align="absmiddle" width="90%"/>
					</div>
                </div><!-- end here -->
            </div>
            <br/><br/><br/><br/>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <%@include file="footer.jsp" %>
    
</body>
</html>
