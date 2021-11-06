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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import ma.app.models.Journaliste;
import ma.app.models.UtilConnexion;

/**
 * 9
 *
 * @author saad
 */
@MultipartConfig
@WebServlet(name = "AjouterArt", urlPatterns = {"/AjouterArt"})
public class AjouterArt extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            String titre = request.getParameter("titre");
            String text = request.getParameter("text");
            int idcat = Integer.parseInt(request.getParameter("idcat"));
            Connection con = UtilConnexion.seConnecter();
            PreparedStatement ps = con.prepareStatement("insert into article values(seq_art.nextval,?,?,?,null,sysdate,'en cours',?,?)");
            ps.setString(1, titre);
            ps.setString(2, text);
            Part p = request.getPart("img");
            String filename = p.getHeader("content-disposition");
            for (String s : filename.split(";")) {
                if (s.trim().startsWith("filename")) {
                    filename = s.substring(s.indexOf("=") + 1).trim().replace("\"", "");
                    filename = filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1);
                }
            }
            p.write(getServletContext().getRealPath("/img/" + filename));
            ps.setString(3, filename);
            Journaliste j = (Journaliste) request.getSession().getAttribute("j");
            ps.setInt(4, j.getIdj());
            ps.setInt(5, idcat);
            ps.executeQuery();
            request.setAttribute("msg", "Article ajoutée avec succé");
            request.setAttribute("typemsg", "success");
            request.getRequestDispatcher("/jsp/mesArticles.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AjouterArt.class.getName()).log(Level.SEVERE, null, ex);
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
