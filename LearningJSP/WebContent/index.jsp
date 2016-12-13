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
		 <li class="active"><a href="index.jsp">Home </a></li>
		 <li ><a href="album.jsp">Album</a></li>
		 </ul>
		 </div><!-- /.navbar-collapse -->
		 </div><!-- /.container-fluid -->
	</nav>
<body>
	<div class="container">
		<form ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD=POST>
			<h2>Upload Photo</h2>
			<div class="alert alert-success" role="alert">Choose the file
			To Upload: </div>
			<INPUT NAME="file" TYPE="file"><br/>
			<input type="text" name="des" id="des" class="form-control" required> <br/>
			<input class="btn btn-success" type="submit" value="Send File" required>
		</form>
		
	</div>
</BODY>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</HTML>