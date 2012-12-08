<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "black";
	String dbPassword = "mustache";
	
	Class.forName("com.mysql.jdbc.Driver");
	request.setCharacterEncoding("utf-8");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	int user1 = Integer.parseInt(session.getAttribute("id").toString());
	int user2 = Integer.parseInt(request.getParameter("friendId"));
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO friend(user1, user2) " +
					"VALUES(?, ?)"
					);
			stmt.setInt(1,  user1);
			stmt.setInt(2,  user2);

			result = stmt.executeUpdate();
			
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
			}else{
				stmt = conn.prepareStatement("select * from users where userid=?");
				rs = stmt.executeQuery();
				if(rs.next()){
					rs.getString("userid");
				}
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
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
			<jsp:param name="current" value="show" />
		</jsp:include>
		<div id="center">
			<% if (errorMsgs.size() > 0) { %>
 			<div class="alert alert-error">
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
 			</div>
		 	<div class="form-action">
		 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (result == 1) { %>
	 		<div class="alert alert-success">
	 			<b><%=rs.getString("userid") %></b>님이 등록되었습니다.
	 		</div>
		 	<div class="form-action">
		 		<a href="main.jsp" class="btn">메인으로</a>
		 	</div>
	 		
	 	<%}%>
		</div>
	</div>
</body>
</html>