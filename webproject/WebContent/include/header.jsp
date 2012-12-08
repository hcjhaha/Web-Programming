<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" import="org.apache.commons.lang3.StringUtils" %>

<%
String[] names = {"Animal", "Car", "Fashion","Food","Humor","Nature","People","Sports","Extra"};
%>
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
     <a href="main.jsp">Home</a> | <a href="about.jsp">About</a> |  
     <% if(session.getAttribute("userid") == null) {%>
     <a href="login.jsp">Login</a> | <a href="signup.jsp">Sign up</a> 
     <%}else{ %>
     <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=session.getAttribute("username")%>님</a> |
     	<ul class="dropdown-menu">
     		<li><a href="show.jsp?id=<%=session.getAttribute("id")%>">Mypage</a></li>
     		<li><a href="#">Friend</a></li>
     		<li><a href="#">Message</a></li>
     	</ul> 
     <a href="photo.jsp">Upload</a> | <a href="logout.jsp">Logout</a>
     <%} %>
  </div>
</div>
<div id="navbar">
  <div class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category</a> |
      <ul class="dropdown-menu">
   
		<% for(String name : names){ %>
			<li><a href="show_.jsp?category=<%=name %>"><%=name%></a></li>
		
		<%} %>
      </ul>
    <a href="time.jsp">Newest</a>
  </div>
</div>