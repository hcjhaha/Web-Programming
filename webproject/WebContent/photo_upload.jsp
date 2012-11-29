<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
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
    <jsp:include page="include/header.jsp" flush="true"></jsp:include>
    <div id="center">
      <div id="photo_up">
      <form class="form-horizontal">
        <div class="control-group">    
        <table border="1">
          <tr><td colspan="2" width="500px" height="300px"></td></tr>
          <tr>
            <td>Title : <input type="text" name="photo_title"></td>
            <td>Content : <textarea name="photo_content"></textarea></td>
          </tr>
          <tr>
            <td>Category :
              <select name="photo_category">
                <option value="choose">-선택-</option>
                <option value="animal">Animal</option>
                <option value="car">Car</option>
                <option value="fashion">Fashion</option>
                <option value="food">Food</option>
                <option value="humor">Humor</option>
                <option value="nature">Nature</option>
                <option value="people">People</option>
                <option value="sports">Sports</option>
                <option value="extra">Extra</option>
              </select> 
              <td><a href="#"><button type="submit" class="btn">Upload</button></a></td>
            </td>
          </tr>
        </table>
        </div> 
      </form>
      </div>
    </div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>