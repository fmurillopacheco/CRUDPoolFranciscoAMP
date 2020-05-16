<%-- 
    Document   : leer
    Created on : 16-may-2020, 20:26:22
    Author     : Francisco_Antonio
--%>
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
    <body>
        <h1>Listado de todas las aves.</h1>
        
        <form action="ControladorFinal" method="post">
            <table border = 1>
                <%
                    List<Ave> arrayAves = (ArrayList<Ave>) request.getAttribute("aves");
                    for (Ave ave : arrayAves) {
                %>
                <tr id="leerTabla">
                    <td><%=ave.getAnilla()%></td>
                    <td><%=ave.getEspecie()%></td>
                    <td><%=ave.getLugar()%></td>
                    <td><%=ave.getFecha()%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <br />
            <button type="submit" value="menu" name="operacion">Menú</button>
            </form>
    </body>
</html>
