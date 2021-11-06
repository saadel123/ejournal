/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.app.models;

import java.util.Date;

/**
 *
 * @author saad
 */
public class Article {

    int ida;
    String titre;
    String text;
    String img;
    Date datepub;
    Date datecreation;
    String etat;
    Journaliste journaliste;
    int idcat;

    public Article() {
    }

    public Article(int ida, String titre, String text, String img, Date datepub, Date datecreation, String etat, Journaliste journaliste, int idcat) {
        this.ida = ida;
        this.titre = titre;
        this.text = text;
        this.img = img;
        this.datepub = datepub;
        this.datecreation = datecreation;
        this.etat = etat;
        this.journaliste = journaliste;
        this.idcat = idcat;
    }

    public int getIda() {
        return ida;
    }

    public String getTitre() {
        return titre;
    }

    public String getText() {
        return text;
    }

    public String getImg() {
        return img;
    }

    public Date getDatepub() {
        return datepub;
    }

    public Date getDatecreation() {
        return datecreation;
    }

    public String getEtat() {
        return etat;
    }

    public Journaliste getJournaliste() {
        return journaliste;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIda(int ida) {
        this.ida = ida;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setDatepub(Date datepub) {
        this.datepub = datepub;
    }

    public void setDatecreation(Date datecreation) {
        this.datecreation = datecreation;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public void setJournaliste(Journaliste journaliste) {
        this.journaliste = journaliste;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
    }

    @Override
    public String toString() {
        return "Article{" + "ida=" + ida + ", titre=" + titre + ", text=" + text + ", img=" + img + ", datepub=" + datepub + ", datecreation=" + datecreation + ", etat=" + etat + ", journaliste=" + journaliste + ", idcat=" + idcat + '}';
    }

}
