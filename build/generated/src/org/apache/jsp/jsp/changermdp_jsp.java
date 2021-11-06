package org.apache.jsp.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class changermdp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <div class=\"container\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "entete.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            ");
 if(session.getAttribute("j")!=null){
                request.getRequestDispatcher("/jsp/mesArticles.jsp").forward(request, response);
            }
                if (request.getAttribute("msg") != null) {
      out.write("\n");
      out.write("\n");
      out.write("            <div style=\"margin: auto; position: relative; width: 50%\"class=\"alert alert-");
      out.print(request.getAttribute("typemsg").toString().equals("error") ? "danger" : "primary");
      out.write(" role=\"alert\">\n");
      out.write("                 ");
      out.print(request.getAttribute("msg"));
      out.write("\n");
      out.write("        </div>\n");
      out.write("        ");
 }
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div id=\"loginbox\" style=\"margin-top: 50px;\" class=\"mainbox col-lg-6 offset-md-3 col-md-8 offset-sm-2\">\n");
      out.write("            <div class=\"card card-inverse card-info\">\n");
      out.write("                <div class=\"card-header\">\n");
      out.write("                    <div class=\"card-title\">Formulaire Changment du mot de passe</div>\n");
      out.write("                </div>\n");
      out.write("                <div style=\"padding-top: 30px;\" class=\"card-block\">\n");
      out.write("                    <div style=\"display: none;\" id=\"login-alert\" class=\"alert alert-danger col-md-12\"></div>\n");
      out.write("                    <form id=\"loginform\" class=\"\" role=\"form\" method=\"post\" action=\"/eJournal/ChangerMdp\">\n");
      out.write("\n");
      out.write("                        <div class=\"col-auto\">\n");
      out.write("                            <label class=\"sr-only\" for=\"inlineFormInputGroup\">Ancien mot de passe</label>\n");
      out.write("                            <div class=\"input-group mb-2\">\n");
      out.write("                                <div class=\"input-group-prepend\">\n");
      out.write("                                    <div class=\"input-group-text\">Ancien mot de passe</div>\n");
      out.write("                                </div>\n");
      out.write("                                <input type=\"password\" name=\"ancmdp\" class=\"form-control\" id=\"inlineFormInputGroup\" placeholder=\"entrer Ancien mot de passe\" required=\"\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-auto\">\n");
      out.write("                            <label class=\"sr-only\" for=\"inlineFormInputGroup\">Nouveau Mot de passe</label>\n");
      out.write("                            <div class=\"input-group mb-2\">\n");
      out.write("                                <div class=\"input-group-prepend\">\n");
      out.write("                                    <div class=\"input-group-text\">Nouveau Mot de passe</div>\n");
      out.write("                                </div>\n");
      out.write("                                <input type=\"password\" name=\"mdp\" class=\"form-control\" id=\"inlineFormInputGroup\" placeholder=\"entrer mot de passe\" required=\"\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"col-auto\">\n");
      out.write("                            <label class=\"sr-only\" for=\"inlineFormInputGroup\">Confirmation du Mot de passe</label>\n");
      out.write("                            <div class=\"input-group mb-2\">\n");
      out.write("                                <div class=\"input-group-prepend\">\n");
      out.write("                                    <div class=\"input-group-text\">Confirmation du Mot de passe</div>\n");
      out.write("                                </div>\n");
      out.write("                                <input type=\"password\" name=\"mdp2\" class=\"form-control\" id=\"inlineFormInputGroup\" placeholder=\"Confirmation\" required=\"\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                \n");
      out.write("                        <div style=\"margin-top: 10px;\" class=\"form-group\">\n");
      out.write("                            <!-- Button -->\n");
      out.write("                            <div class=\"col-md-12 controls\">\n");
      out.write("                                <button type=\"submit\" id=\"btn-login\" href=\"#\" class=\"btn btn-success\">Changer le mot de passe </button>\n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "pied.jsp", out, false);
      out.write("\n");
      out.write("    </div>\n");
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
