<%@page import="java.io.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>

<%	
	//long employeeId = Long.parseLong(request.getParameter("employeeId"));
	int signatureId = Integer.parseInt(request.getParameter("signatureId"));	
	//String cNumber = session.getAttribute("patient_card_number").toString();
	
	//System.out.println("mahder !the card num is : "+cNumber);
	//PatientPhoto pPhoto = PatientPhoto.getPatientPhotoFor(cNumber);
	//EmployeePhoto empPhoto = EmployeePhoto.getEmployeePhotoFor(employeeId);
	Signature signature = Signature.getSignature(signatureId);
	byte[] byteArray = null;
	
	InputStream sImage = signature.getIns();
	OutputStream o = null;
	o = response.getOutputStream();	
	
	//System.out.println("inside showimage.jsp: "+sImage);
	int size = 0;
	//System.out.println("the size is available : "+sImage.available());
	
	if(sImage != null){
		try{
			byteArray = new byte[sImage.available()];		
						response.reset();
						response.setContentType("image/jpg");			
						
			while((size = sImage.read(byteArray))!= -1 ){				
				o.write(byteArray,0,size);		
				System.out.println("drawing the pic");
			}//end while loop
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			byteArray = null;
			//response.resetBuffer();
		}
	}else{
		//dont forget to put a no image available picture here!
		out.print("no pic mahder");
	}
		
%>
