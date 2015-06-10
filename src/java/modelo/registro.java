/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.Vector;
import javax.swing.JOptionPane;

/**
 *
 * @author sergio
 */
public class registro 
{
    //variables de Organizacion
    private String NombreEmpresa;
    private int ultimaempresa;
    private int idOrganizacion;
    private int estadoOrganizacion;
    private String estOrganizacion;
    private int idNodo;
    private int idPadre;
    private String cargo;
    private int numorg;
    
    //variables de nodos;
    private int idnodo;
    private int idpadre;
    private String Puesto;
    private int ultimonodo;

    //variables nodos 2
    
    private int idnodo1;
    private int idpadre1;
    private String Puesto1;
    private int ultimonodo1;
    
    //variables orbita
    private int ultima_orbita;
    private int idnodoorb;
    private int idorbita;
    private String departamento;
    private String vision;
    private String mision;
    private int variable;
    
    //variabes 2.0
    private int idnodo2;
    private int idpadre2;
    private String cargo2;
    private int idorganizacion2;
    private String nombreorganizacion2;
    private int idorbita2;
    private String nombredep2;
    private String vision2;
    private String Mision2;
    private int posicion2;
    private int nodo_nodo;
    private int nodo_nodo2;
    
    //Variables objetivos
    
    private int ultimobjetivo;
    private int idObjetivos;
    private String nombre_objetivo;
    private String indicadores;
    private int tipobj;
     
    //variables usuario y contraseña
    
    private String usuario;
    private String contra;
    private int ulticuenta;
    
    private int idcuenta;
    private String utimacon;
    private String fechacrea;
    private String con;
    private String usu;
    private int tipo;
    private int estado;
    private int modo;
    private int nodo3;
    
    //variables usuario
    
    private int ultiusuario;
    private int idusuario;
    private String apellidopaterno;
    private String apellidomaterno;
    private String nombre;
    private String fechadenacimiento;
    private String foto;
    private String correo;
    private String numero;
    
    //variables asignarnodo
    private int idorg;
    private String nombreorg;
    private int nodoidpadre;
    private String cargos;
    //variables consultausuario
    private int id;
    private String ap;
    private String am;
    private String no;
    private String fen;
    private String fo;
    private String co;
    private String tel;
    private String uc;
    private String fc;
    private String us;
    private String cont;
    private int ti;
    private int es;
    private int mo;
    private int nodousu;
    
    private int nodo5;
    private int idpadre5;
    private String nombredep5;
    
    private int nodousu2;
    private int idnodonuevo;
    private int idpadrelista;
    private int idpadrelista2;
    
    static PreparedStatement pr=null;
    static ResultSet rs=null;
    //cotador
    private int contador;
    private float contador1;
    private float www;
    
    //variables mensaje
    private int ultimen;
    private int mensaje;
    private int receptor;
    private String peticion;
    private int promesa;
    private int revocaciones;
    private String horaenvio;
    private String horaentrega;
    private String diasrevocacion;
    private String tiemporest;
    public String sumarfecha;
    public int norevo;
    private String tp2;
    
    /*
     pro.mensaje(rs.getString(1));
                pro.receptor(rs.getInt(3));
                pro.peticion(rs.getInt(4));
                pro.promesa(rs.getInt(5));
                pro.revocaciones(rs.getInt(10));
                pro.horaenvio(rs.getString(7));
                pro.horaentrega(rs.getString(11));
                pro.diasrevocacion(rs.getString(6));
    */
    //variables url
    private String ulturl;
    
    public void altaempresa(String NombreEmpresa,String ruta)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        ultempresa();       
        String sql="insert into organizacion values (?,?,?,?)";
        
        FileInputStream fis = null;
        PreparedStatement ps = null;

        try
        {
            File file = new File(ruta);
            fis = new FileInputStream(file);
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.setInt(1,getUltimaempresa());
            pst.setString(2,NombreEmpresa);
            pst.setInt(3,1);
            pst.setBinaryStream(4,fis,(int)file.length());
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Empresa Creada Correctamente");
            altaprimernodo(getUltimaempresa());
            revisar_orbita("Default depatamento","Default vision","Default mision",getUltimonodo(),1);
            
          
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void altaprimernodo(int valor)//pimer nodo cuando se crea la empresa
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        ultinodo();
        String sql="insert into nodo values ("+ultimonodo+",0,'Director General',"+valor+")";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null, "Nodo dado de alta");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
        
    }
    
    public void ultinodo()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select IdNodo from nodo order by IdNodo asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultimonodo = rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultimonodo=ultimonodo+1;
        //JOptionPane.showMessageDialog(null, "Ultima empresa: "+ultimaempresa);
    }
    
    public void ultempresa()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select IdOrganizacion from organizacion order by IdOrganizacion asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultimaempresa= rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultimaempresa=ultimaempresa+1;
        //JOptionPane.showMessageDialog(null, "Ultima empresa: "+ultimaempresa);
    }
    
    public static Vector<registro> buscarempresa(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM organizacion where estadoorg=1 order by idOrganizacion asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdOrganizacion(rs.getInt("idOrganizacion"));
                pro.setNombreEmpresa(rs.getString("Nombre"));
                if(rs.getInt("estadoorg")==1){
                   pro.setEstOrganizacion("Activo");
                }
                else
                {
                    pro.setEstOrganizacion("Desactivado");
                }
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public static Vector<registro> buscarempresabaja(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM organizacion where estadoorg=2 order by idOrganizacion asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdOrganizacion(rs.getInt("idOrganizacion"));
                pro.setNombreEmpresa(rs.getString("Nombre"));
                if(rs.getInt("estadoorg")==1){
                   pro.setEstOrganizacion("Activo");
                }
                else
                {
                    pro.setEstOrganizacion("Desactivado");
                }
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public void BajaEmpresa(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update organizacion set estadoorg=2 where idOrganizacion="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"La empresa Esta dada de baja");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
        public void ModificarEmpresa(int parametro1,String parametro2)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update organizacion set Nombre='"+parametro2+"' where idOrganizacion="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Modificacion Completada");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void altaEmpresa(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update organizacion set estadoorg=1 where idOrganizacion="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Empresa Creada Exitosamente");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void BorrarEmpresa(int parametro1)//delete from organizacion where=6;
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="delete from organizacion where idOrganizacion="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"La empresa ha sido removida correctamente");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
         
    public void CrearNodo(int idPadre, String puesto,int numorg)//insert into nodo values (1,1,'director general',1);
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
         ultinodo();
        String sql="insert into nodo values ("+ultimonodo+","+idPadre+",'"+puesto+"',"+numorg+")";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null, "Conexion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    public void CrearNodo2(int idPadre, String puesto,int numorg)//insert into nodo values (1,1,'director general',1);
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        ultinodo();
        String sql="insert into nodo values ("+ultimonodo+","+idPadre+",'"+puesto+"',"+numorg+")";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null, "Conexion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
        crearcuenta(ultimonodo,01,01,1990,1,1,1);
    }
    
    public void buscarnodo(int valor,int valor2){//SELECT idnodo,idpadre,cargo,idusuario,nombre,apellido_paterno,apellido_materno FROM nodo,organizacion where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=0 "
       
         
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM nodo,organizacion where Organizacion_idOrganizacion="+valor+" and idPadre="+valor2+"";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                setIdnodo1(rs.getInt("idNodo"));
                
                setIdPadre(rs.getInt("idPadre"));

                setPuesto(rs.getString("Cargo"));

            }
        }catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,ex);
        }
    }
    public void buscarnodo2(int valor,int valor2){//SELECT idnodo,idpadre,cargo FROM nodo,organizacion where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=0 "
       
         
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM nodo,organizacion where Organizacion_idOrganizacion="+valor+" and idNodo="+valor2+"";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                setIdnodo1(rs.getInt("idNodo"));
                
                setIdPadre(rs.getInt("idPadre"));

                setPuesto(rs.getString("Cargo"));

            }
        }catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,ex);
        }
    }
     public static Vector<registro> buscarespecificarnodo(int valor,int valor1){//SELECT idNodo,idPadre,Cargo,idusuario,nombre_usu,apellido_paterno,apellido_materno FROM nodo,organizacion,usuario where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=1 and idnodo = nodo_idnodo;    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;
        String sql="SELECT idNodo,idPadre,Cargo FROM nodo,organizacion where Organizacion_idOrganizacion="+valor+" and idOrganizacion="+valor+" and idPadre="+valor1+"";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdNodo(rs.getInt("idNodo"));
                pro.setIdPadre(rs.getInt("idPadre"));
                pro.setPuesto(rs.getString("Cargo"));
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    
    public void modificarnodo(int parametro1,int parametro2,String parametro3)//update organizacion set Nombre=Pemex where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update nodo set idPadre="+parametro2+", Cargo='"+parametro3+"' where idNodo="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    
    //orbita
    public void revisar_orbita(String nombredep,String vision,String mision,int nodoPadre,int posicion)//es el inicial donde se debe de llamar
    {
        JOptionPane.showMessageDialog(null,nombredep+vision+mision);
        int orbitaex =0;
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select Nodo_idNodo from orbita where Nodo_idNodo="+nodoPadre+" ";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                if(rs.getInt(1)==nodoPadre)
                {
                    orbitaex=1;
                    //JOptionPane.showMessageDialog(null,"existe la orbita");
                }
                else
                {
                
                }
            }
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
        if(orbitaex==0)
        {            
            registro myr = new registro();
            myr.ultima_orbita();
            int orbitanum=myr.getUltima_orbita();
            myr.insertar_orbita(orbitanum,nombredep,vision,mision,nodoPadre,posicion);
            //JOptionPane.showMessageDialog(null,"Finished");
        }
    }
    public void ultima_orbita()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select idOrbita from orbita order by idorbita asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultima_orbita= rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultima_orbita=ultima_orbita+1;
        System.out.println("este es el ultimo mas uno: "+ultima_orbita);
    }
    
    public void insertar_orbita(int utlorb,String nombredep,String vision,String mision,int nodoPadre,int posicion)//55568889696
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="insert into orbita values (?,?,?,?,?,?)";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.setInt(1,utlorb);
            pst.setString(2,nombredep);
            pst.setString(3,vision);
            pst.setString(4,mision);
            pst.setInt(5,nodoPadre);
            pst.setInt(6,posicion);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null,"orbita creada");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion orbita"+e);
        }
    }
    
    public void borrarnodo(int parametro1)//delete from organizacion where=6;
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="delete from nodo where idNodo="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Eliminacion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void verinodohijo(int idnodo)
    {
        int a=0;
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select IdPadre from nodo where idPadre="+idnodo;
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();               
            while (rs.next()) 
                { 
                    //System.out.println (padre+" = "+rs.getInt (1));      
                    if(idnodo==rs.getInt (1))
                    {
                        a=1;
                        //JOptionPane.showMessageDialog(null,""+rs.getInt (1)+"  Tiene hijos"); 
                    }
                    
                }
            if(a==0)
            {
                //System.out.println ("No tiene Hijos"); 
                borrarnodo(idnodo);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        } 
    }
    
    public void buscarorb(int var,int var1)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//select idnodo from organizacion,nodo where idPadre=1 and idOrganizacion=1 and organizacion_idOrganizacion=1;
        String sql="select idnodo from organizacion,nodo where idPadre="+var1+" and idOrganizacion="+var+" and organizacion_idOrganizacion="+var+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                setIdnodoorb(rs.getInt (1));
                System.out.println (rs.getInt (1));
            }
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void selectorbita(int var)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="select * from orbita where Nodo_idNodo="+var+"";
        
        try
        {
             PreparedStatement pst=reg.prepareStatement(sql);
             rs=pst.executeQuery();
            while (rs.next()) 
            { 
                setIdorbita(rs.getInt (1));
                //System.out.println (rs.getInt (1));
                setDepartamento(rs.getString (2));
                //System.out.println (rs.getString (2));
                setVision(rs.getString (3));
                //System.out.println (rs.getString (3));
                setMision(rs.getString (4));
                //System.out.println (rs.getString (4));
                //System.out.println (rs.getInt (5));
                //System.out.println (rs.getInt (6));
            }
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void iniconodo(int var,int var1)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="select * from nodo where idNodo="+var+" and organizacion_idorganizacion="+var1+"";
        
        try
        {
             PreparedStatement pst=reg.prepareStatement(sql);
             rs=pst.executeQuery();
            while (rs.next()) 
            { 
                setIdnodo1(rs.getInt (1));
                //System.out.println (rs.getInt (1));
                setIdpadre1(rs.getInt (2));
                //System.out.println (rs.getString (2));
                setPuesto1(rs.getString (3));
                
            }
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void hypervinculonodo(int var,int var1)
    {
        setVariable(0);
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        
        String sql="select idpadre from nodo where organizacion_idorganizacion="+var+" order by idPadre asc";
        
        try
        {
             PreparedStatement pst=reg.prepareStatement(sql);
             rs=pst.executeQuery();
            while (rs.next()) 
            {
                if(var1==rs.getInt("idpadre"))
                {
                    //JOptionPane.showMessageDialog(null,"tiene hyper");
                    setVariable(1);
                }              
            }

        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void empresanodoorbita(int var,int var1)
    {
        /*
        mysql> select * from nodo,organizacion,orbita where idorganizacion=1 and organizacion_idorganizacion=1 and idnodo=2 and nodo_idnodo=2;
        */
        setVariable(0);
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        
        String sql="select * from nodo,organizacion,orbita where idorganizacion="+var+" and organizacion_idorganizacion="+var+" and idnodo="+var1+" and nodo_idnodo="+var1+";";
        
        try
        {
             PreparedStatement pst=reg.prepareStatement(sql);
             rs=pst.executeQuery();
            while (rs.next()) 
            {
                setIdnodo2(rs.getInt("idNodo"));
                setIdpadre2(rs.getInt("idPadre"));
                setCargo2(rs.getString("Cargo"));
                setIdorganizacion2(rs.getInt("idOrganizacion"));
                setNombreorganizacion2(rs.getString("Nombre"));
                setIdorbita2(rs.getInt("idOrbita"));
                setNombredep2(rs.getString("Nombre_departamento"));
                setVision2(rs.getString("Vision"));
                setMision2(rs.getString("Mision"));
                setPosicion2(rs.getInt("Posicion"));
            }              
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    public void modificarorbitass(String parametro1,String parametro2,String parametro3,int parametro4)//update organizacion set Nombre=Pemex where idOrganizacion=1
    {//update orbita set Nombre_departamento='vasdasdasd', Vision='blvasdasd', Mision='blalbla' where idOrbita=1";
        /*
        mysql> update orbita set Nombre_departamento='dasdasd',mision='dasdasda',vision='dasdasdasd' where idorbita=1;
        */
        
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        JOptionPane.showMessageDialog(null,parametro1+" "+parametro2+" "+parametro3+" "+parametro4);
        String sql="update orbita set nombre_departamento='"+parametro1+"',mision='"+parametro2+"',vision='"+parametro3+"' where idorbita="+parametro4+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void CrearObjetivo(String parametro1,String parametro2,int parametro3,int parametro4)//insert into objetivos values ("+,"+parametro1+",'"+parametro2+"',"+parametro3+","+parametro4+")";
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
         ultiObjetivo();
        String sql="insert into objetivos values ("+ultimobjetivo+",'"+parametro1+"','"+parametro2+"',"+parametro3+","+parametro4+")";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Creacion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }   
    
    public void ultiObjetivo()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select idObjetivos from objetivos order by idObjetivos asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                //System.out.println (rs.getInt (1));
                 ultimobjetivo = rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultimobjetivo=ultimobjetivo+1;
        //JOptionPane.showMessageDialog(null, "Ultimo objetivo: "+ultimaempresa);
    }
    
    public void buscarobjetivo(int valor2){//SELECT idnodo,idpadre,cargo FROM nodo,organizacion where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=0 "
       
         
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM objetivos where orbita_idorbita="+valor2+"";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                setIdObjetivos(rs.getInt(1));               
                setNombre_objetivo(rs.getString(2));
                setIndicadores(rs.getString(3));               
                setTipobj(rs.getInt(4));
            }
        }catch(Exception ex)
        {
            JOptionPane.showMessageDialog(null,ex);
        }
    }
    public static Vector<registro> buscarobjetivos(int valor2){    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;
        String sql="SELECT * FROM objetivos where orbita_idorbita="+valor2+"";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdObjetivos(rs.getInt(1));       
                pro.setNombre_objetivo(rs.getString(2));
                pro.setIndicadores(rs.getString(3)); 
                pro.setTipobj(rs.getInt(4));
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public void BorrarObjetivo(int parametro1)//delete from organizacion where=6;
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="delete from objetivos where idobjetivos="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Eliminación completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void modificarobjetivo(String parametro1,String parametro2,String parametro3,int parametro4)//update organizacion set Nombre=Pemex where idOrganizacion=1
    {//update orbita set Nombre_departamento='vasdasdasd', Vision='blvasdasd', Mision='blalbla' where idOrbita=1";
        /*
        mysql> update orbita set Nombre_departamento='dasdasd',mision='dasdasda',vision='dasdasdasd' where idorbita=1;
        */
        
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        //JOptionPane.showMessageDialog(null,parametro1+" "+parametro2+" "+parametro3+" "+parametro4);
        String sql="update objetivos set Nombre_objetivo='"+parametro1+"',Indicador='"+parametro2+"',Tipo_Objetivo='"+parametro3+"' where idObjetivos="+parametro4+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void crearcuenta(int nodo,int dia,int mes,int año,int tipo,int estado,int modo)//insert into objetivos values ("+,"+parametro1+",'"+parametro2+"',"+parametro3+","+parametro4+")";
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        Calendar cal1 = Calendar.getInstance();
        generarcontra();
        generarusuario();
        ulticuenta();
        String mess = Integer.toString(cal1.get(Calendar.MONTH) + 1 );
        //tipo cuenta 0=administrador 1=cliente
        //estado 0=inactiva 1= activa
        //modo 0=online 1=offline
        
        String sql="insert into cuenta values ("+getUlticuenta()+",null,'"+cal1.get(Calendar.YEAR)+"-"+mess+"-"+cal1.get(Calendar.DATE)+"','"+getContra()+"','"+getUsuario()+"',"+tipo+","+estado+","+modo+")";
        System.out.println(sql);
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Creacion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de crear cuenta "+e);
        }
        crearusuario(getUlticuenta(),nodo);
    }
    
    public void generarusuario()
    {
        /*char[] caracteres;
        caracteres = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        try {
            int repet = Integer.parseInt(JOptionPane.showInputDialog("Introduzca la cantidad de caracteres de la contraseña: "));
            String pass = "";
            for (int i = 0; i < repet; i++) {
                pass += caracteres[new Random().nextInt(62)];
            }
            JOptionPane.showMessageDialog(null, "La contraseña es: "+pass);
        } catch (NumberFormatException ex) {
            ex.printStackTrace(System.out);
            JOptionPane.showMessageDialog(null, "Cantidad de caracteres inválida.");*/
      
        char[] caracteres;
        caracteres = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        try {
            int repet = 6;
             usuario = "";
                for (int i = 0; i < repet; i++) 
                {
                    usuario += caracteres[new Random().nextInt(62)];
                }

        }    catch (NumberFormatException ex) {
            ex.printStackTrace(System.out);
            JOptionPane.showMessageDialog(null, "Cantidad de caracteres inválida.");
            }
    }
    
    public void generarcontra()
    {
        /*char[] caracteres;
        caracteres = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        try {
            int repet = Integer.parseInt(JOptionPane.showInputDialog("Introduzca la cantidad de caracteres de la contraseña: "));
            String pass = "";
            for (int i = 0; i < repet; i++) {
                pass += caracteres[new Random().nextInt(62)];
            }
            JOptionPane.showMessageDialog(null, "La contraseña es: "+pass);
        } catch (NumberFormatException ex) {
            ex.printStackTrace(System.out);
            JOptionPane.showMessageDialog(null, "Cantidad de caracteres inválida.");*/
      
        char[] caracteres;
        caracteres = new char[]{'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        try {
            int repet = 6;
             contra = "";
                for (int i = 0; i < repet; i++) 
                {
                    contra += caracteres[new Random().nextInt(62)];
                }

        }    catch (NumberFormatException ex) {
            ex.printStackTrace(System.out);
            JOptionPane.showMessageDialog(null, "Cantidad de caracteres inválida.");
            }
    }
    
    public void ulticuenta()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select idcuenta from cuenta order by idcuenta asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ulticuenta= rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ulticuenta=ulticuenta+1;
        //JOptionPane.showMessageDialog(null, "Ultima cuenta: "+ulticuenta);
    }
    
     public static Vector<registro> buscarcuenta(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT nodo_idnodo,idusuario,nombre_usu,apellido_paterno,apellido_materno,idCuenta,Ultima_conexion,fecha_creacion,contraseña,Usuario,tipo_cuenta,estado,modo FROM cuenta,usuario,nodo where estado=1 and idcuenta=cuenta_idcuenta and idnodo=nodo_idnodo order by idcuenta asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdcuenta(rs.getInt("idCuenta"));
                pro.setUtimacon(rs.getString("Ultima_conexion"));
                pro.setFechacrea(rs.getString("fecha_creacion"));
                pro.setCon(rs.getString("contraseña"));
                pro.setUsu(rs.getString("Usuario"));
                pro.setTipo(rs.getInt("tipo_cuenta"));
                pro.setEstado(rs.getInt("estado"));
                pro.setModo(rs.getInt("modo"));
                pro.setNodo3(rs.getInt("nodo_idnodo"));
                pro.setIdusuario(rs.getInt("idusuario"));
                pro.setNombre(rs.getString("nombre_usu"));
                pro.setApellidopaterno(rs.getString("apellido_paterno"));
                pro.setApellidomaterno(rs.getString("apellido_materno"));
                
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public static Vector<registro> buscarcuentabaja(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT * FROM cuenta where estado=2 order by idcuenta asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdcuenta(rs.getInt("idCuenta"));
                pro.setUtimacon(rs.getString("Ultima_conexion"));
                pro.setFechacrea(rs.getString("fecha_creacion"));
                pro.setCon(rs.getString("contraseña"));
                pro.setUsu(rs.getString("Usuario"));
                pro.setTipo(rs.getInt("tipo_cuenta"));
                pro.setEstado(rs.getInt("estado"));
                pro.setModo(rs.getInt("modo"));
                
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
     
    public void prueba()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select Ultima_conexion from cuenta order by idcuenta asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                String asv = rs.getString (1);
                System.out.println (asv);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    

    } 
    
    public void BajaCuenta(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update cuenta,usuario set estado=2,nodo_idnodo=0 where idCuenta="+parametro1+" and idcuenta=cuenta_idcuenta";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Cuenta Desactivada");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de baja cuenta "+e);
        }
    }
    
    public void DesaCuenta(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update usuario set nodo_idnodo=0 where idusuario="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Acltalizacion Completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de baja cuenta "+e);
        }
    }
    
    public void AltaCuenta(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update cuenta set estado=1 where idCuenta="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Actualizacion Completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de alta cuenta "+e);
        }
    }
     
    public void BorrarCuenta(int parametro1)//delete from organizacion where=6;
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="delete from cuenta where idcuenta="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"Eliminación completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de borrar cuenta"+e);
        }
    }
    
    public void crearusuario(int parametro2,int parametro3)//insert into objetivos values ("+,"+parametro1+",'"+parametro2+"',"+parametro3+","+parametro4+")";
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        ultimoUsuario();
         
        String sql="insert into usuario values ("+getUltiusuario()+",null,null,null,null,null,null,null,"+parametro2+","+parametro3+")";
        //System.out.println(sql);
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null, "Conexion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de crear usuario"+e);
        }
    }
    
    public void ultimoUsuario()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select idusuario from usuario order by idusuario asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultiusuario= rs.getInt (1);
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de ultimo usuario "+e);
        }    
        ultiusuario=ultiusuario+1;
        //System.out.println("este es el ultimo mas uno: "+ultiusuario);
    }
    
    public void perfil(int parametro1)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select * from usuario,cuenta where cuenta_idcuenta="+parametro1+" and idcuenta=cuenta_idcuenta";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {               
                 setIdusuario(rs.getInt (1));
                 setApellidopaterno(rs.getString (3));
                 setApellidomaterno(rs.getString (2));
                 setNombre(rs.getString (4));                
                 setFechadenacimiento(rs.getString (5));
                 setFoto(rs.getString (6));
                 setCorreo(rs.getString (7));
                 setNumero(rs.getString (8));
                 setUsuario(rs.getString(15));
                 setContra(rs.getString(14));
                 
            }
        }
        
        
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de ultimo usuario "+e);
        }    
        ultiusuario=ultiusuario+1;
        //System.out.println("este es el ultimo mas uno: "+ultiusuario);
    }
    
    public void ModificarUsuario(int parametro1,String app,String apm,String nom,String fecha,String fot,String corr,String tele,String usu,String contra)//update organizacion set Nombre=Pemex where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update usuario,cuenta set Apellido_paterno='"+app+"',Apellido_materno='"+apm+"',nombre_usu='"+nom+"',fecha_de_nacimiento='"+fecha+"',foto='"+fot+"',correo_electro='"+corr+"',telefono='"+tele+"',Usuario='"+usu+"',Contraseña='"+contra+"' where cuenta_idcuenta="+parametro1+" and idcuenta="+parametro1+" ";
        //System.out.println(sql);
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public static Vector<registro> buscarnodousu(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT idorganizacion,nombre,idnodo,idpadre,cargo FROM nodo,organizacion where idorganizacion=organizacion_idorganizacion order by idorganizacion asc, idpadre asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                               
                registro pro=new registro();
                pro.setNodo_nodo(rs.getInt(3));
                pro.setIdorganizacion2(rs.getInt(1));
                pro.setNombreorg(rs.getString(2));
                pro.setNodoidpadre(rs.getInt(4));
                pro.setCargos(rs.getString(5));
                
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public static Vector<registro> buscarnodousu2(){
/*ultiusuario;
    private int idusuario;
    private String apellidopaterno;
    private String apellidomaterno;
    private String nombre;
    private String fechadenacimiento;
    private String foto;
    private String correo;
    private String numero;*/        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT nodo_idnodo FROM usuario order by nodo_idnodo asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                               
                registro pro=new registro();
                pro.setNodo_nodo2(rs.getInt(1));
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    
    public void valorarnodo()
    {
  
          Vector<registro> reg = registro.buscarnodousu();
          for(int i=0;i<reg.size();i++)
          {
              int abc=0; 
              Vector<registro> regi = registro.buscarnodousu2();
              for(int x=0;x<regi.size();x++)
              {
                if(reg.get(i).getNodo_nodo()==regi.get(x).getNodo_nodo2() && abc==0)
                {
                   System.out.println("Este nodo esta ocupado");
                   abc=1;
                }
                if(reg.get(i).getNodo_nodo()!=regi.get(x).getNodo_nodo2() && abc==0)
                {
                    System.out.println("Libre");
                    abc=1;
                }
              }              
          }
    }
    
    public void AsignarNodo(int parametro1,int parametro2)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update usuario set nodo_idnodo='"+parametro1+"' where idusuario="+parametro2+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void usuario1(int parametro1)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select idUsuario,nombre_usu,Apellido_paterno,Apellido_materno,contraseña,usuario from usuario,cuenta,nodo where nodo_idnodo="+parametro1+" and cuenta_idcuenta=idcuenta and nodo_idnodo=idnodo";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {               
                 setIdusuario(rs.getInt (1));
                 setApellidopaterno(rs.getString (3));
                 setApellidomaterno(rs.getString (4));
                 setNombre(rs.getString (2));                
                 setCon(rs.getString(5));
                 setUsu(rs.getString (6));                
            }
        } 
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion usuario "+e);
        }
    }
    
    public static Vector<registro> buscarcuenta2(){
        
         Vector<registro> vecPro=new Vector<registro>();
         
         Conexion myc = new Conexion();
        Connection reg=myc.conexion();  
        int i = 0;
        String sql="SELECT nodo_idnodo,idusuario,nombre_usu,apellido_paterno,apellido_materno,idCuenta,Ultima_conexion,fecha_creacion,contraseña,Usuario,tipo_cuenta,estado,modo FROM cuenta,usuario,nodo where estado=1 and nodo_idnodo=0 and idcuenta=cuenta_idcuenta and idnodo=nodo_idnodo order by idcuenta asc";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdcuenta(rs.getInt("idCuenta"));
                pro.setUtimacon(rs.getString("Ultima_conexion"));
                pro.setFechacrea(rs.getString("fecha_creacion"));
                pro.setCon(rs.getString("contraseña"));
                pro.setUsu(rs.getString("Usuario"));
                pro.setTipo(rs.getInt("tipo_cuenta"));
                pro.setEstado(rs.getInt("estado"));
                pro.setModo(rs.getInt("modo"));
                pro.setNodo3(rs.getInt("nodo_idnodo"));
                pro.setIdusuario(rs.getInt("idusuario"));
                pro.setNombre(rs.getString("nombre_usu"));
                pro.setApellidopaterno(rs.getString("apellido_paterno"));
                pro.setApellidomaterno(rs.getString("apellido_materno"));
                
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
    public void consultausuario(int parametro1)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select * from usuario,cuenta,organizacion,nodo where idusuario="+parametro1+" and cuenta_idcuenta=idcuenta and idnodo=nodo_idnodo and idorganizacion=organizacion_idorganizacion";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {
                /*private int id;
    private String ap;
    private String am;
    private String no;
    private String fen;
    private String fo;
    private String co;
    private String tel;
    private String uc;
    private String fc;
    private String us;
    private String cont;
    private int ti;
    private int es;
    private int mo;
                */
                 setId(rs.getInt (1));
                 setAp(rs.getString (3));
                 setAm(rs.getString (2));
                 setFen(rs.getString (5));
                 setNo(rs.getString (4));                
                 setFo(rs.getString(6));
                 setCo(rs.getString (7));
                 setTel(rs.getString (8));
                 setUc(rs.getString (12));
                 setFc(rs.getString (13));
                 setUs(rs.getString (15));
                 setCont(rs.getString (14));
                 setTi(rs.getInt (16));
                 setEs(rs.getInt (17));
                 setMo(rs.getInt (18));
                 setIdOrganizacion(rs.getInt(19));
                 setNombreEmpresa(rs.getString(20));
            }
        } 
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion usuario "+e);
        }
    }
    
    public void login(String parametro1,String parametro2)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select * from usuario,cuenta where usuario='"+parametro1+"' and Contraseña='"+parametro2+"' and cuenta_idcuenta=idcuenta";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            if (rs.next()) 
            {
                 setUs(rs.getString (15));                      
                 if(getUs().equals(parametro1))
                 {
                     JOptionPane.showMessageDialog(null,"Bienvenido");
                 }
                 else
                 {
                     JOptionPane.showMessageDialog(null,"Cadenas no son iguales");
                 }
            }
            else
            {
                JOptionPane.showMessageDialog(null,"aaaaaaaaaaa");
            }
        } 
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null,"Error "+e);
        }
        
    }
    
    public void UsuarioModif(int parametro1,String app,String apm,String nom,String fecha,String fot,String corr,String tele,String usu,String contra)//update organizacion set Nombre=Pemex where idOrganizacion=1
    {
        Calendar cal1 = Calendar.getInstance();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String mes = Integer.toString(cal1.get(Calendar.MONTH) + 1 );
        String sql="update usuario,cuenta set Apellido_paterno='"+app+"',Apellido_materno='"+apm+"',nombre_usu='"+nom+"',fecha_de_nacimiento='"+fecha+"',foto='"+fot+"',correo_electro='"+corr+"',telefono='"+tele+"',Usuario='"+usu+"',Contraseña='"+contra+"',Ultima_conexion='"+cal1.get(Calendar.YEAR)+"-"+mes+"-"+cal1.get(Calendar.DATE)+"' where cuenta_idcuenta="+parametro1+" and idcuenta="+parametro1+" ";
        System.out.println(sql);
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null,"actualizacion completa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void buscarnodos(int abc,int idempresa)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select Idpadre,nombre_departamento from nodo,orbita where organizacion_idorganizacion='"+idempresa+"' and idnodo='"+abc+"' and idnodo=nodo_idnodo order by IdNodo asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {                                 
                //if(getNodo5()!=0)
                //{
                  setNodo5(rs.getInt (1));
                  setNombredep5(rs.getString(2));
                  //System.out.print (nodo5+" ");
                  //System.out.println (nombredep5);
                  
                              
                //}                                  
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
         buscarnombreorb(getNodo5(),idempresa);
    }
    
    public void buscarnombreorb(int abc,int idempresa)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select Idpadre,nombre_departamento from nodo,orbita where organizacion_idorganizacion='"+idempresa+"' and idnodo='"+abc+"' and idnodo=nodo_idnodo order by IdNodo asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {                                 
                //if(getNodo5()!=0)
                //{
                  setNombredep5(rs.getString(2));
                  //System.out.print (nodo5+" ");
                  //System.out.println (nombredep5);
                  
                  //buscarnodo(nodo5);                    
                //}                                  
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }       
    }
    
    public void buscarnodousu(int abc)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="select idnodo from usuario,nodo where nodo_idnodo=idnodo and idusuario='"+abc+"'";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {                                 
                //if(getNodo5()!=0)
                //{
                  setNombredep5(rs.getString(2));
                  //System.out.print (nodo5+" ");
                  //System.out.println (nombredep5);
                  
                  //buscarnodo(nodo5);                    
                //}                                  
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }       
    }
    //busca si el nodo tiene orbita
    public void sss(int abc,int adc)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select nodo_idnodo from nodo,orbita,organizacion where idorganizacion='"+abc+"' and idorganizacion=organizacion_idorganizacion and idnodo='"+adc+"' and idnodo=nodo_idnodo";       
        setVariable(1);
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            if (rs.next()) 
            {                                               
                  setVariable(2);   
                  setIdnodonuevo(rs.getInt(1));
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        } 
    }
    public void buscaridpadre(int abc,int adc)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
                  //Select idpadre from nodo,orbita,organizacion where idorganizacion=1 and idorganizacion=organizacion_idorganizacion and idnodo=27 and idnodo=nodo_idnodo
        String sql="Select idpadre from nodo,organizacion where idorganizacion='"+abc+"' and idorganizacion=organizacion_idorganizacion and idnodo='"+adc+"'";       
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            if (rs.next()) 
            {                                               
                  setIdnodonuevo(rs.getInt(1));
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }  
    }
    
   public static Vector<registro> lista(int abc){//SELECT idNodo,idPadre,Cargo,idusuario,nombre_usu,apellido_paterno,apellido_materno FROM nodo,organizacion,usuario where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=1 and idnodo = nodo_idnodo;    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;//mysql> Select idnodo from nodo,organizacion where idorganizacion=1 and idorganizacion=organizacion_idorganizacion and idpadre=3;
        String sql="Select idnodo from nodo,organizacion where idorganizacion='"+abc+"' and idorganizacion=organizacion_idorganizacion and idpadre=0";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                
                
                registro pro=new registro();
                pro.setIdpadrelista(rs.getInt(1));
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
      
   public static Vector<registro> lista2(int abc, int adc){//SELECT idNodo,idPadre,Cargo,idusuario,nombre_usu,apellido_paterno,apellido_materno FROM nodo,organizacion,usuario where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=1 and idnodo = nodo_idnodo;    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;//mysql> Select idnodo from nodo,organizacion where idorganizacion=1 and idorganizacion=organizacion_idorganizacion and idpadre=3;
        String sql="Select idnodo from nodo,organizacion where idorganizacion='"+abc+"' and idorganizacion=organizacion_idorganizacion and idpadre='"+adc+"'";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next())
            {
                registro pro=new registro();
                pro.setIdpadrelista2(rs.getInt(1));
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }

   public void totaldenodos(int abc,int adc)
    {
        www=0;
        contador=0;
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
                  //Select idnodo from nodo,organizacion where idorganizacion=1 and idorganizacion=organizacion_idorganizacion and idpadre=1
        String sql="Select idnodo from nodo,organizacion where idorganizacion='"+abc+"' and idorganizacion=organizacion_idorganizacion and idpadre='"+adc+"'";       
        try
        {
            
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            {                                               
                  setIdnodonuevo(rs.getInt(1));
                  www++;
                  contador++;
            }
            

        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }  
    }
   
   public void ultimomen()
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="Select IdMensajes from mensajes order by Idmensajes asc";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                System.out.println (rs.getInt (1));
                 ultimen = rs.getInt (1);
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        ultimen=ultimen+1;
        //JOptionPane.showMessageDialog(null, "Ultima empresa: "+ultimaempresa);
    }
   public void CrearMensaje(int emisor,int receptor, String peticion,String tiempoy)//insert into nodo values (1,1,'director general',1);
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
         ultimomen();
                        //insert into mensajes values(1,1,2,'ffdsd','null',null,0,0,1);
        String sql="insert into mensajes values ("+ultimen+","+emisor+",'"+receptor+"','"+peticion+"','0','"+tiempoy+"',now(),null,"+emisor+",0,'"+tiempoy+"')";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null, "Conexion Exitosa");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
   public static Vector<registro> listamensajes(int abc){//SELECT idNodo,idPadre,Cargo,idusuario,nombre_usu,apellido_paterno,apellido_materno FROM nodo,organizacion,usuario where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=1 and idnodo = nodo_idnodo;    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;//select *,datediff(tiempo_proceso,hora_envio) from mensajes where emisor=1;
        String sql="select *,TIMESTAMPDIFF(day,hora_envio,tiempo_proceso),TIMESTAMPDIFF(day,tiempo_proceso,tiempo_proceso2) from mensajes where emisor='"+abc+"'";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next())
            {
                registro pro=new registro();
                pro.setMensaje(rs.getInt(1));
                pro.setReceptor(rs.getInt(3));
                pro.setPeticion(rs.getString(4));
                pro.setPromesa(rs.getInt(5));
                pro.setRevocaciones(rs.getInt(10));
                pro.setHoraenvio(rs.getString(7));
                pro.setHoraentrega(rs.getString(6));
                pro.setDiasrevocacion(rs.getString(13));
                pro.setTiemporest(rs.getString(12));
                        
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
   
   public static Vector<registro> listamensajesresi(int abc){//SELECT idNodo,idPadre,Cargo,idusuario,nombre_usu,apellido_paterno,apellido_materno FROM nodo,organizacion,usuario where Organizacion_idOrganizacion=1 and idOrganizacion=1 and idPadre=1 and idnodo = nodo_idnodo;    
         Vector<registro> vecPro=new Vector<registro>();
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        
        int i = 0;//select *,datediff(tiempo_proceso,hora_envio) from mensajes where emisor=1;
        String sql="select *,TIMESTAMPDIFF(day,hora_envio,tiempo_proceso),TIMESTAMPDIFF(day,tiempo_proceso,tiempo_proceso2) from mensajes where receptor='"+abc+"'";
        try{
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next())
            {
                registro pro=new registro();
                pro.setMensaje(rs.getInt(1));
                pro.setReceptor(rs.getInt(2));
                pro.setPeticion(rs.getString(4));
                pro.setPromesa(rs.getInt(5));
                pro.setRevocaciones(rs.getInt(10));
                pro.setHoraenvio(rs.getString(7));
                pro.setHoraentrega(rs.getString(6));
                pro.setDiasrevocacion(rs.getString(13));
                pro.setTiemporest(rs.getString(12));
                pro.setTp2(rs.getString(11));
                        
                vecPro.add(pro);
                i++;
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            try{
                rs.close();
                pr.close();
            }catch(Exception ex){

            }
        }
        return vecPro;
    }
    
   
   public void sumarfecha(String bbb, String aaa)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="SELECT ADDDATE('"+bbb+"', INTERVAL '"+aaa+"' DAY);";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                sumarfecha=rs.getString(1);
                System.out.println(rs.getString(1));
                
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        //JOptionPane.showMessageDialog(null, "Ultima empresa: "+ultimaempresa);
    }
   
   public void numrevo(int idmensaje)
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();
        String sql="SELECT revocaciones from mensajes where idmensajes='"+idmensaje+"';";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            rs=pst.executeQuery();
            while (rs.next()) 
            { 
                norevo=rs.getInt(1);
                System.out.println(rs.getInt(1));
                
            }
        }
             
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }    
        //JOptionPane.showMessageDialog(null, "Ultima empresa: "+ultimaempresa);
    }
    
    public void revocar(int parametro1,String aaa,String bbb)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        sumarfecha(bbb,aaa);
        numrevo(parametro1);
        String sql="update mensajes set revocaciones='"+(norevo+1)+"',tiempo_proceso2='"+sumarfecha+"' where idmensajes="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null,"La empresa Esta dada de baja");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    public void promesasi(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update mensajes set promesa=1 where idmensajes="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null,"La empresa Esta dada de baja");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
    
    public void promesano(int parametro1)//update organizacion set estadoorg=2 where idOrganizacion=1
    {
        Conexion myc = new Conexion();
        Connection reg=myc.conexion();//
        String sql="update mensajes set promesa=2 where idmensajes="+parametro1+"";
        
        try
        {
            PreparedStatement pst=reg.prepareStatement(sql);
            pst.executeUpdate();
            //JOptionPane.showMessageDialog(null,"La empresa Esta dada de baja");
        }
        catch(Exception e)
        {
             JOptionPane.showMessageDialog(null, "error de conexion "+e);
        }
    }
   
    public String getNombreEmpresa() {
        return NombreEmpresa;
    }

    public void setNombreEmpresa(String NombreEmpresa) {
        this.NombreEmpresa = NombreEmpresa;
    }

    public int getUltimaempresa() {
        return ultimaempresa;
    }

    public void setUltimaempresa(int ultimoempresa) {
        this.ultimaempresa = ultimoempresa;
    }

    public int getIdOrganizacion() {
        return idOrganizacion;
    }

    public void setIdOrganizacion(int idOrganizacion) {
        this.idOrganizacion = idOrganizacion;
    }

    public int getEstadoOrganizacion() {
        return estadoOrganizacion;
    }

    public void setEstadoOrganizacion(int estadoOrganizacion) {
        this.estadoOrganizacion = estadoOrganizacion;
    }

    public String getEstOrganizacion() {
        return estOrganizacion;
    }

    public void setEstOrganizacion(String estOrganizacion) {
        this.estOrganizacion = estOrganizacion;
    }

    public int getIdNodo() {
        return idNodo;
    }

    public void setIdNodo(int idNodo) {
        this.idNodo = idNodo;
    }

    public int getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(int idPadre) {
        this.idPadre = idPadre;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getNumorg() {
        return numorg;
    }

    public void setNumorg(int numorg) {
        this.numorg = numorg;
    }

    public int getIdnodo() {
        return idnodo;
    }

    public void setIdnodo(int idnodo) {
        this.idnodo = idnodo;
    }

    public int getIdpadre() {
        return idpadre;
    }

    public void setIdpadre(int idpadre) {
        this.idpadre = idpadre;
    }

    public String getPuesto() {
        return Puesto;
    }

    public void setPuesto(String Puesto) {
        this.Puesto = Puesto;
    }

    public int getUltimonodo() {
        return ultimonodo;
    }

    public void setUltimonodo(int ultimonodo) {
        this.ultimonodo = ultimonodo;
    }

    public int getUltima_orbita() {
        return ultima_orbita;
    }

    public void setUltima_orbita(int ultima_orbita) {
        this.ultima_orbita = ultima_orbita;
    }
    
    public int getIdnodoorb() {
        return idnodoorb;
    }

    public void setIdnodoorb(int idnodoorb) {
        this.idnodoorb = idnodoorb;
    }
    
    public int getIdorbita() {
        return idorbita;
    }

    public void setIdorbita(int idorbita) {
        this.idorbita = idorbita;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }
    

    public int getVariable() {
        return variable;
    }

    public void setVariable(int variable) {
        this.variable = variable;
    }

    public int getIdnodo1() {
        return idnodo1;
    }

    public void setIdnodo1(int idnodo1) {
        this.idnodo1 = idnodo1;
    }

    public int getIdpadre1() {
        return idpadre1;
    }

    public void setIdpadre1(int idpadre1) {
        this.idpadre1 = idpadre1;
    }

    public String getPuesto1() {
        return Puesto1;
    }

    public void setPuesto1(String Puesto1) {
        this.Puesto1 = Puesto1;
    }

    public int getUltimonodo1() {
        return ultimonodo1;
    }

    public void setUltimonodo1(int ultimonodo1) {
        this.ultimonodo1 = ultimonodo1;
    }

    public int getIdnodo2() {
        return idnodo2;
    }

    public void setIdnodo2(int idnodo2) {
        this.idnodo2 = idnodo2;
    }

    public int getIdpadre2() {
        return idpadre2;
    }

    public void setIdpadre2(int idpadre2) {
        this.idpadre2 = idpadre2;
    }

    public String getCargo2() {
        return cargo2;
    }

    public void setCargo2(String cargo2) {
        this.cargo2 = cargo2;
    }

    public int getIdorganizacion2() {
        return idorganizacion2;
    }

    public void setIdorganizacion2(int idorganizacion2) {
        this.idorganizacion2 = idorganizacion2;
    }

    public String getNombreorganizacion2() {
        return nombreorganizacion2;
    }

    public void setNombreorganizacion2(String nombreorganizacion2) {
        this.nombreorganizacion2 = nombreorganizacion2;
    }

    public int getIdorbita2() {
        return idorbita2;
    }

    public void setIdorbita2(int idorbita2) {
        this.idorbita2 = idorbita2;
    }

    public String getNombredep2() {
        return nombredep2;
    }

    public void setNombredep2(String nombredep2) {
        this.nombredep2 = nombredep2;
    }

    public String getVision2() {
        return vision2;
    }

    public void setVision2(String vision2) {
        this.vision2 = vision2;
    }

    public String getMision2() {
        return Mision2;
    }

    public void setMision2(String Mision2) {
        this.Mision2 = Mision2;
    }

    public int getPosicion2() {
        return posicion2;
    }

    public void setPosicion2(int posicion2) {
        this.posicion2 = posicion2;
    }

    public int getUltimobjetivo() {
        return ultimobjetivo;
    }

    public void setUltimobjetivo(int ultimobjetivo) {
        this.ultimobjetivo = ultimobjetivo;
    }

    public int getIdObjetivos() {
        return idObjetivos;
    }

    public void setIdObjetivos(int idObjetivos) {
        this.idObjetivos = idObjetivos;
    }

    public String getNombre_objetivo() {
        return nombre_objetivo;
    }

    public void setNombre_objetivo(String nombre_objetivo) {
        this.nombre_objetivo = nombre_objetivo;
    }

    public String getIndicadores() {
        return indicadores;
    }

    public void setIndicadores(String indicadores) {
        this.indicadores = indicadores;
    }

    public int getTipobj() {
        return tipobj;
    }

    public void setTipobj(int tipobj) {
        this.tipobj = tipobj;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getUlticuenta() {
        return ulticuenta;
    }

    public void setUlticuenta(int ulticuenta) {
        this.ulticuenta = ulticuenta;
    }

    public int getIdcuenta() {
        return idcuenta;
    }

    public void setIdcuenta(int idcuenta) {
        this.idcuenta = idcuenta;
    }

    public String getUtimacon() {
        return utimacon;
    }

    public void setUtimacon(String utimacon) {
        this.utimacon = utimacon;
    }

    public String getFechacrea() {
        return fechacrea;
    }

    public void setFechacrea(String fechacrea) {
        this.fechacrea = fechacrea;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }

    public String getUsu() {
        return usu;
    }

    public void setUsu(String usu) {
        this.usu = usu;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getModo() {
        return modo;
    }

    public void setModo(int modo) {
        this.modo = modo;
    }

    public int getUltiusuario() {
        return ultiusuario;
    }

    public void setUltiusuario(int ultiusuario) {
        this.ultiusuario = ultiusuario;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getApellidopaterno() {
        return apellidopaterno;
    }

    public void setApellidopaterno(String apellidopaterno) {
        this.apellidopaterno = apellidopaterno;
    }

    public String getApellidomaterno() {
        return apellidomaterno;
    }

    public void setApellidomaterno(String apellidomaterno) {
        this.apellidomaterno = apellidomaterno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechadenacimiento() {
        return fechadenacimiento;
    }

    public void setFechadenacimiento(String fechadenacimiento) {
        this.fechadenacimiento = fechadenacimiento;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getNodo3() {
        return nodo3;
    }

    public void setNodo3(int nodo3) {
        this.nodo3 = nodo3;
    }

    public int getNodo_nodo() {
        return nodo_nodo;
    }

    public void setNodo_nodo(int nodo_nodo) {
        this.nodo_nodo = nodo_nodo;
    }

    public int getNodo_nodo2() {
        return nodo_nodo2;
    }

    public void setNodo_nodo2(int nodo_nodo2) {
        this.nodo_nodo2 = nodo_nodo2;
    }

    public int getIdorg() {
        return idorg;
    }

    public void setIdorg(int idorg) {
        this.idorg = idorg;
    }

    public String getNombreorg() {
        return nombreorg;
    }

    public void setNombreorg(String nombreorg) {
        this.nombreorg = nombreorg;
    }

    public int getNodoidpadre() {
        return nodoidpadre;
    }

    public void setNodoidpadre(int nodoidpadre) {
        this.nodoidpadre = nodoidpadre;
    }

    public String getCargos() {
        return cargos;
    }

    public void setCargos(String cargos) {
        this.cargos = cargos;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAp() {
        return ap;
    }

    public void setAp(String ap) {
        this.ap = ap;
    }

    public String getAm() {
        return am;
    }

    public void setAm(String am) {
        this.am = am;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getFen() {
        return fen;
    }

    public void setFen(String fen) {
        this.fen = fen;
    }

    public String getFo() {
        return fo;
    }

    public void setFo(String fo) {
        this.fo = fo;
    }

    public String getCo() {
        return co;
    }

    public void setCo(String co) {
        this.co = co;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getUc() {
        return uc;
    }

    public void setUc(String uc) {
        this.uc = uc;
    }

    public String getFc() {
        return fc;
    }

    public void setFc(String fc) {
        this.fc = fc;
    }

    public String getUs() {
        return us;
    }

    public void setUs(String us) {
        this.us = us;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public int getTi() {
        return ti;
    }

    public void setTi(int ti) {
        this.ti = ti;
    }

    public int getEs() {
        return es;
    }

    public void setEs(int es) {
        this.es = es;
    }

    public int getMo() {
        return mo;
    }

    public void setMo(int mo) {
        this.mo = mo;
    }

    public int getContador() {
        return contador;
    }

    public void setContador(int contador) {
        this.contador = contador;
    }

    public float getContador1() {
        return contador1;
    }

    public void setContador1(float contador1) {
        this.contador1 = contador1;
    }

    public String getUlturl() {
        return ulturl;
    }

    public void setUlturl(String ulturl) {
        this.ulturl = ulturl;
    }

    public int getNodo5() {
        return nodo5;
    }

    public void setNodo5(int nodo5) {
        this.nodo5 = nodo5;
    }

    public int getIdpadre5() {
        return idpadre5;
    }

    public void setIdpadre5(int idpadre5) {
        this.idpadre5 = idpadre5;
    }

    public String getNombredep5() {
        return nombredep5;
    }

    public void setNombredep5(String nombredep5) {
        this.nombredep5 = nombredep5;
    }

    public int getNodousu() {
        return nodousu;
    }

    public void setNodousu(int nodousu) {
        this.nodousu = nodousu;
    }

    public int getNodousu2() {
        return nodousu2;
    }

    public void setNodousu2(int nodousu2) {
        this.nodousu2 = nodousu2;
    }

    public int getIdnodonuevo() {
        return idnodonuevo;
    }

    public void setIdnodonuevo(int idnodonuevo) {
        this.idnodonuevo = idnodonuevo;
    }

    public int getIdpadrelista() {
        return idpadrelista;
    }

    public void setIdpadrelista(int idpadrelista) {
        this.idpadrelista = idpadrelista;
    }

    public int getIdpadrelista2() {
        return idpadrelista2;
    }

    public void setIdpadrelista2(int idpadrelista2) {
        this.idpadrelista2 = idpadrelista2;
    }

    public float getWww() {
        return www;
    }

    public void setWww(float www) {
        this.www = www;
    }

    public int getUltimen() {
        return ultimen;
    }

    public void setUltimen(int ultimen) {
        this.ultimen = ultimen;
    }

    public int getMensaje() {
        return mensaje;
    }

    public void setMensaje(int mensaje) {
        this.mensaje = mensaje;
    }

    public int getReceptor() {
        return receptor;
    }

    public void setReceptor(int receptor) {
        this.receptor = receptor;
    }

    public String getPeticion() {
        return peticion;
    }

    public void setPeticion(String peticion) {
        this.peticion = peticion;
    }

    public int getPromesa() {
        return promesa;
    }

    public void setPromesa(int promesa) {
        this.promesa = promesa;
    }

    public int getRevocaciones() {
        return revocaciones;
    }

    public void setRevocaciones(int revocaciones) {
        this.revocaciones = revocaciones;
    }

    public String getHoraenvio() {
        return horaenvio;
    }

    public void setHoraenvio(String horaenvio) {
        this.horaenvio = horaenvio;
    }

    public String getHoraentrega() {
        return horaentrega;
    }

    public void setHoraentrega(String horaentrega) {
        this.horaentrega = horaentrega;
    }

    public String getDiasrevocacion() {
        return diasrevocacion;
    }

    public void setDiasrevocacion(String diasrevocacion) {
        this.diasrevocacion = diasrevocacion;
    }

    public String getTiemporest() {
        return tiemporest;
    }

    public void setTiemporest(String tiemporest) {
        this.tiemporest = tiemporest;
    }

    public String getTp2() {
        return tp2;
    }

    public void setTp2(String tp2) {
        this.tp2 = tp2;
    }
    
    public static void main(String args[])
    {
        registro myr = new registro();
        //myr.crearcuenta(00,00,0000,1,1,1);
        //myr.prueba();
        //myr.BajaCuenta(1);
        //myr.crearusuario(1,1);
        //myr.valorarnodo();
        //myr.login("pqBWYM","gv699g");
        //myr.buscarnodo(24);
        //myr.totaldenodos(1,1);
        //myr.CrearMensaje(1,2,"null","null");
        
    }    
}
