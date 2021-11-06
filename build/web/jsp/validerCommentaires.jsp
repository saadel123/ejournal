<%-- 
    Document   : listArticlesValider
    Created on : Mar 10, 2020, 9:01:18 AM
    Author     : mehdierror404
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ma.app.models.Article"%>
<%@page import="ma.app.models.Journaliste"%>
<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
            if(session.getAttribute("j")==null){
             request.setAttribute("msg", "cette page necessite une authentification!!");
             request.setAttribute("typemsg", "error");
             request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
            }else{
                Journaliste j= (Journaliste)session.getAttribute("j");
             if(!j.getCompte().getRole().equals("redacteur en chef")){
                 request.setAttribute("msg","cette page necessite une authentification en tant que redacteur en chef!!");
                 session.invalidate();
                 request.setAttribute("typemsg", "error");
                  request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
                 
             }
            }
        %>
        
      <%
            if(request.getAttribute("msg")!=null){
        %>
        <h3 align="Center"   style="color: green"><%=request.getAttribute("msg")%></h3>
            
             <%}%>
        
        <%
            Journaliste j= (Journaliste) session.getAttribute("j");
            ArrayList<Article> arts= new ArrayList<Article>();
            Connection con=UtilConnexion.seConnecter();
        ResultSet rs=con.createStatement().executeQuery("select ida,a.titre,a.text,img,datecreation,a.etat,idcat,count(*) nbrcomm"
                + " from article a  join commentaire c using (ida) where a.etat='accepte' and c.etat='en cours'"
                + "group by ida,a.titre,a.text,img,datecreation,a.etat,idcat ");
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        %>
        <h3>Liste des articles avec des commentaires a valider</h3>
        <form action="/eJournal/validerArt" method="post">
            <table class="table" style="margin-top: 20px;width: 80%;margin-left: 10%" >
                
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Titre</th>
                        <th scope="col">Text</th>
                        <th scope="col">Nombre commentaire</th>
                        <th scope="col">Details</th>
                    </tr>
                </thead>
                <tbody>
        
        <%
        while(rs.next()){
            
            Date datepub=null;
            try{
                datepub=sdf.parse(rs.getDate("datePub").toString());
            }catch(Exception ex){}
            
                 Article a=new Article(rs.getInt("ida"),rs.getString("titre"),rs.getString("text"),
                rs.getString("img"),sdf.parse(rs.getDate("datepub").toString()),sdf.parse(rs.getDate("datecreation").toString()),
                rs.getString("etat"),
                null,rs.getInt("idcat"));
                 
            
           %>
           <tr>
                    <th><img src="eJournal/img/<%=a.getImg()%>" width="80px" height="40px"></th>
                    <td><%=a.getTitre()%></td>
                    <td><%=a.getText().substring(0,30)%></td>
                    <td><%=rs.getInt("nbrcomm")%></td>
                    <td><a href="/eJournal/jsp/ListCommAValiderParArt.jsp?ida=<%=a.getIda()%> ">Valider les commentaires</a></td>
                    
                    
                    <td align="Center"><input align="Center" type="submit" name="action" value="accepte">
                      <input align="Center" type="submit" name="action" value="refuser"></td>
                      
                    
                     </tr>
           
           
           <%
        
        con.close();
        
        
        
       
        
        %>
        
                   
                     
                     
                    
               
                
            </tbody>
            </table>
            
        </form>
        
        
        
        
        
        
        
        
         <jsp:include page="pied.jsp"></jsp:include>
        </div>
    </body>
</html>
