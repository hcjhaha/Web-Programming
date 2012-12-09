<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String[] categories = {"Animal", "Car", "Fashion", "Food", "Humor", "Nature", "People", "Sports", "Extra"};
	String errorMsg = null;	
	String actionUrl;
	
	Connection conn = null;	
	PreparedStatement stmt = null;	
	ResultSet rs = null;
	request.setCharacterEncoding("UTF-8");
	String dbUrl = "jdbc:mysql://localhost:3306/wp?chractersetEncoding=utf-8";
	String dbUser = "black";	
	String dbPassword = "mustache";
	
	String photourl = "";
	String title = "";
	String content = "";
	String category = "";
	String log_userid  = "";
	String userid = "";
	
	if(session.getAttribute("userid") != null){log_userid = session.getAttribute("userid").toString();}
	
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	
	if (id > 0) {
		actionUrl = "photoupdate.jsp";
		try {
		 	Class.forName("com.mysql.jdbc.Driver");
	
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	stmt = conn.prepareStatement("SELECT * FROM photo WHERE id = ?");
	stmt.setInt(1, id);
	
	rs = stmt.executeQuery();
	
	if (rs.next()) {
		photourl = rs.getString("photourl");
		title = rs.getString("title");
		content = rs.getString("content");
		category = rs.getString("category");
		userid = rs.getString("userid");
	}
		}catch (SQLException e) {
	errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
	if (rs != null) try{rs.close();} catch(SQLException e) {}
	if (stmt != null) try{stmt.close();} catch(SQLException e) {}
	if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}else {
		actionUrl = "photoup.jsp";
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Magnetic Board</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="bootstrap.min.css" rel="stylesheet" media="screen">
<meta charset="utf-8">
<style>
#center_in {
	margin: 0 auto;
	width: 250px;
}

#center div textarea,input {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div id="body_wrap">
		<jsp:include page="include/header.jsp" flush="true">
			<jsp:param name="current" value="photoup" />
		</jsp:include>
		<%
			if (errorMsg != null && errorMsg.length() > 0 ) {
		    	 		out.print("<div class='alert'>" + errorMsg + "</div>"); 
		    	 		}
		%>
		<div id="center">
		<%
     if(session.getAttribute("userid") != null){
    %>
			<form class="form-horizontal" name="uploadForm" action="<%=actionUrl %>"
				enctype="multipart/form-data" method="post">
			<%
				if (id > 0) {
					out.println("<input type='hidden' name='id' value='"+id+"'>");
				}
			%>					
					<div id="center_in">
						<div id="previewId"></div>
						<div>
							<input type="file" class="file" name="inputpath" id="fileup"
								onchange="previewImage(this,'previewId')" value="">
						</div>
						<div>
							<label for="title">Title</label> <input type="text"
								name="inputtitle" size="20" value="<%=title %>"/>
						</div>
						<div>
							<label for="photo_content">Content</label>
							<textarea name="inputcontent" cols="10" rows="7"><%=content %></textarea>
						</div>
						<div>
							<label for="photo_category"></label> <select name="inputcategory">
								<%
									for(String categoryName: categories) {
														out.print("<option");
														if (categoryName.equals(category)) {
															out.print(" selected");
														}
														out.println(">"+categoryName+"</option>");	
													}
								%>
							</select>
						</div>
						<div id="photobutton">
							<a href="main.jsp" class="btn">메인으로</a>
							<%
								if (id <= 0) {
							%>
							<input type="submit" class="btn" value="등록" id="photosub">
							<%
								} else{
							%>
							<input type="submit" class="btn" value="수정">
						<%  } %>
						</div>
					</div>
				</form>
			<%} %>
		</div>
		<jsp:include page="include/footer.jsp" flush="true"></jsp:include>
	</div>
</body>


<script type="text/javascript">
	function previewImage(targetObj, previewId) {

		var preview = document.getElementById(previewId);
		var ua = window.navigator.userAgent;

		if (ua.indexOf("MSIE") > -1) {

			targetObj.select();

			try {
				var src = document.selection.createRange().text;
				var ie_preview_error = document
						.getElementById("ie_preview_error_" + previewId);

				if (ie_preview_error) {
					preview.removeChild(ie_preview_error);
				}

				var img = document.getElementById(previewId);

				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
						+ src + "', sizingMethod='scale')";
			} catch (e) {
				if (!document.getElementById("ie_preview_error_" + previewId)) {
					var info = document.createElement("<p>");
					info.id = "ie_preview_error_" + previewId;
					info.innerHTML = "a";
					preview.insertBefore(info, null);
				}
			}
		} else {
			var files = targetObj.files;
			for ( var i = 0; i < files.length; i++) {

				var file = files[i];

				var imageType = /image.*/;
				if (!file.type.match(imageType))
					continue;

				var prevImg = document.getElementById("prev_" + previewId);
				if (prevImg) {
					preview.removeChild(prevImg);
				}

				var img = document.createElement("img");
				img.id = "prev_" + previewId;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '50px';
				img.style.height = '50px';

				preview.appendChild(img);

				if (window.FileReader) {
					var reader = new FileReader();
					reader.onloadend = (function(aImg) {
						return function(e) {
							aImg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				} else {
					if (!document.getElementById("sfr_preview_error_"
							+ previewId)) {
						var info = document.createElement("p");
						info.id = "sfr_preview_error_" + previewId;
						info.innerHTML = "not supported FileReader";
						preview.insertBefore(info, null);
					}
				}
			}
		}
	}
</script>
</html>
