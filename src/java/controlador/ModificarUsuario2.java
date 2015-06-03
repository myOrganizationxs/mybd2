/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.registro;

/**
 *
 * @author sergio
 */
@WebServlet(name = "ModificarUsuario2", urlPatterns = {"/ModificarUsuario2"})
public class ModificarUsuario2 extends HttpServlet {

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
            
            registro myr = new registro();
            myr.ModificarUsuario(Integer.parseInt(request.getParameter("idusuario")),request.getParameter("app"), request.getParameter("apm"), request.getParameter("nombre"),request.getParameter("fechadenacimiento"), request.getParameter("foto"),request.getParameter("correo"),request.getParameter("numero"),request.getParameter("usuario"),request.getParameter("contra"));
            //response.sendRedirect("empresa2.jsp?idnodo="+request.getParameter("idnodo")+"&&nodopadre="+request.getParameter("nodopadre")+"&&cargo="+request.getParameter("cargo")+"&&idorganizacion="+request.getParameter("idorganizacion")+"&&nombreorg="+request.getParameter("nombreorg")+"&&idorbota="+request.getParameter("idorbota")+"&&nombredep="+request.getParameter("nombredep")+"&&mision="+request.getParameter("mision")+"&&vision="+request.getParameter("vision")+"&&posicion="+request.getParameter("posicion")+"&&usuario2="+request.getParameter("usuario2")+"&&am2="+request.getParameter("am2")+"&&ap2="+request.getParameter("ap2")+"&&idusuario2="+request.getParameter("idusuario2"));
            response.sendRedirect("empresa2.jsp?nodousu="+request.getParameter("nodousu")+"&&alerta=0&&idnodo="+request.getParameter("idnodo")+"&&nodopadre="+request.getParameter("nodopadre")+"&&cargo="+request.getParameter("cargo")+"&&idorganizacion="+request.getParameter("idorganizacion")+"&&nombreorg="+request.getParameter("nombreorg")+"&&idorbita="+request.getParameter("idorbota")+"&&nombredep="+request.getParameter("nombredep")+"&&mision="+request.getParameter("mision")+"&&vision="+request.getParameter("vision")+"&&posicion="+request.getParameter("posicion")+"&&usuario2="+request.getParameter("usuario2")+"&&am2="+request.getParameter("am2")+"&&ap2="+request.getParameter("ap2")+"&&idusuario2="+request.getParameter("idusuario2"));
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
