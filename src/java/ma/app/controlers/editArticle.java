/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.app.controlers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import ma.app.models.UtilConnexion;


/**
 *
 * @author saad
 */
@WebServlet(name = "editArticle", urlPatterns = {"/editArticle"})
@MultipartConfig
public class editArticle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editArticle</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editArticle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
             Connection con=UtilConnexion.seConnecter();
            PreparedStatement ps=con.prepareStatement("update article  set titre=?, text=?, img=?,idcat=?  where ida=?");
            String titre=request.getParameter("titre");
            String texte=request.getParameter("text");
            
            int cat=Integer.parseInt(request.getParameter("cat"));
           int ida=Integer.parseInt(request.getParameter("ida"));
            Part p=request.getPart("img");
            
            String header=p.getHeader("content-disposition");
            String[] vals=header.split(";");
            String f="";
            for(String s:vals){
                if(s.trim().startsWith("filename")){
                    f=s.trim().substring(s.indexOf("=")+1);
                    f=f.substring(f.lastIndexOf('\\')+1);
                    f=f.substring(f.lastIndexOf('/')+1);
                    f=f.replaceAll("\"","");
                    break;
                }
            }if(f.length()>0){
            ps.setString(3,f);
            p.write(getServletContext().getRealPath("/img/"+f));
            }else{
                ps.setString(3,request.getParameter("img"));
            }
            ps.setString(1, titre);
            ps.setString(2, texte);
           
           
            ps.setInt(4,cat);
            ps.setInt(5,ida);
            ps.executeUpdate();
            
            request.setAttribute("imsg", "l'article modifier avec succes.");
            request.getRequestDispatcher("/jsp/NouvelleArticle.jsp");
        } catch (Exception ex) {
           //Logger.getLogger(Ajouter.class.getName()).log(Level.SEVERE, null, ex);
            PrintWriter w=response.getWriter();
            w.println(ex.getMessage());
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
