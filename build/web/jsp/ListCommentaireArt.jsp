<%-- 
    Document   : listArticlesValider
    Created on : May 8, 2021, 9:01:18 AM
    Author     : saad
--%>

<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
            <% 
                 int ida=Integer.parseInt(request.getParameter("ida"));
                Connection con=UtilConnexion.seConnecter();
          PreparedStatement    ps=con.prepareStatement(" select * from commentaire where ida=?");
             ps.setInt(1,ida);
           ResultSet  rs=ps.executeQuery();
          %>
          <h1 style="text-align: center;color: burlywood">Liste des Commentaire</h1>
             <ul class="list-unstyled" >
              <%
             while(rs.next()){
              %>
              
              <div style="margin-left: 20%">
              <li class="media" >
                  
                  <img src="/ejournal/img/images_1.jpg" width="60px" height="60px"  class="mr-3 rounded-circle "  style="margin-left: 20%">
           <div class="media-body">
           <h5 class="mt-0 mb-1"><%=rs.getString("titre")%></h5>
           <h5 class="mt-0 mb-1"><%=rs.getDate("datecom")%></h5>
           <h5 class="mt-0 mb-1"><%=rs.getString("text")%></h5>
           <div id="<%=rs.getInt("idc")%>">
           <button type="button" onclick="like('<%=rs.getInt("idc")%>')" class="btn btn-outline-success rounded-circle">
               <img src="/ejournal/img/like.png" width="20px" height="20px" ><%=rs.getInt("nbrlike")%> </button>
          
           <button type="button" onclick="dislike('<%=rs.getInt("idc")%>')"  class="btn btn-outline-danger rounded-circle">
                <img src="/ejournal/img/dislike.png" width="20px" height="20px"><%=rs.getInt("nbrunlike")%> </button>
      
          </div>
           
          </div>
          
          </li>
          </div>
       <%}
      con.close();
       %>
       
       
          
</ul>
    </body>
</html>
