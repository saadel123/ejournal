<%-- 
    Document   : changermdp
    Created on : Jun 7, 2021, 3:37:14 PM
    Author     : saad
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

            <%if (request.getAttribute("msg") != null) {%>

            <div style="margin: auto; position: relative; width: 50%"class="alert alert-<%=request.getAttribute("typemsg").toString().equals("error") ? "danger" : "primary"%> role="alert">
                 <%=request.getAttribute("msg")%>
        </div>
        <% }%>

        <div id="loginbox" style="margin-top: 50px;" class="mainbox col-lg-6 offset-md-3 col-md-8 offset-sm-2">
            <div class="card card-inverse card-info">
                <div class="card-header">
                    <div class="card-title">Formulaire Changment du mot de passe</div>
                </div>
                <div style="padding-top: 30px;" class="card-block">
                    <div style="display: none;" id="login-alert" class="alert alert-danger col-md-12"></div>
                    <form id="loginform" class="" role="form" method="post" action="/eJournal/ChangerMdp">

                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup">Ancien mot de passe</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Ancien mot de passe</div>
                                </div>
                                <input type="password" name="ancmdp" class="form-control" id="inlineFormInputGroup" placeholder="entrer Ancien mot de passe" required="">
                            </div>
                        </div>
                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup">Nouveau Mot de passe</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Nouveau Mot de passe</div>
                                </div>
                                <input type="password" name="mdp" class="form-control" id="inlineFormInputGroup" placeholder="entrer mot de passe" required="">
                            </div>
                        </div>

                        <div class="col-auto">
                            <label class="sr-only" for="inlineFormInputGroup">Confirmation du Mot de passe</label>
                            <div class="input-group mb-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Confirmation du Mot de passe</div>
                                </div>
                                <input type="password" name="mdp2" class="form-control" id="inlineFormInputGroup" placeholder="Confirmation" required="">
                            </div>
                        </div>

                        <div style="margin-top: 10px;" class="form-group">
                            <!-- Button -->
                            <div class="col-md-12 controls">
                                <button type="submit" id="btn-login" href="#" class="btn btn-success">Changer le mot de passe </button>

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
