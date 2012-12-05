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
	
	
	String userid ="";
	String content = "";

	userid = request.getParameter("userid");
	content = request.getParameter("content");
			
			
	Class.forName("com.mysql.jdbc.Driver");
	
	
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	stmt = conn.prepareStatement("SELECT * FROM comment");
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
    <jsp:include page="include/header.jsp" flush="true">
			<jsp:param name="current" value="about" />
		</jsp:include>
    <div id="center">
      <div id="about">
        <div id="big">
          Magnetic Board ?
          <div id="mag_bar">
          </div>
        </div>
          : 사진공유를 기반으로 한 SNS 서비스
          <br><br><br>
        <div id="big2">
          Black Mustache ?
          <div id="black_bar">      
          </div>
        </div>
         : 명지대학교 컴퓨터공학과 웹 프로그래밍 5조 조원<br>　최진욱, 황철재, 안다희, 서혜인, 이현선
      </div>
      
      <%
   
      if(session.getAttribute("id") !=null){
      %>
    
   
      <form  id="co" method ="post" action = "comment.jsp" >
      	
 						 댓글달기 <textarea name ="content"></textarea>
        
      		<input type = "submit" value = "작성">
      </form>
      
     
         <%
      }
      
   	while (rs.next())
   	
   	{
  		%>
  		<div id = "seeco">
			<ul>
			<li>
			<%=session.getAttribute("userid")%>님의
  		댓글: <%= rs.getString("content")%>
  		</li>
  		</ul>
  		</div>

  		<%
  		} %>

</div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
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
