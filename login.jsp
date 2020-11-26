<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<html lang="en"> 
<head>
              <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <meta name="Generator" content="EditPlus®"> 
              <meta name="Author" content=""> 
              <meta name="Keywords" content=""> 
              <meta name="Description" content=""> 
              <title>登陆界面</title> 
              <style type="text/css"> 
             *{
                    margin: 0px;
                    padding: 0px; 
              }
              body{
                    background-color: #A2B5CD;
                   }
              .bdh{
				    width:580px;
				    height:500px;
				    margin:10px auto;
				    border:1px solid #fff;
				    background: url("other/image/back.jpg");
				    background-size:100% 100%;
				    border-radius: 50% 50%;
			       }
                                                                                                                          
               .container {
                              width: 60%;
                              margin: 0 auto;
                          }
               .container h1 {
                                 text-align: center;
                                 color: #FFFFFF;
                                 font-weight: 500;
                                                   }
               .container input {
                                 width: 320px;
                                 display: block;
                                 height: 36px;
                                 border: 0;
                                 outline: 0;
                                 padding: 6px 10px;
                                 line-height: 24px;
                                 margin: 32px auto;
                                 -webkit-transition: all 0s ease-in 0.1ms;
                                 -moz-transition: all 0s ease-in 0.1ms;
                                 transition: all 0s ease-in 0.1ms;
                                 }
               .container input[type="text"] , .container input[type="password"]  {
                                 background-color: #FFFFFF;
                                 font-size: 16px;
                                 color: #50a3a2;
                                 }
               .container input[type='submit'] {
                                 font-size: 16px;
                                 letter-spacing: 2px;
                                 color: #666666;
                                 background-color: #FFFFFF;
                                                }
               .container input:focus {
                                          width: 400px;
                                      }
              .container input[type='submit']:hover {
                                                       cursor: pointer;
                                                       width: 400px;
                                                    }
  </style> 
  <%
if("login_error".equals(request.getParameter("message"))){ %>

<script type="text/javascript">
    alert("用户名或者密码错误！");
</script>

<%}else{%>
    <!-- 没有收到任何错误信息 -->
<% }%>
</head> 
<body> 
<form action="loginAction.jsp" method="post">   
    <!-- <canvas id="c_n9" width="1366" height="403" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.5;"></canvas> -->
    <script type="text/javascript" src="test-clear.js" opacity= 0.6></script>
       <div class="bdh">
			<div class="container">
				<h1 style="color: white; margin: 0; text-align: center">Sign up</h1>
       
                    <label><input type="text" name="username" placeholder="input your name"/></label>
                    <label><input type="password" name="password" placeholder="input your password" /></label>
                    <label><input type="password" name="repassword" placeholder="please affirm" /></label>
 
                    <input type="submit" name="btnLogin" id="btnLogin" value="Sign up"/>
                    <p class="change_link" style="text-align: center">
                    </p>
</form>
            </div>
       </div>
</body> 
</html>