<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.*"%>
<%@ page import="com.amazonaws.auth.AWSCredentials"%>
<%@ page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@ page import="com.amazonaws.services.s3.AmazonS3"%>
<%@ page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@ page import="com.amazonaws.services.s3.model.Bucket"%>
<%@ page import="com.amazonaws.services.s3.model.CannedAccessControlList"%>
<%@ page import="com.amazonaws.services.s3.model.ObjectMetadata"%>
<%@ page import="com.amazonaws.services.s3.model.PutObjectRequest"%>
<%@ page import="com.amazonaws.services.s3.model.S3ObjectSummary"%>
<%@ page import="java.lang.Object"%>
<%@ page import="java.sql.*"%>



<HTML>
	<head>
		<TITLE>Display file upload form to the user</TITLE>
		<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<nav class="navbar navbar-default">
		 <div class="container-fluid">
		 <!-- Brand and toggle get grouped for better mobile display -->
		 <div class="navbar-header">
		 <button type="button" class="navbar-toggle collapsed" datatoggle="collapse"
		data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		 <span class="sr-only">Toggle navigation</span>
		 <span class="icon-bar"></span>
		 <span class="icon-bar"></span>
		 <span class="icon-bar"></span>
		 </button>
		 <a class="navbar-brand" href="#">Photo Album</a>
		 </div>
		 <!-- Collect the nav links, forms, and other content for toggling -->
		 <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		 <ul class="nav navbar-nav">
		 <li class="active"><a href="index.jsp">Home</a></li>
		 <li ><a href="album.jsp">Album</a></li>
		 </ul>
		 </div><!-- /.navbar-collapse -->
		 </div><!-- /.container-fluid -->
	</nav>
<body>
	<div class="container">
	<%@ page import="java.io.*"%>
    <%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
    
	
	
	<%
	        
			String about="";
		    String path="";
	        // Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Configure a repository (to ensure a secure temp location is used)
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Parse the request
			List<FileItem> items = upload.parseRequest(request);
            //  List  items = upload.parseRequest(request);

			Iterator iter = items.iterator();
			
		 	while (iter.hasNext()) {
		    	FileItem item = (FileItem) iter.next();
		
			    if (item.isFormField()) {
			
			       String name = item.getFieldName();//text1
			       String value = item.getString();
			       out.println(value);
			       about = value;
			
			     } 
		        if(!item.isFormField()){
                     String name = new File(item.getName()).getName();
                     item.write( new File("c:\\receivedPhoto" + File.separator + name));
                     AWSCredentials credentials = new BasicAWSCredentials(
							 "AKIAIxxxxxxxxxxxx",
							"6ydv0sxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
					
					 AmazonS3 s3client = new AmazonS3Client(credentials);
					
					 String bucket = "yourBucketName";
					 String fileName = name;
					 path = name;
					 String saveFile= "C:/receivedPhoto/"+name; 
					 s3client.putObject(new PutObjectRequest(bucket, fileName, new File(saveFile)).withCannedAcl(CannedAccessControlList.PublicRead));

		         }   
		     }
				 
		 	
		 	try{	
		 	   String url = "jdbc:mysql://your_Amazon_RDS_with_port_number";
		 	   String userName = "username";
		 	   String password = "password";
		 	   String dbName = "dbname";
		 	  // String driver = "com.mysql.jdbc.Driver";
		 	  Class.forName("com.mysql.jdbc.Driver").newInstance();
		 	    
		 	 //DriverManager.registerDriver(new com.mysql.jdbc.Driver());

		 	   Connection connection = DriverManager.getConnection(url + dbName, userName, password);
		 	   Statement statement = connection.createStatement();
		 	   
		 	   String command = "INSERT INTO tanvirdb1.description (about,path) VALUES ('"+about+"','"+path+"')";
		        statement.executeUpdate(command);
		        
		 	   

		 	   
		 	}
			 catch(SQLException ex){
			 	ex.printStackTrace();
			 	}	
				 

	%>							
	 
	<Br>
	 <div class="alert alert-success" role="alert">You have successfully upload the file by the name of:
	 <%%>
      
	<% %>
	 </div>
	 <% out.println("<br /> <a class='btn btn-warning' href='album.jsp'> Go to Your Album</a>"); %>
	
	 
	
	</div>
</BODY>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</HTML>