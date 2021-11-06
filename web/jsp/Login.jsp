<%-- 
    Document   : Login
    Created on : Mar 3, 2020, 12:40:53 AM
    Author     : mehdierror404
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="entete.jsp"></jsp:include>

            <% if(session.getAttribute("j")!=null){
                request.getRequestDispatcher("/jsp/mesArticles.jsp").forward(request, response);
            }
                if (request.getAttribute("msg") != null) {%>

            <div style="margin: auto; position: relative; width: 50%"class="alert alert-<%=request.getAttribute("typemsg").toString().equals("error") ? "danger" : "primary"%> role="alert">
                 <%=request.getAttribute("msg")%>
        </div>
        <% }%>



        <div id="loginbox" style="margin-top: 50px;" class="mainbox col-lg-6 offset-md-3 col-md-8 offset-sm-2">
            <div class="card card-inverse card-info">
                <div class="card-header">
                    <div class="card-title">Formulaire D'authentification</div>
                </div>

                <div style="padding-top: 30px;" class="card-block">
                    <div style="display: none;" id="login-alert" class="alert alert-danger col-md-12"></div>
                    <form id="loginform" class="" role="form" method="post" action="/eJournal/Login">

                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup">Login</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Login</div>
                                </div>
                                <input type="text" name="login" class="form-control" id="inlineFormInputGroup" placeholder="entrer login" required="">
                            </div>
                        </div>
                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup">Mot de passe</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Mot de passe</div>
                                </div>
                                <input type="password" name="mdp" class="form-control" id="inlineFormInputGroup" placeholder="entrer mot de passe" required="">
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="form-check">
                                <label>
                                    <input id="login-remember" type="checkbox" name="remember" value="1" />Se rappeler de moi</label>
                            </div>
                        </div>
                        <div style="margin-top: 10px;" class="form-group">
                            <!-- Button -->
                            <div class="col-md-12 controls">
                                <button type="submit" id="btn-login" href="#" class="btn btn-success">Login  </button>
                                <a id="btn-fblogin"
                                   href="#" class="btn btn-danger">Annuler</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-12 control">
                                <div style="padding-top: 15px; font-size: 85%;">Mot de passe oublié? <a href="/eJournal/jsp/recupererMdp.jsp" > Recuperer le ici!!

                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>











        <jsp:include page="pied.jsp"></jsp:include>
    </div>
</body>
</html>
