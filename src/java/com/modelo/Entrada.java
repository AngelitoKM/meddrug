/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import java.sql.Date;

public class Entrada {
    int Cantidad;
    Date FechaEntrada;
    String Referencia;

    public Entrada() {
        
    }

    public Entrada(int Cantidad, Date FechaEntrada, String Referencia) {
        this.Cantidad = Cantidad;
        this.FechaEntrada = FechaEntrada;
        this.Referencia = Referencia;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public Date getFechaEntrada() {
        return FechaEntrada;
    }

    public String getReferencia() {
        return Referencia;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public void setFechaEntrada(Date FechaEntrada) {
        this.FechaEntrada = FechaEntrada;
    }

    public void setReferencia(String Referencia) {
        this.Referencia = Referencia;
        
    }
    
}