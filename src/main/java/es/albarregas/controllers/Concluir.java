
package es.albarregas.controllers;

import es.albarregas.connections.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Francisco_Antonio
 */
@WebServlet(name = "Concluir", urlPatterns = {"/Concluir"})
public class Concluir extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
        if (request.getParameter("operacion") != null) {
            switch (request.getParameter("operacion")) {
                case "Actualizar":

                    actualizar(request, response);
                    if (request.getParameter("operacion").equals("cancelar")) {
                        request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    }
                    break;
                case "Eliminar":

                    eliminar(request, response);
                    if (request.getParameter("operacion").equals("cancelar")) {
                        request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    }
                    break;
                case "cancelar":

                    request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    break;
            }//fin switch            
        }//fin if

    }

    /**
     * 
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException 
     * 
     * Este método actualiza los datos el ave seleccionada
     */
    public void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;

        try {
            //Hacemos la conexion a la BBDD
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();

            //obtenemos los valores del formulario
            String anilla = request.getParameter("anilla");
            String especie = request.getParameter("especie");
            String lugar = request.getParameter("lugar");
            String fecha = request.getParameter("fecha");
            //preparamos la sentencia SQL
            sql = "update aves set especie = ?, lugar = ?, fecha = ? where anilla = '" + anilla + "';";
            preparedStatement = conexion.prepareStatement(sql);
            //insertamos los valores
            preparedStatement.setString(1, especie);
            preparedStatement.setString(2, lugar);
            preparedStatement.setString(3, fecha);
            preparedStatement.executeUpdate();

            //cerramos conexion
            Conexion.cerrarConexion(conexion);

            url = "JSP/update/finActualizar.jsp";

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(url).forward(request, response);
    
    }

    /* 
     * Este método elimina las aves seleccionadas.
     */
    public void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;

        try {
            //Hacemos la conexion a la BBDD
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();
            //obtenemos los valores del formulario
            String anilla = request.getParameter("anilla");
            //preparamos la sentencia SQL
            sql = "delete from aves where anilla = '"+anilla+"'";
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.executeUpdate();

            //NO FUNCIONA!!!
            
            //cerramos conexion
            Conexion.cerrarConexion(conexion);

            url = "JSP/delete/finEliminar.jsp";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

}//fin clase


