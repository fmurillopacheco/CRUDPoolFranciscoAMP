
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
@WebServlet(name = "Operacion", urlPatterns = {"/Operacion"})
public class Operacion extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String url = "";

        if (request.getParameter("operacion") != null) {
            switch (request.getParameter("operacion")) {
                case "Insertar":

                    url = "JSP/create/inicioInsertar.jsp";
                    break;
                case "Visualizar":

                    obtenerTodasLasAves(request, response);
                    url = "JSP/read/leer.jsp";
                    request.setAttribute("operacion", "leer");
                    break;
                case "Actualizar":

                    obtenerTodasLasAves(request, response);
                    url = "JSP/update/leerActualizar.jsp";
                    break;
                case "Eliminar":

                    obtenerTodasLasAves(request, response);
                    url = "JSP/delete/leerEliminar.jsp";
                    break;
            }
        }

        //redirigimos a la página correspondiente
        request.getRequestDispatcher(url).forward(request, response);

    }

    public void obtenerTodasLasAves(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        DataSource datasource = null;
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        String sql = null;
        ResultSet resultSet = null;
        Ave ave = null;
        List<Ave> aves = new ArrayList();
        try {
            datasource = Conexion.crearConexion();
            conexion = datasource.getConnection();
            //Ejecutar sentencia SQL
            sql = "select * from aves;";
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
    }

}
