
package es.albarregas.connections;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
/**
 *
 * @author Francisco_Antonio
 */
public class Conexion {
    //crear conexion con la base de datos
    public static DataSource crearConexion() throws SQLException{
    //public static Connection crearConexion() throws SQLException{
    DataSource datasource = null;
        try {
            Context contextoInicial = new InitialContext();
            datasource = (DataSource) contextoInicial.lookup("java:comp/env/jdbc/CRUDPoolFranciscoAMP");
        } catch (NamingException ex) {
            System.out.println("Problemas en el acceso a la BD");
            ex.printStackTrace();
        }
        
        //return datasource.getConnection();
        return datasource;
    }
    
    //cerrar la conexion con la base de datos
    public static void cerrarConexion(Connection connection) throws SQLException{
        connection.close();
    }

    public static DataSource conectar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
