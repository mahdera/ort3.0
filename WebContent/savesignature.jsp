<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.*" %>
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
	//now instade of reading the parameter values from the Ajax call, do it the	
	//usual way, i.e, reading it directly from the caller .jsp file!!
	//get the form values from the caller jsp file!!!!!!!
	String optionalFileName = "";
    String fileName = "";    
    int userId = 0;
        
    FileItem fileItem = null;
    File fileToSend = null;
	FileInputStream fis = null;
	String itemName = "";
	
	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    
	if (!isMultipart){
		out.print("Form is not multipart!");
		
	} else {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
		while(itr.hasNext()){
			FileItem item = (FileItem) itr.next();
			if (item.isFormField()) {
				String name = item.getFieldName();
				if(name.equals("slctuser")){
					userId = Integer.parseInt(item.getString());
				}								
			}else{
				try {
					itemName = item.getName();
					if(itemName != ""){//if the user added a new picture					
						File savedFile = new File(config.getServletContext().getRealPath("/")
								+ "/user_signature/" + itemName);						
						item.write(savedFile);
						fis = new FileInputStream(savedFile);
						System.out.println(fis);
						System.out.println("location is : "+savedFile.getAbsolutePath());
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}			
		}//end while loop
		
		//now save this to the database...
		Signature signature = new Signature(userId,fis,modifiedBy,modificationDate);
		signature.addSignature();				
	}//end else
%>
<jsp:forward page="userhome.jsp">
    <jsp:param name="saveStatus" value="<div class='message success'><h5>Success!</h5><p>Signature saved successfully!</p></div>"/>
</jsp:forward>