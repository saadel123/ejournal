<%-- 
    Document   : principal
    Created on : May 24, 2021, 12:08:22 AM
    Author     : saad
--%>

<%@page import="ma.app.models.Journaliste"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ma.app.models.Article"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
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
            <%
                if (request.getAttribute("msg") != null) {
            %>
            <h3 align="Center"   style="color: green"><%=request.getAttribute("msg")%></h3>
            <%}%>
            <%
                List<Article> arts = new ArrayList<Article>();
                Connection con = UtilConnexion.seConnecter();
                String req = "select * from (select * from article a join journaliste j using (idj) where etat='accepte' order by datepub desc) where rownum<=5 ";
                ResultSet rs = con.createStatement().executeQuery(req);

                SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
                while (rs.next()) {

                    arts.add(new Article(rs.getInt("ida"), rs.getString("titre"), rs.getString("text"), rs.getString("img"),
                            sdf.parse(rs.getDate("datepub").toString()), sdf.parse(rs.getDate("datecreation").toString()),rs.getString("etat"),
                            new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"),null),
                            rs.getInt("idcat")));
                }
                con.close();
            %>
            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" style="width: 80%; height: 30%; margin-left: 10%; margin-top: 3%">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
                    <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <%
                        int i = 0;
                        for (Article a : arts) {
                    %>
                    <div class="carousel-item <%= i == 0 ? "active" : ""%>">
                        <img src="/eJournal/img/<%=a.getImg()%>" class="d-block w-100" alt="<%=a.getTitre()%>">
                        <div class="carousel-caption d-none d-md-block">
                            <h5 style="color: #17A2B8; font-size: 50px; font-weight: 50px;"><%=a.getTitre()%></h5>
                            <p style="color: white; font-size: 20px"><%=a.getText().substring(0, 50)%>...<br><br>
                                <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="/eJournal/jsp/DetailArt.jsp?ida=<%=a.getIda()%>">Read more</a> 
                            </p>
                        </div>
                    </div>

                    <%
                            i++;
                        }%>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Precedent</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Suivant</span>
                </a>
            </div>
            <jsp:include page="pied.jsp"></jsp:include>
        </div>
    </body>
</html>
