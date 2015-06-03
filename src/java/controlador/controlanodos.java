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
@WebServlet(name = "controlanodos", urlPatterns = {"/controlanodos"})
public class controlanodos extends HttpServlet {

    
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
        //int idpadre=0;
        registro rgt = new registro();
        {
        try (PrintWriter out = response.getWriter()) 
        {
                        
          //  registro rgs = new registro();
          request.setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
          request.setAttribute("NombreEmpresa",(request.getParameter("NombreEmpresa")));
          request.setAttribute("primero",(Integer.parseInt(request.getParameter("primero")))); 
         // request.setAttribute("controlanodos",(Integer.parseInt(request.getParameter("controlanodos"))));
         JOptionPane.showMessageDialog(null,"Bienvenido a "+request.getParameter("NombreEmpresa"));

            
            //if(Integer.parseInt(request.getParameter("controlanodos"))==0)
            //{
               rgt.buscarnodo(Integer.parseInt(request.getParameter("idorganizacion")),0);
               //JOptionPane.showMessageDialog(null,"Id: "+rgt.getIdnodo1()+" padre: "+rgt.getIdPadre()+" Organizacion: "+request.getParameter("idorganizacion"));
               rgt.empresanodoorbita(Integer.parseInt(request.getParameter("idorganizacion")),rgt.getIdnodo1());
                // rgt.getIdNodo();
               //JOptionPane.showMessageDialog(null,rgt.getIdpadre2()+rgt.getCargo2());
              response.sendRedirect("empresa.jsp?idnodo="+rgt.getIdnodo2()+"&&nodopadre="+rgt.getIdpadre2()+"&&cargo="+rgt.getCargo2()+"&&idorganizacion="+rgt.getIdorganizacion2()+"&&nombreorg="+rgt.getNombreorganizacion2()+"&&idorbita="+rgt.getIdorbita2()+"&&nombredep="+rgt.getNombredep2()+"&&mision="+rgt.getMision2()+"&&vision="+rgt.getVision2()+"&&posicion="+rgt.getPosicion2());
            //}
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
