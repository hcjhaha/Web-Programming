<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
  String errorMsg = null;
  List friend;
	String dbUrl = "jdbc:mysql://localhost:3306/wp?chractersetEncoding=utf-8";
	String dbUser = "black";
	String dbPassword = "mustache";
	request.setCharacterEncoding("utf-8");

	int id = 0;
	
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}

	if (id > 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			stmt = conn.prepareStatement("SELECT * FROM friend JOIN users ON friend.user2 = users.id WHERE friend.user1 = ?");
			stmt.setInt(1, id);

			rs = stmt.executeQuery();

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
<script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div id="body_wrap">
		<jsp:include page="include/header.jsp" flush="true">
			<jsp:param name="current" value="index" />
		</jsp:include>
		<div id="center">
			<% while(rs.next()){ %>
			<ul>
				<li>친구 : <%=rs.getString("users.userid") %> <a href="#" class="btn btn-danger"
					data-action="delete" data-id="<%=rs.getString("users.id")%>">삭제</a></li>
			</ul>
			<%} %>
		</div>
		<jsp:include page="include/footer.jsp" />
	</div>
</body>
<%
	} catch (SQLException e) {
	errorMsg = "SQL 에러: " + e.getMessage();
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
	}}
%>
<script>
$("a[data-action='delete']").click(function() {
	if (confirm("정말로 삭제하시겠습니까?")) {
		location = 'deletefriend.jsp?id=' + $(this).attr('data-id');
	}
	return false;
});
</script>
</html>