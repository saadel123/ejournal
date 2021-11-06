<%-- 
    Document   : entete
    Created on : May 24, 2021, 12:07:37 AM
    Author     : saad
--%>


<%@page import="ma.app.models.Cryptage"%>
<%@page import="ma.app.models.Compte"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ma.app.models.Journaliste"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/eJournal/bootstrap-4.4/css/bootstrap.min.css">
        <script src="/eJournal/js/a076d05399.js"></script>



        <title>eJournal</title>
    </head>
    <body>

        <%
            if (session.getAttribute("j") == null) {
                Cookie[] cks = request.getCookies();
                if (cks != null && cks.length > 0) {
                    for (Cookie c : cks) {
                        if (c.getName().equals("auth")) {
                            String[] vals = c.getValue().split("/");
                            Connection con = UtilConnexion.seConnecter();
                            PreparedStatement ps = con.prepareStatement("select * from journaliste join compte using (login) where login=? and lower(DBMS_OBFUSCATION_TOOLKIT.md5 (input => UTL_RAW.cast_to_raw(mdp)))=?");
                            ps.setString(1, vals[0]);
                            ps.setString(2, vals[1]);
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {
                                Journaliste j = new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"),
                                        rs.getString("email"), new Compte(vals[0], vals[1], rs.getString("role")));
                                HttpSession s = request.getSession();
                                s.setAttribute("j", j);
                            }
                        }
                    }

                }
            }

        %>




        <div style="background-image: url('/eJournal/img/news.jpg'); height: 210px; background-size: cover; background-position: center ">


        </div>

        <nav class="navbar navbar-expand-lg navbar-info bg-info">
            <a class="navbar-brand" style="color: white" href="/eJournal/jsp/principal.jsp"><i class='fas fa-home' style='font-size:20px'> Principal</i></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" style="font-size:20px;color: white" href="#">home <span class="sr-only">(current)</span></a>
                    </li>


                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="font-size:18px;color: white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categorie 
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <%                Connection con = UtilConnexion.seConnecter();
                                ResultSet rs = con.createStatement().executeQuery(" select * from categorie");
                                while (rs.next()) {%>   
                            <a class="dropdown-item" href="/eJournal/jsp/Rechercher.jsp?idcat=<%=rs.getInt(1)%>"> <%=rs.getString(2)%>  </a>
                            <%}

                                rs.close();
                            %>

                        </div>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0" action="/eJournal/jsp/Rechercher.jsp">


                    <div class="col-auto my-1">
                        <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Rechercher</label>
                        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="idcat">
                            <option selected value="-1">Tous</option>
                            <% rs = con.createStatement().executeQuery(" select * from categorie");%>
                            <% while (rs.next()) {%>


                            <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                            <%}
                                rs.close();
                                con.close();

                            %>

                        </select>
                    </div>
                    <input class="form-control mr-sm-2" type="search" placeholder="Rechercher" aria-label="Rechercher" name="mot">
                    <button class="btn btn-outline-info my-2 my-sm-0" style="color: white" type="submit"><i class='fas fa-search' style='font-size:18px'> Rechercher</i></button>
                </form>
                <%           Journaliste j = null;
                    if (session.getAttribute("j") != null) {
                        j = (Journaliste) session.getAttribute("j");
                    }
                %>
                <%if (j == null) {%>

                <a class="nav-link" style="color: white"  href="/eJournal/jsp/Login.jsp"><i class='fas fa-user-lock' style='font-size:18px'> Login</i></a>
                <%} else {%>
                <il class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="font-size:18px;color: white; margin-left: 2%" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%=j.getNom() + "(" + j.getCompte().getRole() + ")"%>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #ffff00">
                        <a class="dropdown-item" href="/eJournal/jsp/mesArticles.jsp" > Mes Articles</a>
                        <a class="dropdown-item" href="" >  Editer Article</a>
                        <a class="dropdown-item" href="/eJournal/jsp/AjouterArt.jsp" > Ajouter Article</a>
                        <a class="dropdown-item" href="/eJournal/jsp/changermdp.jsp" >  Changer Mot de passe</a>
                        <% if (j.getCompte().getRole().equals("redacteur en chef")) {%>
                        <a class="dropdown-item" href="/eJournal/jsp/listArticlesValider.jsp" >Valider Article</a>
                        <a class="dropdown-item" href="/eJournal/jsp/validerCommentaires" >Valider Commentaire</a>
                        <%}%>
                        <a class="dropdown-item" href="/eJournal/LogOut" > Log Out</a>
                    </div>   
                </il>

                <%}%>
            </div>
        </nav>


    </body>
</html>
