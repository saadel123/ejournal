package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ma.app.models.Journaliste;
import java.text.SimpleDateFormat;
import ma.app.models.Article;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;
import ma.app.models.UtilConnexion;

public final class principal_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <div class=\"container\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "entete.jsp", out, false);
      out.write("\n");
      out.write("            ");

                if (request.getAttribute("msg") != null) {
            
      out.write("\n");
      out.write("            <h3 align=\"Center\"   style=\"color: green\">");
      out.print(request.getAttribute("msg"));
      out.write("</h3>\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            ");

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
            
      out.write("\n");
      out.write("            <div id=\"carouselExampleCaptions\" class=\"carousel slide\" data-ride=\"carousel\" style=\"width: 80%; height: 30%; margin-left: 10%; margin-top: 3%\">\n");
      out.write("                <ol class=\"carousel-indicators\">\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"1\"></li>\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"2\"></li>\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"3\"></li>\n");
      out.write("                    <li data-target=\"#carouselExampleCaptions\" data-slide-to=\"4\"></li>\n");
      out.write("                </ol>\n");
      out.write("                <div class=\"carousel-inner\">\n");
      out.write("                    ");

                        int i = 0;
                        for (Article a : arts) {
                    
      out.write("\n");
      out.write("                    <div class=\"carousel-item ");
      out.print( i == 0 ? "active" : "");
      out.write("\">\n");
      out.write("                        <img src=\"/eJournal/img/");
      out.print(a.getImg());
      out.write("\" class=\"d-block w-100\" alt=\"");
      out.print(a.getTitre());
      out.write("\">\n");
      out.write("                        <div class=\"carousel-caption d-none d-md-block\">\n");
      out.write("                            <h5 style=\"color: #17A2B8; font-size: 50px; font-weight: 50px;\">");
      out.print(a.getTitre());
      out.write("</h5>\n");
      out.write("                            <p style=\"color: white; font-size: 20px\">");
      out.print(a.getText().substring(0, 50));
      out.write("...<br><br>\n");
      out.write("                                <a class=\"btn btn-primary btn-lg active\" role=\"button\" aria-pressed=\"true\" href=\"/eJournal/jsp/DetailArt.jsp?ida=");
      out.print(a.getIda());
      out.write("\">Read more</a> \n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");

                            i++;
                        }
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <a class=\"carousel-control-prev\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"prev\">\n");
      out.write("                    <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>\n");
      out.write("                    <span class=\"sr-only\">Precedent</span>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"carousel-control-next\" href=\"#carouselExampleCaptions\" role=\"button\" data-slide=\"next\">\n");
      out.write("                    <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>\n");
      out.write("                    <span class=\"sr-only\">Suivant</span>\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
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
