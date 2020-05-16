<%-- 
    Document   : leerEliminar
    Created on : 16-may-2020, 20:25:06
    Author     : Francisco_Antonio
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="es.albarregas.beans.Ave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Elección de aves a eliminar.</title>
    </head>
    <%

        List<Ave> aves = null;
        Iterator<Ave> it = null;//crado el iterador
        if (request.getAttribute("aves") != null) {
            aves = (List) request.getAttribute("aves");
            it = aves.iterator();
        }
    %>
    <body>
        <h1>Seleccione una o varias aves para ELIMINAR:</h1>
        
                <form action="<%=request.getContextPath()%>/Realizar" method="post">
            <%
                        if (!it.hasNext()) {
                    %>
                    <h3>No existen datos, puede crear unos nuevos en la opción insertar</h3>    
                    <%
                    } else {
                        while (it.hasNext()) {
                            Ave ave = it.next();
                    %>
                    <input type="checkbox" value="<%=ave.getAnilla()%>" name="avesEliminar"><label id="listadoEliminar"><%=ave.getEspecie()%></label>
                    <br>
                    <%
                            }//fin while
                        }
                    %>
            <button type="submit" value="cancelar" name="operacion">Cancelar</button>
            <button id="eliminar" type="submit" value="aceptarEliminar" name="operacion">Eliminar</button>
        </form>
    </body>
</html>
