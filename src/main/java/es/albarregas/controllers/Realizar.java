
package es.albarregas.controllers;

import es.albarregas.beans.Ave;
import es.albarregas.connections.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "Realizar", urlPatterns = {"/Realizar"})
public class Realizar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("operacion") != null) {
            switch (request.getParameter("operacion")) {
                case "crearAve":

                    crearAve(request, response);
                    break;
                case "aceptarActualizar":

                    actualizarAve(request, response);

                    if (request.getParameter("operacion").equals("actualizarAve")) {
                        request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    } else {
                        request.getRequestDispatcher("JSP/update/actualizar.jsp").forward(request, response);
                    }
                    break;
                case "aceptarEliminar":

                    eliminarAve(request, response);

                    if (request.getParameter("operacion").equals("eliminarAve")) {
                        request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    } else {
                        request.getRequestDispatcher("JSP/delete/eliminar.jsp").forward(request, response);
                    }
                    break;
                case "cancelar":

                    request.getRequestDispatcher("ControladorFinal").forward(request, response);
                    break;
            }//fin switch            
        }//fin if
    }

    public void crearAve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        Ave ave = null;
        List<Ave> aves = new ArrayList();

        try {
            //Hacemos la conexion a la BBDD
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();

            sql = ("select * from aves where anilla = ?;");
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, request.getParameter("anilla"));
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                request.setAttribute("anillaRepetida", request.getParameter("anilla"));
                url = "JSP/create/inicioInsertar.jsp";

            } else {
                //obtenemos los valores del formulario
                String anilla = request.getParameter("anilla");
                String especie = request.getParameter("especie");
                String lugar = request.getParameter("lugar");
                String fecha = request.getParameter("fecha");
                //preparamos la sentencia SQL
                sql = "insert into aves values (?,?,?,?)";
                preparedStatement = conexion.prepareStatement(sql);
                //insertamos los valores
                preparedStatement.setString(1, anilla);
                preparedStatement.setString(2, especie);
                preparedStatement.setString(3, lugar);
                preparedStatement.setString(4, fecha);
                preparedStatement.executeUpdate();

                //cerramos conexion
                Conexion.cerrarConexion(conexion);

                url = "JSP/create/finInsertar.jsp";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(url).forward(request, response);
    }//fin metodo crear

    
    public void actualizarAve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        Ave ave = null;
        List<Ave> aves = new ArrayList();

        String[] anilla = request.getParameterValues("avesActualizar");
        try {
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();
            //Ejecutar sentencia SQL
            sql = "select * from aves where anilla = '" + anilla[0] + "';";//se selecciona siempre el elemento 0 del array ya que sólo se puede seleccionar un ave
            preparedStatement = conexion.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ave = new Ave();
                ave.setAnilla(resultSet.getString("anilla"));
                ave.setEspecie(resultSet.getString("especie"));
                ave.setLugar(resultSet.getString("lugar"));
                ave.setFecha(resultSet.getDate("fecha"));
                aves.add(ave);
            }
            request.setAttribute("aves", aves);
            Conexion.cerrarConexion(conexion);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }//fin metodo actualizar

    
    public void eliminarAve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        Ave ave = null;
        List<Ave> aves = new ArrayList();
       
        String[] anilla = request.getParameterValues("avesEliminar");
        try {
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();
            
            //SQL completa****
            sql = "delete from aves where ";
           for (int i = 0; i < request.getParameterValues("avesEliminar").length; i++) {
                sql += " anilla = ? or"; 
            }
            sql = sql.substring(0, sql.length() - 3);
            sql += ";";//cerrar sentencia
            //SQL completa****
           
            preparedStatement = conexion.prepareStatement(sql);
            for (int i = 0; i < request.getParameterValues("avesEliminar").length; i++) {
               
                preparedStatement.setString(i + 1, request.getParameterValues("avesEliminar")[i]);
            }
            resultSet = preparedStatement.executeQuery();
 
            while (resultSet.next()) {
                ave = new Ave();
                ave.setAnilla(resultSet.getString("anilla"));
                ave.setEspecie(resultSet.getString("especie"));
                ave.setLugar(resultSet.getString("lugar"));
                ave.setFecha(resultSet.getDate("fecha"));
                aves.add(ave);
            }
            request.setAttribute("aves", aves);
            Conexion.cerrarConexion(conexion);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }//fin metodo eliminar
}//fin clase.


