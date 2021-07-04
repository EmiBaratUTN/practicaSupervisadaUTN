/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.AccesoBaseDatos;
import dtoModel.ExamenDto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Examen;
import model.Pesaje;
import model.Usuario;

/**
 *
 * @author Emiliano Barat
 */
@WebServlet(name = "EditarPesaje", urlPatterns = {"/EditarPesaje"})
public class EditarPesaje extends HttpServlet {

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

        AccesoBaseDatos gestor = new AccesoBaseDatos();

//      Obtengo idExamen desde el parametro de la URL
//      verifico que haya usuario logueado
        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("usuario");

        int idExamen = 0;
        if (user != null && !user.getNombreUsuario().equals("")) {
//            verifico que el usuario tenga los permisos de administrador
            if (user.getTipoUsuario().getIdTipoUsuario() == 1) {

                try {
                    int idPesaje = Integer.parseInt(request.getParameter("idPesaje"));
                    Pesaje p = gestor.buscarPesaje(idPesaje);
                    request.setAttribute("pesaje", p);
                    RequestDispatcher rd = request.getRequestDispatcher("editarPesajeAlumno.jsp");
                    rd.forward(request, response);
                } catch (Exception e) {
                    RequestDispatcher rd = request.getRequestDispatcher("ListarAlumnosPeso");
                    rd.forward(request, response);
                }

            } else {
//                cuando no tiene los permisos de edicion de examen lo redirijo al listado de examenes con un mensaje
                String msj = "No tiene permisos para editar un pesaje. Comunicarse con un administrador";
                request.setAttribute("msj", msj);
                RequestDispatcher rd = request.getRequestDispatcher("ListarPeso");
                rd.forward(request, response);
            }
        } else {
            String msjNoUser = "No hay usuario logueado.\nIngrese sus credenciales.";
            request.setAttribute("msj", msjNoUser);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

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
        //traer los datos editaqdos de editarPesajeAlumno.jsp
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
