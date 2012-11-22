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
          <form class="form-horizontal" id="form-login">
            <div class="control-group">
              <label class="control-label" for="ID">ID</label>
                <div class="controls">
                  <input type="text" id="inputID" placeholder="ID">
                </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">Password</label>
                <div class="controls">
                  <input type="password" id="inputPassword" placeholder="Password">
                </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <label class="checkbox">
                  <input type="checkbox"> Remember me
                </label>
                <a href="#"><button type="submit" class="btn">사진등록</button></a>
              </div>
            </div>
          </form>
      </div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>
