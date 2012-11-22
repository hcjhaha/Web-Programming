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
      	<form class="form-horizontal" id="signin">
        <div class="control-group">    
            <label class="control-label" for="inputId">ID</label>
          <div class="controls">    
            <input type="text" id="inputId" placeholder="ID">    
          </div>  
        </div>  
        <div class="control-group">   
          <label class="control-label" for="inputPassword">Password</label>
            <div class="controls">
              <input type="password" id="inputPassword" placeholder="Password">
            </div>  
        </div>
        <div class="control-group">    
            <label class="control-label" for="inputname">이름</label>
          <div class="controls">   
            <input type="text" id="inputname" placeholder="Name">    
          </div>  
        </div>
        <div class="control-group">    
            <label class="control-label" for="inputEmail">E-mail</label>
          <div class="controls">    
            <input type="text" id="inputEmail" placeholder="Email"> @ 
            <input type="text" id="inputwri" placeholder="직접입력">
            <select name="e-mail">
            <option value="mai1l">-선택하세요-</option>
            <option value="mail2">hanmail.net</option>
            <option value="mail3">naver.com</option>
            <option value="mail4">nate.com</option>
            <option value="mail5">hananet.net</option>
            <option value="mail6">hotmail.com</option>
            <option value="mail7">직접입력</option>
            </select>   
          </div>  
        </div> 
        <div class="control-group">    
            <label class="control-label" for="inputBirth">생일</label>
          <div class="controls">    
          <select name="moon" >
          <option value="mon">-선택-</option>
          <option value="mon1">1</option>
          <option value="mon2">2</option>
          <option value="mon3">3</option>
          <option value="mon4">4</option>
          <option value="mon5">5</option>
          <option value="mon6">6</option>
          <option value="mon7">7</option>
          <option value="mon8">8</option>
          <option value="mon9">9</option>
          <option value="mon10">10</option>
          <option value="mon11">11</option>
          <option value="mon12">12</option>
          </select>
          월
          <select name="day">
          <option value="da">-선택-</option>
          <option value="da1">1</option>
          <option value="da2">2</option>
          <option value="da3">3</option>
          <option value="da4">4</option>
          <option value="da5">5</option>
          <option value="da6">6</option>
          <option value="da7">7</option>
          <option value="da8">8</option>
          <option value="da9">9</option>
          <option value="da10">10</option>
          <option value="da11">11</option>
          <option value="da12">12</option>
          <option value="da13">13</option>
          <option value="da14">14</option>
          <option value="da15">15</option>
          <option value="da16">16</option>
          <option value="da17">17</option>
          <option value="da18">18</option>
          <option value="da19">19</option>
          <option value="da20">20</option>
          <option value="da21">21</option>
          <option value="da22">22</option>
          <option value="da23">23</option>
          <option value="da24">24</option>
          <option value="da25">25</option>
          <option value="da26">26</option>
          <option value="da27">27</option>
          <option value="da28">28</option>
          <option value="da29">29</option>
          <option value="da30">30</option>
          <option value="da31">31</option>
          </select>  
          일
          </div>  
        </div>  
        <div class="control-group">    
            <label class="control-label" for="inputname">핸드폰번호</label>
          <div class="controls">   
          <select name="phone">
          <option value="pon">-선택-</option>
          <option value="pon1">010</option>
          <option value="pon2">011</option>
          <option value="pon3">016</option>
          <option value="pon3">017</option>
          <option value="pon3">018</option>
          <option value="pon3">019</option>
          </select> 
          <input type="text"> 
          <input type="text">  
          </div>
        </div>     
        <div class="control-group">  
          <div class="controls">   
            <button type="submit" class="btn">회원가입</button>    
          </div>
        </div>
        </form>
      </div>
    <jsp:include page="include/footer.jsp" flush="true"></jsp:include>
    </div>
  </body>
</html>
