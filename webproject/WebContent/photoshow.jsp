<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String errorMsg = null;

	String actionUrl;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp?chractersetEncoding=utf-8";
	String dbUser = "black";
	String dbPassword = "mustache";

	String photoid = "";
	photoid = request.getParameter("id"); //리퀘스트 받는값
	
	String photourl = "";
	String title = "";
	String content = "";
	String category = "";
	String userid = "";
	String log_userid = "";

	if (session.getAttribute("userid") != null) {
		log_userid = session.getAttribute("userid").toString();
	}

	int id = 0;
	
	try {
		id = Integer.parseInt(photoid);
	} catch (Exception e) {
	}

	if (id > 0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);

			stmt = conn
					.prepareStatement("SELECT * FROM photo WHERE id = ?");
			stmt.setInt(1, id);

			rs = stmt.executeQuery();

			if (rs.next()) {
				photourl = rs.getString("photourl");
				title = rs.getString("title");
				content = rs.getString("content");
				category = rs.getString("category");
				userid = rs.getString("userid");
			}
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
		}
	} else {
		errorMsg = "Error";
	}

	try {

		String comment = "";

		comment = request.getParameter("comment");
		
		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		stmt = conn.prepareStatement("SELECT * FROM comment WHERE photoid =?");
		stmt.setString(1 , photoid);
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
</head>
<body>

	<div id="body_wrap">
		<jsp:include page="include/header.jsp">
			<jsp:param name="current" value="show" />
		</jsp:include>
		<div id="center">
			<%
				if (errorMsg != null && errorMsg.length() > 0) {
						out.print("<div class='alert'>" + errorMsg + "</div>");
					} else {
			%>
			<div id="titi">
				<h2>
					작성자 :
					<%=userid%></h2>
				<h2>
					제목 :
					<%=title%></h2>
				<table>
					<tr>
						<td>사진</td>
					</tr>
					<tr>
						<td><img src="/wp/uploadpicture/<%=photourl%>" alt=""
							width="300" height="200"></td>
					</tr>
					<tr>
						<td>내용 : <%=content%></td>
					</tr>
					<tr>
						<td>카테고리 : <%=category%></td>
					</tr>
				</table>
			</div>
			
			<%
				}
			%>
			<%
				while (rs.next())

					{
			%>

			<div id="seeco">
				<ul>
					<li><%=rs.getString("userid")%>님 댓글: <%=rs.getString("comment")%>
						작성시간 : <%=rs.getString("created_at")%></li>
				</ul>
			</div>
			<%} 
				
			%>
			<%
				if (session.getAttribute("id") != null) {
			%>

			<form id="co" method="post" action="comment.jsp">
				댓글달기 : <input type="text" name="comment"> <input
					type="submit" value="작성" class="btn"> <input type="hidden"
					value="<%=id%>" name="photoid">
			</form>
			<%
				}
			%>

			<div id="titibuton">
				<div class="form-actions">
					<a href="main.jsp" class="btn">목록으로</a>
					<%
						if (log_userid.equals(userid)) {
					%>
					<a href="photo.jsp?id=<%=id%>" class="btn btn-primary">수정</a> <a
						href="#" class="btn btn-danger" data-action="delete"
						data-id="<%=id%>">삭제</a>
					<%
						}
					%>
				</div>
			</div>
			<script>
				$("a[data-action='delete']").click(
						function() {
							if (confirm("정말로 삭제하시겠습니까?")) {
								location = 'photodelete.jsp?id='
										+ $(this).attr('data-id');
							}
							return false;
						});
			</script>
		</div>
		<jsp:include page="include/footer.jsp" />
	</div>
</body>
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
</html>