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

	String userid;
	String pwd;
	String name;
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
    <style>.error {background:#936; color:#fff; padding:10px; }</style>
  </head>
  <body>
    <div id="body_wrap">
		<jsp:include page="include/header.jsp" flush="true">
  		<jsp:param name="current" value="Sign Up"/>
		</jsp:include>
		 	<div id="center">
      <%
      if (request.getMethod() == "POST") {
          String id = request.getParameter("loginid");
          String password = request.getParameter("loginpassword");
          
    		try {
    			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    			stmt = conn.prepareStatement("SELECT * FROM users WHERE userid=?");
    			stmt.setString(1, id);
    			
    			rs = stmt.executeQuery();
  
    			rs.next();
    			userid = rs.getString("userid");
    			password = rs.getString("pwd");
    			name = rs.getString("name");
    	  
    		    if (id == null || password == null || id.length() == 0 || password.length() == 0) {
       %>
           <div class="error">아이디와 비밀번호를 입력하세요.</div>
          <%
       			} else if (id.equals("userid") && password.equals("pwd")) {
          // 로그인 성공
          %>
           <div class="error">로그인완료</div>
          <%
            session.setAttribute("userid", userid);
            session.setAttribute("username", name); 
            response.sendRedirect("main.jsp");       
      	   	} else {
          %>
           <div class="error">아이디나 비밀번호가 잘못되었습니다.</div>
          <%
        		}
   			} catch (SQLException e) {
   			} finally {
   					if (rs != null) try{rs.close();} catch(SQLException e) {}
   					if (stmt != null) try{stmt.close();} catch(SQLException e) {}
   					if (conn != null) try{conn.close();} catch(SQLException e) {}
  		}
     			}
      	%>
	      <form class="form-horizontal" id="form-login" method="post">
	        <div class="control-group">
	          <label class="control-label" for="ID">ID</label>
	            <div class="controls">
	              <input type="text" id="inputID" placeholder="ID" name="loginid">
	            </div>
	        </div>
	        <div class="control-group">
	          <label class="control-label" for="inputPassword">Password</label>
	            <div class="controls">
	              <input type="password" id="inputPassword" placeholder="Password" name="loginpassword">
	            </div>
	        </div>
	        <div class="control-group">
	          <div class="controls">
	            <label class="checkbox">
	              <input type="checkbox"> Remember me
	            </label>
	            <input type="submit" class="btn" value="로그인">
	            <a href="signup.jsp" class="btn">
	            	회원가입
	           	</a>
	          </div>
	        </div>
	      </form>
      </div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>
