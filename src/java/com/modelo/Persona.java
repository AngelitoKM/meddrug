
package com.modelo;

public class Persona {
       
    int id;
    String tipoDoc;
    String numDoc;
    String nom;
    String ape;
    String correo;
    String tel;
    String clave;
    
    
   public Persona() {
         
   }
   
   public Persona(int id, String tipoDoc, String numDoc, String nom, String ape, String correo, String tel, String clave){
       
       this.id = id;
       this.tipoDoc = tipoDoc;
       this.numDoc = numDoc;
       this.nom = nom;
       this.ape = ape;
       this.correo = correo;
       this.tel = tel;
       this.clave = clave;
       
   }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipoDoc() {
        return tipoDoc;
    }

    public void setTipoDoc(String tipoDoc) {
        this.tipoDoc = tipoDoc;
    }

    public String getNumDoc() {
        return numDoc;
    }

    public void setNumDoc(String numDoc) {
        this.numDoc = numDoc;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }
   
   
}
