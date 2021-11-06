<%-- 
    Document   : mesArticles
    Created on : May 30, 2021, 12:37:37 PM
    Author     : saad
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ma.app.models.Article"%>
<%@page import="ma.app.models.Journaliste"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="ma.app.models.UtilConnexion"%>
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
            <% if (request.getAttribute("msg") != null) {%>
            <div style="margin: auto; position: relative; width: 50%"class="alert alert-<%=request.getAttribute("typemsg").toString().equals("error") ? "danger" : "primary"%> role="alert">
                 <%=request.getAttribute("msg")%>
        </div>
        <% }%>
        <%
            Journaliste j = null;

            if (session.getAttribute("j") != null) {
                j = (Journaliste) session.getAttribute("j");
                Connection con = UtilConnexion.seConnecter();
                PreparedStatement ps = con.prepareStatement("select * from article a join journaliste j using(idj) where etat='en cours'");
                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                ArrayList<Article> arts = new ArrayList<Article>();
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Date datepub = null;
                    try {
                        datepub = sdf.parse(rs.getDate("datePub").toString());
                    } catch (Exception e) {
                    }
                    arts.add(new Article(rs.getInt("ida"), rs.getString("titre"), rs.getString("text"), rs.getString("img"),
                            datepub, sdf.parse(rs.getDate("datecreation").toString()),
                            rs.getString("etat"),
                            new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), null),
                            rs.getInt("idcat")
                    ));
                }

        %>
        <form action="/eJournal/validerArt" method="post">
            <table align="Center" border="3" style=" margin-top: 5%">
                <tr><th>Image</th><th>Titre</th><th>Text</th><th>Journaliste</th> <th>Etat</th> <th>Editer</th></tr>

                <%for (Article a : arts) {%>

                <tr><td><img src="/eJournal/img/<%=a.getImg()%>"  style="width: 200px; height: 100px"></td>
                    <td style="font-family: serif"><b><%=a.getTitre()%></b></td>
                    <td style="font-family: monospace"><%=a.getText().substring(0, 20)%>


                        <a style="border: 3" href="\eJournal\jsp\DetailArt.jsp?ida=<%=a.getIda()%>">Lire La Suite...</a></td>
                    <td><%=a.getJournaliste().getNom()%></td>
                    <td><%=a.getEtat()%></td>
                    <%if (a.getEtat().equals("en cours")) {%>
                    <td style="margin: auto;"><input type="checkbox" name="ida"  value="<%=a.getIda()%>"></td>
                        <%} else {%>
                    <td></td>
                    <%}%>
                </tr>
                <%}
                %>
            </table>
            <div style="margin: auto; width: 250px;">
                <button class="btn btn-danger" type="submit" name="action" value="Valider">Valider</button>
                <button class="btn btn-success" type="submit" name="action" value="Refuser">Refuser</button>
            </div>
        </form>
        <%} else {
                request.setAttribute("msg", "Cette Page Necessite Une Authentification!!");
                request.setAttribute("typemsg", "Error");
                request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);

            }%>


        <jsp:include page="pied.jsp"></jsp:include>
    </div>
</body>
</html>
