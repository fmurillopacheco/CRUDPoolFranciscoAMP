<%-- 
    Document   : leer
    Created on : 16-may-2020, 20:26:22
    Author     : Francisco_Antonio
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="es.albarregas.beans.Ave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Listado de aves.</title>
    </head>
        <%  

        List<Ave> aves = null;
        Iterator<Ave> it = null; 
        if (request.getAttribute("aves") != null) {
            aves = (List) request.getAttribute("aves");
            it = aves.iterator();
        }

    %>
    <body>
        <h1>Listado de todas las aves.</h1>
            <%
                if (!it.hasNext()) {
            %>
                    <h3>No existen datos, puede crear unos nuevos en la opción insertar</h3>    
            
            <%
            
                } else {
                        while (it.hasNext()) {
                            Ave ave = it.next();
            %>
        <form action="ControladorFinal" method="post">
            <table>
                    <tr>
                        <th>Anilla</th>
                        <th>Especie</th>
                        <th>Lugar</th>
                        <th>Fecha</th>
                    </tr>
                <tr id="leerTabla">
                    <td><%=ave.getAnilla()%></td>
                    <td><%=ave.getEspecie()%></td>
                    <td><%=ave.getLugar()%></td>
                    <td><%=ave.getFecha()%></td>
                </tr>

            </table>
            <br />
            <%
                    }
                }
            %>
            <button type="submit" value="menu" name="operacion">Men&uacute;</button>
            </form>
    </body>
</html>
