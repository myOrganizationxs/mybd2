/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import modelo.Conexion;
import modelo.registro;

/**
 *
 * @author sergio
 */
@WebServlet(name = "ValidarCuenta", urlPatterns = {"/ValidarCuenta"})
public class ValidarCuenta extends HttpServlet {
        static PreparedStatement pr=null;
    static ResultSet rs=null;

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
            //JOptionPane.showMessageDialog(null,"cuenta");
        Conexion myc = new Conexion();
        registro myr = new registro();
        Connection reg=myc.conexion();//Select * from usuario,cuenta,organizacion,nodo where usuario='123456' and Contraseña='123456' and cuenta_idcuenta=idcuenta and idnodo=nodo_idnodo and idorganizacion=organizacion_idorganizacion";
        String sql="Select * from usuario,cuenta,organizacion,nodo where usuario='"+request.getParameter("usuario")+"' and Contraseña='"+request.getParameter("contra")+"' and cuenta_idcuenta=idcuenta and idnodo=nodo_idnodo and idorganizacion=organizacion_idorganizacion";
        //1 idusuario
        //16 tipo
        //17 estado
        //18 modo
        //12 ultima conexion
        //19 organizacion
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            //revisa si existe el usuario y contraseña pero no se fija en mayusculas y minusculas
            JOptionPane.showMessageDialog(null,"llega aqui");
            if (rs.next()) 
            {
                JOptionPane.showMessageDialog(null,"llega aqui 1");
                 myr.setNombre(rs.getString(4));
                 myr.setAp(rs.getString(3));
                 myr.setAm(rs.getString(2));
                 myr.setIdusuario(rs.getInt(1));
                 myr.setUs(rs.getString (15));                      
                 myr.setTipo(rs.getInt (16));
                 myr.setEstado(rs.getInt(17));
                 myr.setModo(rs.getInt(18));
                 myr.setUtimacon(rs.getString(12));
                 myr.setIdOrganizacion(rs.getInt(19));
                 myr.setNombreEmpresa(rs.getString(20));
                 myr.setNodousu(rs.getInt(22));
                 
                //Compara las cadenas de los usuario por que no lo compara mysql
                 
                 if(myr.getUs().equals(request.getParameter("usuario")))
                 {
                     //Si es usuario o Admin
                     if(myr.getTipo()==1)
                     {
                         //si esta Activa o desactivada
                         if(myr.getEstado()==1)
                         {
                             //llevara a una pagina con un formulario para llenarlo
                             if(myr.getUtimacon()==null)
                             {
                                 JOptionPane.showMessageDialog(null,"LLena El siguente formulario");
                                 response.sendRedirect("Formulario.jsp?idusuario="+myr.getIdusuario()+"&&nodousu="+myr.getNodousu());
                             }
                             //mandara a la pagina de incio del usuario
                             else
                             {
                                 if(myr.getIdOrganizacion() == 0)
                                {
                                    //si tiene un cargo asinado entra
                                    JOptionPane.showMessageDialog(null,"Tu cuenta es conrrecta pero no cuenta con un cargo dentro de la Organización");
                                    response.sendRedirect("index.jsp");
                                }
                                 else
                                 {
                                     
                                     //Si tiene un cargo asignado                                    
                                     JOptionPane.showMessageDialog(null,"Bienvenido a "+myr.getNodousu()+"");
                                     response.sendRedirect("controlarnodousu?alerta=1&&idorganizacion="+myr.getIdOrganizacion()+"&&primero=0&&nombreorg="+myr.getNombreEmpresa()+"&&usuario2="+myr.getNombre()+"&&ap2="+myr.getAp()+"&&am2="+myr.getAm()+"&&idusuario2="+myr.getIdusuario()+"&&nodousu="+myr.getNodousu());
                                     
                                 }
                                 
                            }
                         }
                         //en caso de error pasa a este que esta desactivada
                         else
                         {
                             JOptionPane.showMessageDialog(null,"Tu cuenta No esta Disponible ");
                             response.sendRedirect("index.jsp");
                         }
                    }
                     
                     
                     
                     //administrador u otros
                     if(myr.getTipo()==2)
                     {
                        //llevara a una pagina con un formulario para llenarlo
                         if(myr.getUtimacon()==null)
                         {
                             JOptionPane.showMessageDialog(null,"LLena el siguente formulario");
                             response.sendRedirect("formularioadminxs.jsp?idusuario="+myr.getIdusuario());
                         }
                         //mandara a la pagina de incio del admin
                         else
                         {   JOptionPane.showMessageDialog(null,"Bienvenido");                          
                             response.sendRedirect("admininicio.jsp?idorganizacion="+myr.getIdOrganizacion()+"&&primero=0&&nombreorg="+myr.getNombreEmpresa()+"&&usuario="+myr.getNombre()+"&&usuario="+myr.getNombre()+"&&ap="+myr.getAp()+"&&am="+myr.getAm()+"&&idusuario="+myr.getIdusuario());
                         }
                     }
                 }
                 //muestra cadenas si son validas
                 else
                 {
                     JOptionPane.showMessageDialog(null,"Usuario o Contraseña Incorrectos cadenas invalidas");
                     response.sendRedirect("index.jsp");
                 }
            }
            //si no esta el usuario entra aqui
            else
            {
                JOptionPane.showMessageDialog(null,"Usuario o Contraseña Incorrecto usuario entra aqui");
                response.sendRedirect("index.jsp");
            }
        } 
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null,"Error "+e);
        }
            
            
           // response.sendRedirect("admininicio.jsp");
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
