package com.controlador;


import com.modelo.Producto;
import com.modeloDAO.ProductoDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Controlador extends HttpServlet {
    
    
   
    
     

    List<Producto> ListaCarrito = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        String accion = request.getParameter("accion");
        Producto p = new Producto();
        ProductoDAO pdao = new ProductoDAO();
        switch (accion) {
            case "Guardar":
                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                            fileItem.write(f);
                            p.setRuta("http://localhost/img/" + fileItem.getName());
                        
                        } else {
                            lista.add(fileItem.getString());
                        }
                    }
                    p.setNombre(lista.get(0));
                    p.setDescripcion(lista.get(1));
                    p.setCodigo(lista.get(2));
                    p.setMarca(lista.get(3));
                    pdao.agregar(p);
                } catch (Exception e) {
                }

                request.getRequestDispatcher("Controlador?accion=Listar").forward(request, response);
                break;
            case "Listar":
                List<Producto> productos = pdao.listar();
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("producto.jsp").forward(request, response);
                break;
            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < ListaCarrito.size(); i++) {
                    if (ListaCarrito.get(i).getId() == idproducto) {
                        ListaCarrito.remove(i);
                    }
                }
                break;
            case "eliminarProducto":
                eliminarProducto(request, response);
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

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
        ProductoDAO dao = new ProductoDAO();
        Producto usus = new Producto();
        if (request.getParameter("cod") != null) {
            usus.setId(Integer.parseInt(request.getParameter("cod")));
            try {
                dao.eliminarProducto(usus);
                response.sendRedirect("Controlador?accion=Listar");
            } catch (Exception e) {
                request.setAttribute("msje", "No se pudo acceder a la base de datos" + e.getMessage());
            }
        } else {
            request.setAttribute("msje", "No se encontro el usuario");
        }
    }
    
     
    

}
