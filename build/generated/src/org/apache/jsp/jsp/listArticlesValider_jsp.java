package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import ma.app.models.Article;
import ma.app.models.Journaliste;
import ma.app.models.UtilConnexion;
import java.sql.Connection;
import java.sql.ResultSet;

public final class listArticlesValider_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "entete.jsp", out, false);
      out.write("\n");
      out.write("            ");

                if (session.getAttribute("j") == null) {
                    request.setAttribute("msg", "cette page necessite une authentification!!");
                    request.setAttribute("typemsg", "error");
                    request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
                } else {
                    Journaliste j = (Journaliste) session.getAttribute("j");
                    if (!j.getCompte().getRole().equals("redacteur en chef")) {
                        request.setAttribute("msg", "cette page necessite une authentification en tant que redacteur en chef!!");
                        session.invalidate();
                        request.setAttribute("typemsg", "error");
                        request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);

                    }
                }
            
      out.write("\n");
      out.write("\n");
      out.write("            ");

                if (request.getAttribute("msg") != null) {
            
      out.write("\n");
      out.write("            <h3 align=\"Center\"   style=\"color: green\">");
      out.print(request.getAttribute("msg"));
      out.write("</h3>\n");
      out.write("\n");
      out.write("            ");
}
      out.write("\n");
      out.write("\n");
      out.write("            ");


                Journaliste j = null;

                if (session.getAttribute("j") != null) {
                    j = (Journaliste) session.getAttribute("j");

                    Connection con = UtilConnexion.seConnecter();
                    PreparedStatement ps = con.prepareStatement("select * from article a join journaliste j using(idj) where etat='en cours'");
                    ps.setInt(1, j.getIdj());
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

            
      out.write("\n");
      out.write("            <h3>Liste des articles avec des commentaires a valider</h3>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            <table align=\"Center\" border=\"3\" style=\" margin-top: 5%\">\n");
      out.write("                <tr><th>Image</th><th>Titre</th><th>Text</th><th>Journaliste</th> <th>Etat</th> <th>Editer</th></tr>\n");
      out.write("\n");
      out.write("                ");
for (Article a : arts) {
      out.write("\n");
      out.write("\n");
      out.write("                <tr><td><img src=\"/eJournal/img/");
      out.print(a.getImg());
      out.write("\"  style=\"width: 200px; height: 100px\"></td>\n");
      out.write("                    <td style=\"font-family: serif\"><b>");
      out.print(a.getTitre());
      out.write("</b></td>\n");
      out.write("                    <td style=\"font-family: monospace\">");
      out.print(a.getText().substring(0, 20));
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <a style=\"border: 3\" href=\"\\eJournal\\jsp\\DetailArt.jsp?ida=");
      out.print(a.getIda());
      out.write("\">Lire La Suite...</a></td>\n");
      out.write("                    <td>");
      out.print(a.getJournaliste().getNom());
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(a.getEtat());
      out.write("</td>\n");
      out.write("                    ");
if (a.getEtat().equals("en cours")) {
      out.write("\n");
      out.write("                    <td><a href=\"/eJournal/jsp/editArticle.jsp?ida=");
      out.print(a.getIda());
      out.write("\">Editer</a></td>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <td></td>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                ");
}
                    } else {
                        request.setAttribute("msg", "Cette Page Necessite Une Authentification!!");
                        request.setAttribute("typemsg", "Error");
                        request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);

                    }
      out.write("\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "pied.jsp", out, false);
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
