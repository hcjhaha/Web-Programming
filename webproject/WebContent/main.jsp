<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "black";
	String dbPassword = "mustache";
	
	int pageNo = 1;
	
	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}
	
	int numInPage = 3;											
	int startPos = (pageNo - 1) * numInPage; 
	int numItems, numPages;
	
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
  		<jsp:param name="current" value="main"/>
		</jsp:include>
      <div id="center">
		      	<%
		 	try {
		    Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		 		
				stmt = conn.createStatement();
				
		 		rs = stmt.executeQuery("SELECT COUNT(*) FROM photo");
				rs.next();
				numItems = rs.getInt(1);
				numPages = (int) Math.ceil((double)numItems / (double)numInPage);
				rs.close();
				stmt.close();
				
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM photo ORDER BY id DESC LIMIT " + startPos + ", " + numInPage);
				String gender;
		 	%>

				<table class="table table-bordered table-stripped">
					<tr>
					<%
						while(rs.next()) {
					%>
						<div id="photolist">
							<a href="photoshow.jsp?id=<%=rs.getInt("id")%>">
								<img src="/wp/uploadpicture/<%=rs.getString("photourl")%>" alt="" width=300 height=200>
							</a>
						</div>
						<%
						}
					%>
					</tr>
				</table> 
		
				<div class="pagination pagination-centered">
		      <ul>
		      	<%
		      	// 페이지 네비게이션을 위한 준비
		      	int startPageNo, endPageNo;
		      	int delta = 5;
		      	startPageNo = (pageNo <= delta) ? 1: pageNo - delta;
		      	endPageNo = startPageNo + (delta * 2) + 1;
		      	
		      	if (endPageNo > numPages) {
		      		endPageNo = numPages;
		      	}
		      	
		      	if (pageNo <= 1) { 
		      	%>
		        	<li class="disabled"><a href="#">&laquo;</a></li>
		        <% 
		      	} else {
		        %>
		        	<li><a href="main.jsp?page=<%= pageNo - 1%>">&laquo;</a></li>
		        <%
		        } 
		      	
		        String className = "";
		        for(int i = startPageNo; i <= endPageNo; i++) {
		        	className = (i == pageNo) ? "active" : "";
		        	out.println("<li class='" + className + "'>");
		        	out.println("<a href='main.jsp?page=" + i + "'>" + i + "</a>");
		        	out.println("</li>");
		        }
		        
		        // 다음 페이지로
		      	if (pageNo >= numPages) { 
		      	%>
		        	<li class="disabled"><a href="#">&raquo;</a></li>
		        <% 
		      	} else {
		        %>
		        	<li><a href="main.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
		        <%
		        } 
		        %>
		     </ul>
		    </div>
				<%
				} catch (SQLException e) {
					out.print("<div class='alert'>" + e.getLocalizedMessage() + "</div>");
				}finally {
					if (rs != null) try{rs.close();} catch(SQLException e) {}
					if (stmt != null) try{stmt.close();} catch(SQLException e) {}
					if (conn != null) try{conn.close();} catch(SQLException e) {}
				}
				%>
      </div>
		<jsp:include page = "include/footer.jsp" />
    </div>
  </body>
</html>