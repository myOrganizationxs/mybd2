/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import static modelo.registro.rs;

/**
 *
 * @author sergio
 */
public class ejemplo 
{
    int nodo5;
    int idpadre5;
    String nombredep5;
    
    public void buscarnodo(int abc)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select Idpadre,nombre_departamento from nodo,orbita where organizacion_idorganizacion=1 and idnodo='"+abc+"' and idnodo=nodo_idnodo order by IdNodo asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                 nodo5 = rs.getInt (1);
                 nombredep5=rs.getString(2);
              
                 if(nodo5!=0)
                 {
                  System.out.print (nodo5+" ");
                  System.out.println (nombredep5);
                  buscarnodo(nodo5);
                    
                 }                                  
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }       
    }
    
    public static void main(String args[])
    {
        ejemplo mye = new ejemplo ();
        mye.buscarnodo(1);
        //mye.buscarnodopadre();
    }
}
