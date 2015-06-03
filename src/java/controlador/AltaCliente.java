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
import javax.swing.JOptionPane;
import modelo.registro;

/**
 *
 * @author sergio
 */
@WebServlet(name = "AltaCliente", urlPatterns = {"/AltaCliente"})
public class AltaCliente extends HttpServlet {

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
            myr.UsuarioModif(Integer.parseInt(request.getParameter("idusuario")),request.getParameter("app"), request.getParameter("apm"), request.getParameter("nombre"),request.getParameter("fechadenacimiento"), request.getParameter("foto"),request.getParameter("correo"),request.getParameter("numero"),request.getParameter("usuario"),request.getParameter("contra"));
            if(Integer.parseInt(request.getParameter("idorganizacion"))==0)
            {
            JOptionPane.showMessageDialog(null,"Tus datos fueron actualizados pero no cuentas con un cargo dentro de la organización");
            response.sendRedirect("index.jsp");
            }
            else
            {
            JOptionPane.showMessageDialog(null,"Bienvenido a "+request.getParameter("NombreEmpresa")+"");
            response.sendRedirect("controlarnodousu?idorganizacion="+request.getParameter("idorganizacion")+"&&primero=0&&NombreEmpresa="+request.getParameter("NombreEmpresa")+"&&nombre="+request.getParameter("nombre")+"&&ap2="+request.getParameter("app")+"&&am2="+request.getParameter("apm")+"&&usuario2="+request.getParameter("nombre")+"&&idusuario2="+request.getParameter("idusuario")+"&&nodousu="+request.getParameter("nodousu"));
            }    
            //response.sendRedirect("controlarnodousu?idorganizacion="+request.getParameter("idorganizacion")+"&&primero=0&&NombreEmpresa="+request.getParameter("NombreEmpresa")+"");
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
