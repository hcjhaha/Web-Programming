<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" %>

<%
	String errorMsg = null;	
	String actionUrl;
	
	Connection conn = null;	
	PreparedStatement stmt = null;	
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wp";	
	String dbUser = "black";	
	String dbPassword = "mustache";
	
	String userid = "";
	String title = "";
	String content = "";
	String category = "";
	String photourl = "";
	List<String> photourllist = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		stmt=conn.prepareStatement("SELECT * FROM photo WHERE user_id =?");
	}catch(Exception e){}
	

%>

<!DOCTYPE html>
<html>
<head>
	<title>Magnetic Board</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link href="css/reset.css" rel="stylesheet" type="text/css">
	<link href="bootstrap.min.css" rel="stylesheet" media="screen">
	<meta charset="utf-8">
	<style>
	#center_in {margin: 0 auto; width: 250px;}
	#center div textarea,input {vertical-align: middle;}
	</style>
</head>
<body>
	<div id="body_wrap">
		<jsp:include page="include/header.jsp" flush="true">
			<jsp:param name="current" value="photoup"/>
		</jsp:include>
		<div id="center">
			<div id="center_in">
				<form class="form-horizontal" name="uploadForm" action="photoup.jsp" enctype="multipart/form-data" method="post">
					<div>
						<label for="photoUpload">Photo</label>
						<textarea class="v-mid" name="photoUpload" cols="15" rows="10"></textarea>
					</div>
					<div>
						<input type="file" class="file" name="photo" id="fileup">
					</div>
					<div>
						<label for="title">Title</label>
						<input type="text" name="title" size="20" />
					</div>
					<div>
						<label for="photo_content">Content</label>
						<textarea name="photo_content" cols="10" rows="7"></textarea>
					</div>
					<div>
						<label for="photo_category"></label>
						<select name="photo_category">
							<option value="choose">-category-</option>
							<option value="animal">Animal</option>
							<option value="car">Car</option>
							<option value="fashion">Fashion</option>
							<option value="food">Food</option>
							<option value="humor">Humor</option>
							<option value="nature">Nature</option>
							<option value="people">People</option>
							<option value="sports">Sports</option>
							<option value="extra">Extra</option>
						</select>
					</div>
					<div>
						<label for=""></label>
						<input type="submit" class="btn" value="Upload" name="upload" id="photosub">
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
	</div>
</body>
</html>
