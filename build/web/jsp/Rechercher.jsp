<%-- 
    Document   : Rechercher
    Created on : May 25, 2020, 11:31:27 AM
    Author     : saad
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ma.app.models.Journaliste"%>
<%@page import="java.sql.Connection"%>
<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ma.app.models.Article"%>
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
            <%
                String mot = request.getParameter("mot");
                int idcat = Integer.parseInt(request.getParameter("idcat"));
                ArrayList<Article> arts = new ArrayList<Article>();
                Connection con = UtilConnexion.seConnecter();
                Statement st = con.createStatement();
                String req = "select * from article join journaliste using (idj)  where etat='accepte' ";
                if (idcat > 0) {
                    req += "and idcat= " + idcat;
                }
                if (mot != null) {
                    req += "and lower(text)like'%" + mot.toLowerCase() + "%'";
                }
                req += "order by datepub desc";

                ResultSet rs = st.executeQuery(req);
                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

                while (rs.next()) {
                    arts.add(new Article(rs.getInt("ida"), rs.getString("titre"), rs.getString("text"),
                            rs.getString("img"), sdf.parse(rs.getDate("datepub").toString()), sdf.parse(rs.getDate("datecreation").toString()),
                            rs.getString("etat"),
                            new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), null), rs.getInt("idcat")
                    ));
                }
                con.close();
                int p = 1;
                if (request.getParameter("p") != null) {
                    p = Integer.parseInt(request.getParameter("p"));
                }
                int nbrArtParPage = 3;
                int nbrPages = (arts.size() % nbrArtParPage == 0) ? arts.size() / nbrArtParPage : arts.size() / nbrArtParPage + 1;
                int indexTo = p * nbrArtParPage;
                if (arts.size() % nbrArtParPage != 0 && p == nbrPages) {
                    indexTo = arts.size();
                }
                List<Article> artsCur = arts.subList((p - 1) * nbrArtParPage, indexTo);


            %>

            <%        if (arts.size() == 0) {
            %>
            <div class="alert alert-danger" role="alert">
                Aucun Resultat Trouvée!!
            </div>
            <% } else {%>
            <table class="table" style="margin-top: 20px">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Titre</th>
                        <th scope="col">Text</th>
                        <th scope="col">Journaliste</th>
                        <th scope="col">Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Article a : artsCur) {%>
                    <tr>
                        <th><img src="/eJournal/img/<%=a.getImg()%>" width="300px" height="150px"></th>
                        <td><%=a.getTitre()%></td>
                        <td><%=a.getText().substring(0, 50)%></td>
                        <td><%=a.getJournaliste().getNom()%></td>
                        <td> <a  class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/eJournal/jsp/DetailArt.jsp?ida=<%=a.getIda()%>">Read more</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <%}%>
            <div style="margin: auto;position: relative; width: 200px">
                <nav aria-label="aller a la page">
                    <ul class="pagination pagination-sm">
                        <%  for (int i = 1; i <= nbrPages; i++) {
                                if (i == p) {
                        %>
                        <li class="page-item active" aria-current="page">
                            <span class="page-link">
                                <%=i%>
                                <span class="sr-only">(current)</span>
                            </span>
                        </li>
                        <%} else {%>
                        <li style="text-align: center;"class="page-item"><a class="page-link" href="/eJournal/jsp/Rechercher.jsp?mot=<%=mot%>&idcat=<%=idcat%>&p=<%=i%>"><%=i%></a></li>
                            <%}
                                }%>
                    </ul>
                </nav>
            </div>
            <jsp:include page="pied.jsp"></jsp:include>
        </div>
    </body>
</html>
