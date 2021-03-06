
package com.controlador;

import com.modelo.Usuario;
import com.modeloDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "Controladorusu", urlPatterns = {"/Controladorusu"})
public class Controladorusu extends HttpServlet {
    
    List<Usuario> ListaCarrito = new ArrayList<>();

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Usuario usu = new Usuario();
        UsuarioDAO udao = new UsuarioDAO();
        switch (accion) {
            case "Guardar":
                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    usu.setTipoDocu(lista.get(0));
                    usu.setNumDocu(lista.get(1));
                    usu.setNombre(lista.get(2));
                    usu.setApellido(lista.get(3));
                    usu.setCorreo1(lista.get(4));
                    usu.setTelefono(lista.get(5));
                    usu.setClave1(lista.get(6));
                    udao.agregar(usu);
                } catch (Exception e) {
                }

                request.getRequestDispatcher("Controladorusu?accion=Listar").forward(request, response);
                break;
            case "Listar":
                List<Usuario> usuarios = udao.listar();
                request.setAttribute("usuarios", usuarios);
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                break;
            case "Delete":
                int idusuario = Integer.parseInt(request.getParameter("idu"));
                for (int i = 0; i < ListaCarrito.size(); i++) {
                    if (ListaCarrito.get(i).getIdu() == idusuario) {
                        ListaCarrito.remove(i);
                    }
                }
                break;
            case "eliminarUsuario":
                eliminarUsuario(request, response);
                break;
            case "validarDocumento":
                validarDocumento(request,response);
              break;

            default:
                throw new AssertionError();

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

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usu = new Usuario();
        if (request.getParameter("code") != null) {
            usu.setIdu(Integer.parseInt(request.getParameter("code")));
            try {
                dao.eliminarUsuario(usu);
                response.sendRedirect("Controladorusu?accion=Listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el usuario");
        }
    }

    private void validarDocumento(HttpServletRequest request, HttpServletResponse response) throws IOException {
    UsuarioDAO dao = new UsuarioDAO();
    Usuario usu = new Usuario();
        response.setContentType("text/html; charset-iso-8859-1");
        PrintWriter out=response.getWriter();
        try {
           int cant = dao.validarDocumento(request.getParameter("numDoc"));
            System.out.println("Usuarios Encontrados"+cant);
            
            if (cant !=0) {
                System.out.println("El correo ya se encuentra registrado");
                out.println("El correo se encuentra registrado!!");
            }else{
                System.out.println("El correo no esta registrado");
                out.println("El correo no se encuentra registrado :3");
            }
        } catch (SQLException e) {
            System.out.println("Correo no encontrado"+e.getMessage());
        } finally{
            
        }
    
    
    }

}
