<%-- 
    Document   : DetailsArt
    Created on : May 25, 2021, 9:16:46 AM
    Author     : mehdierror404
--%>


<%@page import="ma.app.models.Journaliste"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ma.app.models.Article"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ma.app.models.UtilConnexion"%>
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
           Article a= null;
            int ida= Integer.parseInt(request.getParameter("ida"));
         Connection con=UtilConnexion.seConnecter();
         PreparedStatement ps=con.prepareStatement("select * from article a join journaliste j using (idj) where etat='accepte' and ida=?");
         ps.setInt(1, ida);
         ResultSet rs=ps.executeQuery();
      
      SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
        if(rs.next())
            
            a=new Article(rs.getInt("ida"), rs.getString("titre"), rs.getString("text"), rs.getString("img"),
                     sdf.parse( rs.getDate("datepub").toString()), sdf.parse(rs.getDate("datecreation").toString()),
                    rs.getString("etat"),
                    new Journaliste(rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"),
                    null), rs.getInt("idcat"));
      
        
        %>
        
             
                 
                  
                  
        <div align="center"> 
             <img src="/eJournal/img/<%=a.getImg()%>" style="width: 80%; height: 30%; margin-left: 10%; margin-top: 3%">
             <h3><b><p style="font-family: serif"><%=a.getTitre()%></p></b> </h3>
          
             
             <h5><b> <p align="center"><%=a.getJournaliste().getNom()+" "+a.getJournaliste().getPrenom()%></p></b> </h5>
             
             
             <p style="font-family: monospace">
                 <%=a.getText()%>
             </p>
         </div> 
             
             <div style="margin: auto;position: relative;width: 70%">
                 <h3>Liste des commentaires</h3>
                 
                 <%
                  ps=con.prepareStatement("select * from commentaire where ida=? and etat='accepte'");
                  ps.setInt(1, ida);
                  rs=ps.executeQuery();
                  %>
                  <ul class="list-unstyled">
                 <%
                   while(rs.next()){
                 %>
                 
                 
                <li class="media">
                    <img src="/eJournal/img/avatar4.png" height="40px"width="40px" class="mr-3 rounded-circle" alt="...">
                  <div class="media-body">
                      <h5 class="mt-0 mb-1"><%=rs.getString("titre")%><small><i>Poste par <%=rs.getString("pseudo")%>
                                  le <%=rs.getDate("datecom")%></i></small></h5>
                                  <%=rs.getString("text")%>
                                  
                                  <button type="button" class="btn btn-outline-success rounded-circle">
                      <img src="/eJournal/img/like.gif" height="30px"width="30px"><%=rs.getInt("NBRLIKE")%>
                  </button>
                  <button type="button" class="btn btn-outline-danger rounded-circle">
                      <img src="/eJournal/img/unlike.gif" height="30px"width="30px"><%=rs.getInt("NBRUNLIKE")%>
                  </button>
                  </div>
                  
                </li>
  

                 
                 <%}%>
    </ul>   
       <div id="formComm" style="margin: auto;position: relative;width: 60%">
               <form class="card-body">
                    <div class="form-group">
                      <label for="exampleFormControlInput1">Email</label>
                      <input type="email" class="form-control" id="email" placeholder="name@example.com">
                    </div>
                   <div class="form-group">
                      <label for="exampleFormControlInput1">Pseudo</label>
                      <input type="text" class="form-control" id="pseudo" placeholder="name@example.com">
                    </div>
                   <div class="form-group">
                      <label for="exampleFormControlInput1">Titre</label>
                      <input type="email" class="form-control" id="titre" placeholder="name@example.com">
                    </div>
                   
                    <div class="form-group">
                      <label for="exampleFormControlTextarea1">Text</label>
                      <textarea class="form-control" id="text" rows="3"></textarea>
                    </div>
                   <input type="hidden" id="ida" value="<%=ida%>">
                   <button type="button" class="btn btn-primary" onclick="saveComm();">Envoyer le commentaire</button>
                  </form>
    
             </div>
                 
             </div>
              
            <div id="listcom">
         <input type="button" class="btn btn-dark mb-2" value="Afficher Les Commentaire" onclick="affComm();">
        
                  </div>
         
         
              <jsp:include page="pied.jsp"></jsp:include>
              
              <script>
                  function saveComm(){
                     // On reprend le même id que dans le précédent chapitre


                        $.ajax({
                           url : '/eJournal/AddComm',
                           type : 'Post',
                           dataType : 'html',
                           data: 'ida='+$("#ida").val()+'&pseudo='+$("#pseudo").val()+'&titre='+$("#titre").val()+'&text='+$("#text").val()
                                   +'&email='+$("#email").val() ,
                           success : function(code_html, statut){
                               document.getElementById('formComm').innerHTML=code_html;
                           },

                           error : function(resultat, statut, erreur){
                            alert(erreur); 
                           },

                           complete : function(resultat, statut){

                           }

                        });

                    }
                    function affComm(){
                        $.ajax({
                          url: "/ejournal/jsp/ListCommentaireArt.jsp",
                          type: 'post',
                          dataType: 'html',
                          data:  'ida='+$("#ida").val(), 
                                
                          success:function (code_html,status){
                            
                              document.getElementById("listcom").innerHTML=code_html;
                              
                          },
                          error: function (resultat,code,error){
                              alert(error)
                          },
                                  
                           complete: function (){
                               
                           }
                        });
                    }
                    function like(idc){
                        $.ajax({
                          url: '/ejournal/LikeComm',
                          type: 'Post',
                          dataType: 'html',
                          data: 'idc='+idc+'&action=like',
                          success:function (code_html,status){
                             
                              document.getElementById(idc+'').innerHTML=code_html;
                              
                          },
                          error: function (resultat,code,error){
                              alert(error);
                          },
                                  
                           complete: function (){
                               
                           }
                        });
                    }
                    
                      function dislike(idc){
                        $.ajax({
                          url: '/ejournal/LikeComm',
                          type: 'Post',
                          dataType: 'html',
                          data: 'idc='+idc+'&action=dislike',
                          success:function (code_html,status){
                             
                              document.getElementById(idc+'').innerHTML=code_html;
                              
                          },
                          error: function (resultat,code,error){
                              alert(error);
                          },
                                  
                           complete: function (){
                               
                           }
                        });
                    }

                
              </script>
             
         </div>
             
             
      
        
    </body>
</html>
