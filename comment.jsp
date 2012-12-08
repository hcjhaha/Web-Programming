<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
    import="org.apache.commons.lang3.StringUtils"%>

<%

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/wp?chractersetEncoding=utf-8";
String dbUser = "black";
String dbPassword = "mustache";
request.setCharacterEncoding("utf-8");

try{
	
	String userid = "";
	String content = "";
	String comment = "";
	String id = "";
	
	id = request.getParameter("photoid");
	comment = request.getParameter("comment");
			
	Class.forName("com.mysql.jdbc.Driver");

	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	stmt = conn.prepareStatement(
			"INSERT INTO comment (photoid, comment, userid) " +
					"VALUES(?,?,?)"
					);
	
	stmt.setString(1,  id);
	stmt.setString(2,  comment);
	stmt.setString(3,  (String)request.getSession().getAttribute("userid"));

	stmt.executeUpdate();
	
	%>
	<jsp:forward page="main.jsp"></jsp:forward>
	<%
	
	
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

%>
