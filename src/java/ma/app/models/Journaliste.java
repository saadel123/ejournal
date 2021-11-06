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
public class Journaliste {
    
    int idj;
    String nom;
    String prenom;
    String email;
     Compte compte;

    public Journaliste() {
    }

    public Journaliste(int idj, String nom, String prenom, String email, Compte compte) {
        this.idj = idj;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
     
        this.compte = compte;
    }

    public int getIdj() {
        return idj;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getEmail() {
        return email;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }

    

   

    @Override
    public String toString() {
        return "Journaliste{" + "idj=" + idj + ", nom=" + nom + ", prenom=" + prenom + ", email=" + email +  ", compte=" + compte + '}';
    }
    
    
    
    
}
