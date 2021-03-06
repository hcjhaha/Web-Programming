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
      <div id="header">
        <div id="head_top">
          <div id="head_top_right">
            <form class="form-search">
              <div class="input-append">
                <input type="text" class="span2 search-query">
                <button type="submit" class="btn">Search</button>
              </div>
            </form>
          </div>
          <div id="head_top_left">
          </div>
        </div>
        <div id="head_mid">
          <a href="main.jsp"><img src="img/logo.jpg" alt="logo"></a>
        </div>
        <div id="head_bot">
           <a href="about.jsp">About?!</a> | <a href="login.jsp">Login</a> | <a href="signup.jsp">Sign up</a>
        </div>
      </div>
      <div id="navbar">
        <div class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category</a> |
            <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
              <li><a href="Animal.html">Animal</a></a></li>
              <li><a href="Car.html">Car</a></li>
              <li><a href="Fashion.html">Fashion</a></li>
              <li><a href="Food">Food</a></li>
              <li><a href="Humor.html">Humor</a></li>
              <li><a href="Nature.html">Nature</a></li>
              <li><a href="People.html">People</a></li>
              <li><a href="Sports.html">Sports</a></li>
              <li><a href="Extra.html">Extra</a></li>
            </ul>
          <a href="#">Newest</a>
        </div>
      </div>
      <div id="center">
      </div>
      <div id= "footer">
        Designed by Black Mustache
      </div>
    </div>
  </body>
</html>