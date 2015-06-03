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
@WebServlet(name = "controlarnodousu2", urlPatterns = {"/controlarnodousu2"})
public class controlarnodousu2 extends HttpServlet {

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
            registro rgt = new registro();
            
          request.setAttribute("idorganizacion",Integer.parseInt(request.getParameter("idorganizacion")));
          request.setAttribute("nombreorg",(request.getParameter("nombreorg")));
          request.setAttribute("idnodo",(Integer.parseInt(request.getParameter("idnodo")))); 
         // request.setAttribute("controlanodos",(Integer.parseInt(request.getParameter("controlanodos"))));
         //JOptionPane.showMessageDialog(null,request.getParameter("idorganizacion")+" "+request.getParameter("nombreorg")+" "+request.getParameter("idnodo"));

            
            //if(Integer.parseInt(request.getParameter("controlanodos"))==0)
            //{
               rgt.buscarnodo2(Integer.parseInt(request.getParameter("idorganizacion")),Integer.parseInt(request.getParameter("idnodo")));
               //JOptionPane.showMessageDialog(null,"Id: "+rgt.getIdnodo1()+" padre: "+rgt.getIdPadre()+" Organizacion: "+request.getParameter("idorganizacion"));
               rgt.empresanodoorbita(Integer.parseInt(request.getParameter("idorganizacion")),rgt.getIdnodo1());
                // rgt.getIdNodo();
               //JOptionPane.showMessageDialog(null,rgt.getIdpadre2()+rgt.getCargo2());
             
               
               response.sendRedirect("empresa2.jsp?nodousu="+request.getParameter("nodousu")+"&&alerta=0&&idnodo="+rgt.getIdnodo2()+"&&nodopadre="+rgt.getIdpadre2()+"&&cargo="+rgt.getCargo2()+"&&idorganizacion="+rgt.getIdorganizacion2()+"&&nombreorg="+rgt.getNombreorganizacion2()+"&&idorbita="+rgt.getIdorbita2()+"&&nombredep="+rgt.getNombredep2()+"&&mision="+rgt.getMision2()+"&&vision="+rgt.getVision2()+"&&posicion="+rgt.getPosicion2()+"&&usuario2="+request.getParameter("usuario2")+"&&ap2="+request.getParameter("ap2")+"&&am2="+request.getParameter("am2")+"&&idusuario2="+request.getParameter("idusuario2"));

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
