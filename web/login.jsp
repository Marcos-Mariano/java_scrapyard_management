<%-- 
    Document   : login
    Created on : 26/05/2019, 13:56:24
    Author     : Marcos
--%>
<%@page import="br.com.fatecpg.jdbc.User"%>
<%
    String errorMessage = null;
    if(request.getParameter("loginForm")!=null){
        try{
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            User u = User.getUser(login, password);
            
            if( u != null){
                session.setAttribute("login",u.getLogin());
                session.setAttribute("name",u.getName());
                session.setAttribute("role",u.getRole());
                response.sendRedirect("home.jsp");
            }else{ 
                errorMessage = "Usuário ou senha inválido(s)";
            }
        }catch(Exception e){
            errorMessage = e.getMessage();
        }
    }else if(request.getParameter("logoffForm")!=null){
        session.removeAttribute("login");
        session.removeAttribute("name");
        session.removeAttribute("role");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="css/site.css">   
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  
 


<title>Scrapy - Login</title>
    </head>





<div class="container py-5">
    <div class="row">
        <div class="col-md-12">
            
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <center> <image src="images/logo.jfif"></center>
                    <!-- form card login -->
                    <div class="card rounded-0">
                        
                        <div class="card-header">
                            <h3 class="mb-0 text-center">Entre com seus dados!</h3>
                        </div>
                        <%if(errorMessage != null){%>
<div class="alert alert-danger" role="alert">
    <center> Usuário ou Senha Inválidos!</center>
</div>
<%}%>
                        <div class="card-body">
                            <form class="form" role="form" autocomplete="off" id="formLogin" novalidate="" method="POST">
                                <div class="form-group">
                                    <label for="uname1">Usuário</label>
                                    <input type="text" class="form-control form-control-lg rounded-0" name="login" id="uname1" required>
                                   
                                </div>
                                <div class="form-group">
                                    <label>Senha</label>
                                    <input type="password" name="password" class="form-control form-control-lg rounded-0" id="pwd1" required autocomplete="new-password">
                                    
                                </div>
                                
                                <button type="submit" class="btn btn-dark btn-block" name="loginForm" id="btnLogin">Entrar</button>
                            </form>
                        </div>
                        <!--/card-block-->
                    </div>
                    <!-- /form card login -->

                </div>


            </div>
            <!--/row-->

        </div>
        <!--/col-->
    </div>
    <!--/row-->
</div>
<!--/container-->

