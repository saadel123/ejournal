package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ma.app.models.Journaliste;
import ma.app.models.UtilConnexion;
import ma.app.models.Article;
import java.text.SimpleDateFormat;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public final class editArticle_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "entete.jsp", out, false);
      out.write("\n");
      out.write("        ");

            int ida=Integer.parseInt(request.getParameter("ida"));
            Article ar=null;
           Connection con=UtilConnexion.seConnecter();
            PreparedStatement ps=con.prepareStatement("select * from article join journaliste using(idj) where etat='en cours' and ida=?");
            ps.setInt(1,ida);
            ResultSet rs=ps.executeQuery();
            SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
            while(rs.next()){
               ar=new Article(rs.getInt("ida"),rs.getString("titre") ,rs.getString("text"), rs.getString("img"),null,s.parse(rs.getDate("datecreation").toString()) , rs.getString("etat"),
                       new Journaliste( rs.getInt("idj"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"),null), rs.getInt("idcat"));
           }
       
               rs=con.createStatement().executeQuery("select * from categorie");
        
        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class=\"card\"  style=\"margin: auto;position: relative;width: 50% \">\n");
      out.write("  <div class=\"card-header\">\n");
      out.write("    Formulaire de modification d'un Article\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card-body\">\n");
      out.write("    <h5 class=\"card-title\">\n");
      out.write("        Saisir vos modifications.\n");
      out.write("    </h5>\n");
      out.write("      <form class=\"was-validated\"  enctype=\"multipart/form-data\"  action=\"/ejournal/editArticle\" method=\"post\">\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("<label for=\"inputPassword6\">Titre</label>\n");
      out.write("<input type=\"text\"  name=\"titre\" value=\"");
      out.print(ar.getTitre());
      out.write("\" id=\"inputPassword6\"   class=\"form-control mx-sm-0\" aria-describedby=\"passwordHelpInline\" size=\"30\">\n");
      out.write("    <small id=\"passwordHelpInline\" class=\"text-muted\">\n");
      out.write("      le titre est obligatoire entre 0 et 50 caractere.\n");
      out.write("     </small>\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("  <div class=\"mb-3\">\n");
      out.write("    <label for=\"validationTextarea\">Texte</label>\n");
      out.write("    <textarea name=\"text\" value=\"");
      out.print(ar.getText());
      out.write("\" class=\"form-control is-invalid\" id=\"validationTextarea\" placeholder=\"Required example textarea\" required></textarea>\n");
      out.write("    <div class=\"invalid-feedback\">\n");
      out.write(" \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("      <select class=\"custom-select\" name=\"cat\" required >\n");
      out.write("      <option value=\"\">Choisir une catégorie</option>\n");
      out.write("      ");
  while(rs.next()){
          
      out.write("\n");
      out.write("          <option value=\"");
      out.print(rs.getInt(1));
      out.write('"');
      out.write(' ');
      out.print(rs.getInt(1)==ar.getIdcat() ? "selected" :"" );
      out.write(" > ");
      out.print(rs.getString(2));
      out.write("</option>\n");
      out.write("         ");
}
         rs.close(); 
         con.close();
         
      out.write("\n");
      out.write("    </select>\n");
      out.write("    <div class=\"invalid-feedback\">choisi une catégorie</div>\n");
      out.write("  </div>\n");
      out.write("  <img src=\"/ejournal/img/");
      out.print(ar.getImg());
      out.write("\" width=\"60px\" height=\"30px\">\n");
      out.write("  <div class=\"custom-file\">\n");
      out.write("    \n");
      out.write("      <input type=\"file\"  name=\"img\" class=\"custom-file-input\" >\n");
      out.write("    <label class=\"custom-file-label\" for=\"validatedCustomFile\">Choisi une image</label>\n");
      out.write("    <div class=\"invalid-feedback\">choisi une image.</div>\n");
      out.write("    <div style=\"text-align: center\">\n");
      out.write("         </div>\n");
      out.write("    <input type=\"hidden\" name=\"ida\" value=\"");
      out.print(ida);
      out.write("\">\n");
      out.write("    <input type=\"hidden\" name=\"img\" value=\"");
      out.print(ar.getImg());
      out.write("\">\n");
      out.write("     <button type=\"submit\" class=\"btn btn-dark mb-2\">Enregistrer Les Modifications</button>\n");
      out.write("   \n");
      out.write(" \n");
      out.write("</form>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("   \n");
      out.write("         ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "pied.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("   \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
