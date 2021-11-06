<%-- 
    Document   : AjouterArt
    Created on : Jun 1, 2021, 10:33:40 AM
    Author     : saad
--%>

<%@page import="java.sql.Statement"%>
<%@page import="ma.app.models.UtilConnexion"%>
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

        <div class="container">
            <jsp:include page="entete.jsp"></jsp:include>

            <%
                if (request.getAttribute("msg") != null) {
            %>
            <h3 align="Center"   style="color: green"><%=request.getAttribute("msg")%></h3>
            <%}%>
            <form   action="/eJournal/AjouterArt" method="post" enctype="multipart/form-data">
                <table border="3" align="center" style="margin: auto; position: relative; margin-top: 2%">
                    <tr>
                        <td align="center">Titre:</td>
                        <td><input type="text" name="titre"></td>
                    </tr>
                    <tr>
                        <td align="center">Text:</td>
                        <td><textarea id="msg" name="text" cols="40" rows="6"></textarea></td>
                    </tr>
                    <tr>
                        <td align="center">Gategorie:</td>
                        <td><select name="idcat">
                                <%  Connection con = UtilConnexion.seConnecter();
                                    Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs = st.executeQuery("select * from categorie");
                                    while (rs.next()) {%>
                                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td><input type="file" name="img"></td> 
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Ajouter article"></td>
                    </tr> 
                </table>
            </form>            
            <jsp:include page="pied.jsp"></jsp:include>
        </div>
    </body>
</html>
