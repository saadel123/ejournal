<%-- 
    Document   : principal
    Created on : Feb 24, 2020, 12:08:22 AM
    Author     : mehdierror404
--%>
<%@page import="ma.app.models.Journaliste"%>
<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="ma.app.models.Article"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="entete.jsp"></jsp:include>
        <%
            int ida = Integer.parseInt(request.getParameter("ida"));
            Article ar = null;
            Connection con = UtilConnexion.seConnecter();
            PreparedStatement ps = con.prepareStatement("select * from article join journaliste using(idj) where etat='en cours' and ida=?");
            ps.setInt(1, ida);
            ResultSet rs = ps.executeQuery();
            SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
            while (rs.next()) {
                ar = new Article(rs.getInt("ida"), rs.getString("titre"), rs.getString("text"), rs.getString("img"), null, s.parse(rs.getDate("datecreation").toString()), rs.getString("etat"),
                        new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), null), rs.getInt("idcat"));
            }
            rs = con.createStatement().executeQuery("select * from categorie");

        %>

        <div class="card"  style="margin: auto;position: relative;width: 50% ">
            <div class="card-header">
                Formulaire de modification d'un Article
            </div>
            <div class="card-body">
                <h5 class="card-title">
                    Saisir vos modifications.
                </h5>
                <form class="was-validated"  enctype="multipart/form-data"  action="/ejournal/editArticle" method="post">
                    <div class="form-group">
                        <label for="inputPassword6">Titre</label>
                        <input type="text"  name="titre" value="<%=ar.getTitre()%>" id="inputPassword6"   class="form-control mx-sm-0" aria-describedby="passwordHelpInline" size="30">
                        <small id="passwordHelpInline" class="text-muted">
                            le titre est obligatoire entre 0 et 50 caractere.
                        </small>
                    </div>

                    <div class="mb-3">
                        <label for="validationTextarea">Texte</label>
                        <textarea name="text" value="<%=ar.getText()%>" class="form-control is-invalid" id="validationTextarea" placeholder="Required example textarea" required></textarea>
                        <div class="invalid-feedback">

                        </div>
                    </div>

                    <div class="form-group">
                        <select class="custom-select" name="cat" required >
                            <option value="">Choisir une catégorie</option>
                            <%  while (rs.next()) {
                            %>
                            <option value="<%=rs.getInt(1)%>" <%=rs.getInt(1) == ar.getIdcat() ? "selected" : ""%> > <%=rs.getString(2)%></option>
                            <%}
                                rs.close();
                                con.close();
                            %>
                        </select>
                        <div class="invalid-feedback">choisi une catégorie</div>
                    </div>
                    <img src="/ejournal/img/<%=ar.getImg()%>" width="60px" height="30px">
                    <div class="custom-file">

                        <input type="file"  name="img" class="custom-file-input" >
                        <label class="custom-file-label" for="validatedCustomFile">Choisi une image</label>
                        <div class="invalid-feedback">choisi une image.</div>
                        <div style="text-align: center">
                        </div>
                        <input type="hidden" name="ida" value="<%=ida%>">
                        <input type="hidden" name="img" value="<%=ar.getImg()%>">
                        <button type="submit" class="btn btn-dark mb-2">Enregistrer Les Modifications</button>


                </form>
            </div>
        </div>

        <jsp:include page="pied.jsp"></jsp:include>
    </body>

</html>
