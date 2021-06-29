/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controller.AccesoBaseDatos;
import dtoModel.ListadoAlumnosDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DetalleExamen;
import model.Examen;
import model.Usuario;

/**
 *
 * @author Emiliano Barat
 */
@WebServlet(name = "AltaExamen", urlPatterns = {"/AltaExamen"})
public class AltaExamen extends HttpServlet {

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("usuario");
        if (user != null && !user.getNombreUsuario().equals("")) {
            AccesoBaseDatos gestor = new AccesoBaseDatos();
            int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));

            ListadoAlumnosDTO dtoAlumno = gestor.buscarAlumno(idAlumno);

            String nombreCategoria = dtoAlumno.getCategoria().getDescripcion();
            int idCategoria = dtoAlumno.getCategoria().getIdCategoria();

            request.setAttribute("categoria", nombreCategoria);
            request.setAttribute("idCategoria", idCategoria);
            request.setAttribute("alumnoDto", dtoAlumno);

            RequestDispatcher rd = request.getRequestDispatcher("altaExamen.jsp");
            rd.forward(request, response);
        } else {
            String msjNoUser = "No hay usuario logueado.\nIngrese sus credenciales.";
            request.setAttribute("msj", msjNoUser);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int puntajeAcum = 0;
        int cantPruebasRendidas = 0;

        int idAluno = Integer.parseInt(request.getParameter("txtIdAlumno"));
        int idCateg = Integer.parseInt(request.getParameter("txtIdCategoria"));
        int tipoExamen = Integer.parseInt(request.getParameter("cmbTipoExamen"));
        int idProfe = Integer.parseInt(request.getParameter("cmbProfesor"));
        String fechaExamen = request.getParameter("dtpFechaExamen");

        //tengo que hacer el insert en tabla 'examen' para obtener un 'idExamen'
        //para poder llenar el 'detalleExamen'
        //luego voy a insertar en detalleExamenes un registro por cada campo de resultados de pruebas con dato.
        //cuando tenga todos los puntajes de las pruebas rendidas voy a promediar los puntajes y hacer un upDate
        //de el registro examen colocando el promedio.
        String obs = request.getParameter("txtObservaciones");

        Examen e = new Examen(tipoExamen, fechaExamen, idProfe, idAluno, obs, idCateg);

        AccesoBaseDatos gestor = new AccesoBaseDatos();
        
        
        

        //OBTENGO EL ID DEL ULTIMO EXAMEN CREADO
       // int idUltimoExamen = gestor.buscarIdUltimoExamen();

        //Le paso al proximo .jsp el id de examen recien cargado para buscar el Dto y mostar los datos de examen
        //request.setAttribute("idExamen", idUltimoExamen);

        int idGenero = Integer.parseInt(request.getParameter("txtIdGenero"));

        //PROXIMO PASO TRAER LOS RESULTADOS DE LAS PRUEBAS Y HACER LOS IF()
        //Y LOS INSERTS POR CADA TRUE!!!
        double timeCarrera = 0;
        if (!request.getParameter("txtcarrera3k").trim().equals("")) {
            timeCarrera = Double.parseDouble(request.getParameter("txtcarrera3k"));
        } else {
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebacarrera3k"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, timeCarrera);

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, timeCarrera, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);
        }
        if (timeCarrera != 0) {
            //necesito todos los datos para hacer el insert en detalleExamen.
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebacarrera3k"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, timeCarrera);

            puntajeAcum += puntaje;
            cantPruebasRendidas++;

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, timeCarrera, puntaje, idProfe, obs);
            e.agregarDetalles(de);

//            gestor.registrarDetalleExamen(de);

        }

        double cantFlex = 0;
        String txtFlexiones = request.getParameter("txtflexo-extenciones").trim();
        if (!txtFlexiones.trim().equals("")) {
            cantFlex = Double.parseDouble(request.getParameter("txtflexo-extenciones"));
        } else {
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebaflexo-extenciones"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantFlex);

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantFlex, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);
        }
        if (cantFlex != 0) {
            //necesito todos los datos para hacer el insert en detalleExamen.
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebaflexo-extenciones"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantFlex);

            puntajeAcum += puntaje;
            cantPruebasRendidas++;

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantFlex, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);

        }

        double cantBarras = 0;
        if (!request.getParameter("txtbarras").trim().equals("")) {
            cantBarras = Double.parseDouble(request.getParameter("txtbarras"));
        } else {
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebabarras"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantBarras);

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantBarras, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);
        }

        if (cantBarras != 0) {
            //necesito todos los datos para hacer el insert en detalleExamen.
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebabarras"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantBarras);

            puntajeAcum += puntaje;
            cantPruebasRendidas++;

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantBarras, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);

        }

        double cantAbs = 0;
        if (!request.getParameter("txtabdominales").trim().equals("")) {
            cantAbs = Double.parseDouble(request.getParameter("txtabdominales"));
        } else {
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebaabdominales"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantAbs);

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantAbs, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);
        }

        if (cantAbs != 0) {
            //necesito todos los datos para hacer el insert en detalleExamen.
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebaabdominales"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, cantAbs);

            puntajeAcum += puntaje;
            cantPruebasRendidas++;

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, cantAbs, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);

        }

        double timeCaminata = 0;
        String txtCaminata = request.getParameter("txtcaminata").trim();
        if (!txtCaminata.equals("")) {
            timeCaminata = Double.parseDouble(request.getParameter("txtcaminata"));
        } else {
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebacaminata"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, timeCaminata);

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, timeCaminata, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);
        }

        if (timeCaminata != 0) {
            //necesito todos los datos para hacer el insert en detalleExamen.
            int idPrueba = Integer.parseInt(request.getParameter("txtIdTipoPruebacaminata"));
            int puntaje = gestor.obtenerResultado(idCateg, idPrueba, idGenero, timeCaminata);

            puntajeAcum += puntaje;
            cantPruebasRendidas++;

            DetalleExamen de = new DetalleExamen( idPrueba, fechaExamen, timeCaminata, puntaje, idProfe, obs);
            e.agregarDetalles(de);
//            gestor.registrarDetalleExamen(de);

        }

        
        
        gestor.registrarExamen(e);
        //update de la nota final que habia sido cargada en cero
//        gestor.updateNotaExam(promedio, idUltimoExamen);

        RequestDispatcher rd = request.getRequestDispatcher("exitoCarga.jsp");
        rd.forward(request, response);

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
