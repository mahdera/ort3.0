<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<form method="post" action="validate.jsp">
	<table border="0" width="100%" style="border: 1px solid #cccccc">
		<tr>
			<td colspan="2" align="center">
				<div id="loginErrorDiv" style="color:red;font-weight:bolder">
					<%	
						String msg = null;
						msg = request.getParameter("msg");
						if(msg != null){							
							msg += "/የተሳሳተ የተጠቃሚ ሥም ወይንም የይለፍ ቃል! እንደገና ይሞክሩ...";
							out.print(msg);
						}
					%>
				</div>
			</td>
		</tr>
		<tr>
			<td align="right" width="40%">Username/የተጠቃሚ ሥም:</td>
			<td class="col2"><input type="text" name="txtusername" id="txtusername"  class="error" size="40"/></td>
		</tr>
		<tr>
			<td align="right">Password/የይለፍ ቃል:</td>
			<td><input type="password" name="txtpassword" id="txtpassword" class="error" size="40"/></td>
		</tr>
		<tr>
			<td align="right">Typing Language/የመጻፊያ ቋንቋ:</td>
			<td>
				<select name="slcttypinglanguage" id="slcttypinglanguage">
					<option value="" selected="selected">--Select--</option>
					<option value="'Amharic'">Amharic</option>
					<option value="'English'">English</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button class="btn btn-blue" id="loginButton">Log in/ግባ</button>
				<button class="btn btn-blue" type="reset">Clear/አፅዳ</button>
			</td>
		</tr>
	</table>
	</form>
	<hr/>
	<div>
		<!-- <h1 align="center" style="background:#eee">የፌደራል እንባ ጠባቂ ሪፖርት ማጠናቀሪያ ሲስተም </h1> -->
		
	</div>
	<br/><br/><br/>
<div id="applicantRegistrationDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){		
		$('#txtusername').focus();
		
		$('#loginButton').click(function(){
			var username = $('#txtusername').val();
			var password = $('#txtpassword').val();
			var typingLang = $('#slcttypinglanguage').val();
			
			if(username === "" || password === "" || typingLang === ""){
				$('#loginErrorDiv').html('Missing login data value. Please enter username, password and typing language!<br/>የተሟላ ዳታ አልቀረበም! እባክዎን የተጠቃሚ ሥም፣ የይለፍ ቃል እና መፃፊያ ቋንቋ ያስገቡ!');
				return false;
			}else{
				return true;
			}
		});
	});//end document.ready function
</script>