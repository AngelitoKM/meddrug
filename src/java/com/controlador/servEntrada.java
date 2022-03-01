/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Entrada;
import com.modelo.salida;
import com.modeloDAO.EntradaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
 @WebServlet(name = "UsuarioControlador", urlPatterns = {"/servEntrada"})
public class servEntrada extends HttpServlet {

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
            int Cantidad;
            Date FechaEntrada;
            String Referencia;
            String referencia2;
            Entrada entrada1= new Entrada();
            Entrada entrada3= new Entrada();
            salida salida1=new salida();
            EntradaDAO dao=new EntradaDAO();
            Entradacontroller entrada2 = new Entradacontroller();
            SalidaController salida2= new SalidaController();
            String r;
            //_________________________________________________
            //btn guardar
            //_________________________________________________
            if(request.getParameter("btnguardar")!=null){
                System.out.print("ok");
                Cantidad= Integer.parseInt(request.getParameter("cantidad"));
                FechaEntrada=Date.valueOf(request.getParameter("FechaEntrada"));
                Referencia=request.getParameter("Referencia");
                entrada1.setCantidad(Cantidad);
                entrada1.setFechaEntrada(FechaEntrada);
                entrada1.setReferencia(Referencia);
                r=entrada2.registrarEnBD(entrada1);
                
                if (r=="ok"){
                    request.getRequestDispatcher("Inventario.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("addEntrada.jsp").forward(request, response);
                    
                }
            }
            //_________________________________________________
            //btn consultar
            //_________________________________________________
            if(request.getParameter("btnconsultar")!=null){
                referencia2=request.getParameter("Referencia");    
                entrada3.setReferencia(referencia2);
                int rs;
                Date f;
                String ref1;
                List lista2=entrada2.obtenerEntrada(entrada3);
                //rs=entrada3.getCantidad();
               // f=entrada3.getFechaEntrada();
                //ref1=entrada3.getReferencia();
                request.setAttribute("entradax",lista2);
                request.getRequestDispatcher("consulta.jsp").forward(request, response);
                
            }
            //_________________________________________________
            //btn eliminar
            //_________________________________________________
            
            if(request.getParameter("btneliminar")!=null){
                
                String referencia=request.getParameter("statusSalida");
                salida1.setStatusSalida(referencia);
                r=salida2.registrarSalida(salida1);
               if (r=="ok"){
                    request.getRequestDispatcher("Inventario.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("Salida.jsp").forward(request, response);
                }
            }
            //_________________________________________________
            //btn Registrar Salida
            //_________________________________________________
            
            if(request.getParameter("regSalida")!=null){
                int a1=0,a2=0,a3=0;
                String cantidad=request.getParameter("cantidadSalida");
                String fecha=request.getParameter("fechaSalida");
                String referencia=request.getParameter("statusSalida");
                a1=Integer.parseInt(cantidad);
                
                entrada3.setReferencia(referencia);
                a2=entrada2.obtenerCantidad(entrada3);   
                a3=a2-a1;
                if (a3<0){
                    a3=0;
                }
                salida1.setCantidadSalida(a3);
                salida1.setFechaSalida(Date.valueOf(fecha));
                salida1.setStatusSalida(referencia);
            
                r=salida2.actualizarInventario(salida1);
                if (r=="ok"){
                    request.getRequestDispatcher("Inventario.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("Salida.jsp").forward(request, response);
                }
            }
            else{
                out.print("error");
            }
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
        processRequest(request, response);
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
