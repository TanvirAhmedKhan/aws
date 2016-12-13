<%@ page import="java.io.ByteArrayInputStream"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.List"%>
<%@ page import="com.amazonaws.auth.AWSCredentials"%>
<%@ page import="com.amazonaws.auth.BasicAWSCredentials"%>
<%@ page import="com.amazonaws.services.s3.AmazonS3"%>
<%@ page import="com.amazonaws.services.s3.AmazonS3Client"%>
<%@ page import="com.amazonaws.services.s3.model.Bucket"%>
<%@ page import="com.amazonaws.services.s3.model.CannedAccessControlList"%>
<%@ page import="com.amazonaws.services.s3.model.ObjectMetadata"%>
<%@ page import="com.amazonaws.services.s3.model.PutObjectRequest"%>
<%@ page import="com.amazonaws.services.s3.model.S3ObjectSummary"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*" %>
<%@ page import="com.amazonaws.AmazonClientException" %>
<%@ page import="com.amazonaws.auth.profile.ProfileCredentialsProvider" %>
<%@ page import="com.amazonaws.services.s3.transfer.TransferManager" %>
<%@ page import="com.amazonaws.services.s3.transfer.Upload" %>
<%@ page import="com.amazonaws.services.s3.AmazonS3Client" %>
<%@ page import="com.amazonaws.services.s3.iterable.S3Versions" %>
<%@ page import="com.amazonaws.services.s3.model.ObjectListing" %>
<%@ page import="com.amazonaws.services.s3.model.S3ObjectSummary" %>
<%@ page import="com.amazonaws.util.StringUtils"%>
<%@ page import="com.amazonaws.services.s3.model.GetObjectRequest"%>
<%@ page import="java.sql.*"%>
<HTML>
<head>
<TITLE>Display file upload form to the user</TITLE>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
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
 <li ><a href="index.jsp">Home</a></li>
 <li class="active"><a href="album.jsp">Album</a></li>
 </ul>
 </div><!-- /.navbar-collapse -->
 </div><!-- /.container-fluid -->
</nav>
<div class="container">

<%
try{	
	   String url = "jdbc:mysql://tanvirdb1.ckjlrrjsd2wg.ap-southeast-2.rds.amazonaws.com:3306/";
	   String userName = "tanvirdb1";
	   String password = "tanvirdb1";
	   String dbName = "tanvirdb1";
	   Class.forName("com.mysql.jdbc.Driver").newInstance();
	   Connection connection = DriverManager.getConnection(url + dbName, userName, password);
	   Statement statement = connection.createStatement();
	   String command = "SELECT * FROM tanvirdb1.description";
       ResultSet resultSet =  statement.executeQuery(command);
       
       String bucketPath = "https://s3-ap-southeast-2.amazonaws.com/tanvirahmedkhan/";
  	   AWSCredentials credentials = new BasicAWSCredentials("AKIAI26XHZ7D27EOM5BQ",
  							"6ydv0s5De4vAlWEVZNsurlUhq7wnfK7DXup0pR9m");
  	   AmazonS3Client s3 = new AmazonS3Client(credentials);
  	   ObjectListing photos = s3.listObjects("tanvirahmedkhan");
  	   
  	   out.println("</br></br>");
  	   
  	 ResultSetMetaData metaData = resultSet.getMetaData();
  	 out.println("<div class='row'>");
       while(resultSet.next()){
    	   out.println("<div class='col-md-3'><img style='height:250px;width:100%;'src='"+bucketPath+resultSet.getObject(2)+"' /><div><div style='padding:8px 5px 8px 5px;background-color:#feff41; font-size:20px; color:#00000;'>"+resultSet.getObject(1)+"</div></div></div>");
       }
       out.println("</div>"); 
       
	   
	}
	 catch(SQLException ex){
	 	ex.printStackTrace();
	 	}		

	 
	 
	 
	  

%>
</div>

</BODY>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</HTML>