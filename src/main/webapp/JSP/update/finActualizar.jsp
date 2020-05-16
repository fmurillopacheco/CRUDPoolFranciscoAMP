<%-- 
    Document   : finActualizar
    Created on : 16-may-2020, 20:27:03
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Actualización aves.</title>
    </head>
    <body>
        <h1>Actualización de aves.</h1>
        
        <form action="ControladorFinal" method="post">
            <table border = 1>

                <h3>Los nuevos datos del ave son:  </h3>
                <tr id="leerTabla">
                    <td><%=request.getParameter("anilla")%></td>
                    <td><%=request.getParameter("especie")%></td>
                    <td><%=request.getParameter("lugar")%></td>
                    <td><%=request.getParameter("fecha")%></td>
                </tr>
                <br>
            </table>

            <button type="submit" value="menu" name="operacion">Menú</button>
        </form>
    </body>
</html>
