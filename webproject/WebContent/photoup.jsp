<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "black";	
	String dbPassword = "mustache";
	request.setCharacterEncoding("utf-8");
	
	String userid = request.getParameter("userid");
	String[] photourl = request.getParameterValues("photo");
	//String photourlStr = StringUtils.join(photo, ",");
	String title = request.getParameter("title");
	String content = request.getParameter("photo_content");
	String category = request.getParameter("photo_category");
%>

<!DOCTYPE html>
<html>
  <head>
    <title>Magnetic Board</title>
    <link href="bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
  </head>
  <body>
    <div id="body_wrap">
		<jsp:include page="include/header.jsp">
  		<jsp:param name="current" value="photoup"/>
		</jsp:include>
	    <div id="center">
				asdasdasd
    	</div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>