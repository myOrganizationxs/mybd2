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
@WebServlet(name = "ModificarNodo", urlPatterns = {"/ModificarNodo"})
public class ModificarNodo extends HttpServlet {

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
            
        request.getSession().setAttribute("nombreorg",request.getParameter("nombreorg"));        
        request.getSession().setAttribute("idnodo",Integer.parseInt(request.getParameter("idnodo")));
        request.getSession().setAttribute("nodopadre",Integer.parseInt(request.getParameter("nodopadre")));
        request.getSession().setAttribute("cargo",request.getParameter("cargo"));
        request.getSession().setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
        request.getSession().setAttribute("idorbita",Integer.parseInt(request.getParameter("idorbita")));
        request.getSession().setAttribute("nombredep",request.getParameter("nombredep"));
        request.getSession().setAttribute("mision",request.getParameter("mision"));
        request.getSession().setAttribute("vision",request.getParameter("vision"));
        request.getSession().setAttribute("posicion",Integer.parseInt(request.getParameter("posicion")));
        request.getSession().setAttribute("variable",Integer.parseInt(request.getParameter("variable")));

        int padre = Integer.parseInt(request.getParameter("idpadrenuevo"));
        int idnodo = Integer.parseInt(request.getParameter("idnuevo"));
        String puesto= String.valueOf(request.getParameter("nuevopuesto"));
        registro reg= new registro(); 
        reg.modificarnodo(idnodo,padre,puesto);
        //JOptionPane.showMessageDialog(null,"Modificado");
            if(Integer.parseInt(request.getParameter("variable"))==0)
            {
            response.sendRedirect("empresa.jsp?idnodo="+request.getParameter("idnodo")+"&&nodopadre="+request.getParameter("nodopadre")+"&&cargo="+puesto+"&&idorganizacion="+request.getParameter("idorganizacion")+"&&nombreorg="+request.getParameter("nombreorg")+"&&idorbita="+request.getParameter("idorbita")+"&&nombredep="+request.getParameter("nombredep")+"&&mision="+request.getParameter("mision")+"&&vision="+request.getParameter("vision")+"&&posicion="+request.getParameter("posicion"));
            }
            if(Integer.parseInt(request.getParameter("variable"))==1)
            {
            response.sendRedirect("empresa.jsp?idnodo="+request.getParameter("idnodo")+"&&nodopadre="+request.getParameter("nodopadre")+"&&cargo="+request.getParameter("cargo")+"&&idorganizacion="+request.getParameter("idorganizacion")+"&&nombreorg="+request.getParameter("nombreorg")+"&&idorbita="+request.getParameter("idorbita")+"&&nombredep="+request.getParameter("nombredep")+"&&mision="+request.getParameter("mision")+"&&vision="+request.getParameter("vision")+"&&posicion="+request.getParameter("posicion"));
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
