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
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ma.app.models.Journaliste;
import ma.app.models.UtilConnexion;

/**
 *
 * @author saad
 */
@WebServlet(name = "ChangerMdp", urlPatterns = {"/ChangerMdp"})
public class ChangerMdp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            HttpSession s = request.getSession();
            Journaliste j = (Journaliste) s.getAttribute("j");
            String ancmdp = request.getParameter("ancmdp");
            String mdp = request.getParameter("mdp");
            String mdp2 = request.getParameter("mdp2");
            if (j.getCompte().getMdp().equals(ancmdp)) {
                if (mdp.equals(mdp2)) {
                    Connection con = UtilConnexion.seConnecter();
                    PreparedStatement ps = con.prepareStatement("update compte set mdp=? where login=?");
                    ps.setString(1, mdp);
                    ps.setString(1, j.getCompte().getLogin());
                    ps.executeUpdate();
                    request.setAttribute("msg", "mot de passe changer avec succes!");
                    request.setAttribute("typemsg", "success");
                    request.getRequestDispatcher("/jsp/changermdp.jsp").forward(request, response);
                } else {
                    request.setAttribute("msg", "les deux mot de passe ne correspandant pas");
                    request.setAttribute("typemsg", "error");
                    request.getRequestDispatcher("/jsp/changermdp.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "l'ancien mot de passe est invalide");
                request.setAttribute("typemsg", "error");
                request.getRequestDispatcher("/jsp/changermdp.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(ChangerMdp.class.getName()).log(Level.SEVERE, null, ex);
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
