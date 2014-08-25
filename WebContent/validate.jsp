<%@page import="com.signetitsolutions.ort.server.classes.*"%>
<%@ page session="true" %>

<%
            String username = request.getParameter("txtusername");
            String password = request.getParameter("txtpassword");
            String typingLanguage = request.getParameter("slcttypinglanguage");
            
            Account account = Account.getAccount(username,password);            
            
            if (account != null){            
                session.setMaxInactiveInterval(360000);                               
                session.setAttribute("account",account);
                session.setAttribute("typingLang", typingLanguage);
                
                User user = User.getUser(account.getUserId());                
                %>
                	 <script type="text/javascript">
	                		document.location.href = "userhome.jsp";
	             </script>
                <%
            }
            else
            {
            %>
                <jsp:forward page="index.jsp">
                    <jsp:param name="msg" value="<font color='red'><strong>Wrong username or password!<br/>Try again...</strong></font>"/>
                </jsp:forward>
			<%
            }
			%>