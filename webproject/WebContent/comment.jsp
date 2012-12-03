<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
    import="org.apache.commons.lang3.StringUtils"%>



<%

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String dbUrl = "jdbc:mysql://localhost:3306/wp";
String dbUser = "black";
String dbPassword = "mustache";
request.setCharacterEncoding("utf-8");

try{
	
	
	String name ="";
	String content = "";

	name = request.getParameter("name");
	content = request.getParameter("content");
			
			
	Class.forName("com.mysql.jdbc.Driver");
	
	
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	stmt = conn.prepareStatement(
			"INSERT INTO comment (user_id,content) " +
					"VALUES(?,?)"
					);
	
	stmt.setString(1,  name);
	stmt.setString(2,  content);

	stmt.executeUpdate();

	response.sendRedirect("about.jsp");
	
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
