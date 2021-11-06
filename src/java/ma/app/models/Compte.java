/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.app.models;

/**
 *
 * @author saad
 */
public class Compte {
    
    String login;
    String mdp;
    String role;

    public Compte() {
    }
    
    public Compte(String login, String mdp,String role) {
        this.login = login;
        this.mdp = mdp;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

   

    public String getLogin() {
        return login;
    }

    public String getMdp() {
        return mdp;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Compte{" + "login=" + login + ", mdp=" + mdp + ", role=" + role + '}';
    }
    
    
    
    

    
    
    
    
    
    
}
