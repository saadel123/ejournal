<%-- 
    Document   : ListCommAValiderParArt
    Created on : Apr 20, 2020, 7:57:48 PM
    Author     : mehdierror404
--%>

<%@page import="ma.app.models.UtilConnexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:include page="entete.jsp"></jsp:include>
       <% 
           Connection con=UtilConnexion.seConnecter();
           Statement st=con.createStatement();
           String req="select img ,a.titre,count(idc) from article a join commentaire c using(ida)  group by img ,a.titre";
           
           ResultSet rs=st.executeQuery(req);
          
       %>
        
       <table class="table" style="margin-top: 20px">
  <thead class="thead-light">
    <tr>
      <th scope="col">Image</th>
      <th scope="col">Titre</th>
      <th scope="col">NombreComm</th>
      <th scope="col">Valider</th>
     
    </tr>
  </thead>
  <tbody>
      <% while(rs.next()){%>
      
    <tr>
        <th > <img src="/ejournal/img/<%=rs.getString("img")%>" width="40" height="20"></th>
      <td><%=rs.getString("titre")%></td>
      <td><%=rs.getString(3)%></td>
      <td><a href="/ejournal/jsp/validerCommentaire.jsp">Valider</a></td>
     
    </tr>
    
    <%}
    con.close();
    %>
  </tbody>
</table>
    </body>
</html>

