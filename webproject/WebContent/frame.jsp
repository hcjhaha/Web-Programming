<!DOCTYPE html>
<html>
  <head>
    <title>Magnetic Board</title>
    <link href="bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
    <style type="text/css">
    body{background: #959796 url(images/wood-repeat.jpg); } 
     ul.gallery li a {
	 float: left;
	 margin-left : 15px;
	 margin-bottom : 10px;
	 padding: 10px 10px 10px 10px;
	 background: #eee;
	 border: 1px solid #fff;
	 width : 300px;
	 height : 250px;

 }
    </style>
  </head>
  <body>
    <div id="body_wrap">
    <jsp:include page="include/header.jsp" flush="true"></jsp:include>
    <div id="center">
      <ul class="gallery"> 

	 <li><a href="#"><img src="img/animal1.jpg" alt="Photograph of a waterfall" /></li> 

	 <li><a href="#"><img src="img/animal2.jpg" alt="Photograph of clouds and sunlight" /></li> 

	 <li><a href="#"><img src="img/animal3.jpg" alt="Photograph of a lake scene at dusk" /></li> 

	 <li><a href="#"><img src="img/car1.jpg" alt="Photograph of a tree and green grass" /></li> 

	 <li><a href="#"><img src="img/car2.jpeg" alt="Photograph of a beach sunset" /></li> 

	 <li><a href="#"><img src="img/car3.jpg" alt="Photograph of a flower and lake" /></li> 

 </ul>
    </div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>