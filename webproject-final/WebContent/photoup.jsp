<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.sql.*" 
    import="java.util.*" 
    import="com.oreilly.servlet.MultipartRequest"
    import="org.apache.commons.lang3.StringUtils"%>
<%
	String path = getServletContext().getRealPath("/uploadpicture");
	
	int sizeLimit = 5 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, path, sizeLimit);
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	request.setCharacterEncoding("utf-8");
	String dbUrl = "jdbc:mysql://localhost:3306/wp?chractersetEncoding=utf-8";
	String dbUser = "black";	
	String dbPassword = "mustache";

	
	String photourl = multi.getParameter("inputpath");
	String title = multi.getParameter("inputtitle");
	String content = multi.getParameter("inputcontent");
	String category = multi.getParameter("inputcategory");
	
	Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환
	String formName=(String)formNames.nextElement(); // 자료가 많을 경우엔 while 문을 사용
	String fileName=multi.getFilesystemName(formName); // 파일의 이름 얻기

	
	List<String> errorMsgs = new ArrayList<String>();
	
	int result = 0;
	
	if (title == null || title.trim().length() == 0) {
		errorMsgs.add("제목을 반드시 입력해주세요.");
	}
	
	if (content == null || content.trim().length() == 0) {
		errorMsgs.add("내용을 반드시 입력해주세요.");
	}
	
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"INSERT INTO photo(photourl, content, title, category, userid) " +
					"VALUES(?, ?, ?, ?,?)"
					);
			
			stmt.setString(1,  fileName);
			stmt.setString(2,  content);
			stmt.setString(3,  title);
			stmt.setString(4,  category);
			stmt.setString(5, (String)request.getSession().getAttribute("userid"));
			
			result = stmt.executeUpdate();
			
			if (result != 1) {
				errorMsgs.add("등록에 실패하였습니다.");
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
  		<jsp:param name="current" value="photoup"/>
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
		 			<b><%=session.getAttribute("username")%></b>님 사진이 등록되었습니다
		 		</div>
			 	<div class="form-action">
			 		<a href="main.jsp" class="btn">메인으로</a>
			 	</div>
	    </div>
	    <%}%>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>