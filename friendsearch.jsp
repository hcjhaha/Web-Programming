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

				String actionUrl = "";
				String errorMsg = null;
				String userid = "";
				String search = request.getParameter("search");

				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				if (id >= 0) {
					try {
						Class.forName("com.mysql.jdbc.Driver");

						conn = DriverManager.getConnection(dbUrl, dbUser,
								dbPassword);

						stmt = conn
								.prepareStatement("SELECT * FROM users WHERE userid like ?");
						search = "%" + search + "%";
						stmt.setString(1, search);
						rs = stmt.executeQuery();
			%>
			<div>
				<h3>친구찾기결과</h3>
				<ul>
					<%
						while (rs.next()) {
					%>
					<li>User ID: <%=rs.getString("userid")%> 
					
					<a
						href="addfriend.jsp?friendId=<%=rs.getInt("id")%>"
						class="btn btn-mini"> 친구 등록 </a>
					</li>
					<%
						}
							} catch (SQLException e) {
							} finally {
								if (rs != null)
									try {
										rs.close();
									} catch (SQLException e) {
									}
								if (stmt != null)
									try {
										stmt.close();
									} catch (SQLException e) {
									}
								if (conn != null)
									try {
										conn.close();
									} catch (SQLException e) {
									}
							}
						}
					%>

				</ul>
			</div>
		</div>
	</div>

</body>
</html>