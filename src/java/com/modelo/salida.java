/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import java.sql.Date;

public class salida {
   int cantidadSalida;
   Date fechaSalida;
   String statusSalida;

    public salida() {
    }

    public salida(int cantidadSalida, Date fechaSalida, String statusSalida) {
        this.cantidadSalida = cantidadSalida;
        this.fechaSalida = fechaSalida;
        this.statusSalida = statusSalida;
    }

    public int getCantidadSalida() {
        return cantidadSalida;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public String getStatusSalida() {
        return statusSalida;
    }

    public void setCantidadSalida(int cantidadSalida) {
        this.cantidadSalida = cantidadSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public void setStatusSalida(String statusSalida) {
        this.statusSalida = statusSalida;
    }
}
