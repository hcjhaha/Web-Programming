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
	request.setCharacterEncoding("utf-8");

	int id = 0;
	String pwd = "";
	String name = "";
	String loginId = request.getParameter("loginid");
	String loginPwd = request.getParameter("loginpassword");
	String actionUrl = "";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT * FROM users WHERE userid = ?");
		stmt.setString(1, loginId);
		rs = stmt.executeQuery();
		
		if (rs.next()) {
			id = rs.getInt(1);
			pwd = rs.getString(3);
			name = rs.getString(4);
		}
		
		if (loginId == null || loginPwd == null || loginId.length() == 0 || loginPwd.length() == 0) {
			actionUrl = "login.jsp";

		} else if (loginPwd.equals(pwd)) {
			session.setAttribute("id", id);
			session.setAttribute("userid", loginId);
			session.setAttribute("username", name);
			actionUrl = "main.jsp";
		} else {
			actionUrl = "login.jsp";
		}
		response.sendRedirect(actionUrl);
		
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
%>