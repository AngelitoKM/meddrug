package com.controlador;

import com.modelo.Persona;
import com.modeloDAO.PersonaDAO;
import java.io.IOException;
import javafx.scene.control.Alert;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author angel
 */
@WebServlet(name = "Logincontrolador", urlPatterns = {"/Logincontrolador"})
public class Logincontrolador extends HttpServlet {
    
    PersonaDAO dao= new PersonaDAO();
    Persona p = new Persona();
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String numDoc=request.getParameter("txtdoc");
            String clave=request.getParameter("txtclave");
            p.setNumDoc(numDoc);
            p.setClave(clave);
            r = dao.validar(p);
            if (r==1) {    
                request.getRequestDispatcher("Controlador?accion=Guardar").forward(request, response);
                
            }else{               
                request.getRequestDispatcher("lognform.html").forward(request, response);
                
            }
            
            
        }else{
           
        request.getRequestDispatcher("lognform.html").forward(request, response);
        }
    
}
    
    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
   