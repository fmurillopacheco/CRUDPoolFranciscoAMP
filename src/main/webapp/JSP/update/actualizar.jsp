<%-- 
    Document   : actualizar
    Created on : 16-may-2020, 20:26:43
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
        <title>Actualizar aves.</title>
    </head>
    <body>
        <h1>Introduce los datos que deseas actualizar: </h1>
        <form action="<%=request.getContextPath()%>/Concluir" method="post">
            
            <%
                List<Ave> arrayAves = (ArrayList<Ave>) request.getAttribute("aves");
                for (Ave ave : arrayAves) {
            %>
            
            <table border = 1>

                <h3>El ave seleccionada es: </h3>
                <tr id="leerTabla">
                    <td><%=ave.getAnilla()%></td>
                    <td><%=ave.getEspecie()%></td>
                    <td><%=ave.getLugar()%></td>
                    <td><%=ave.getFecha()%></td>
                </tr>
                <br>
            </table>

            <table>
                <h3>Introduce los nuevos datos: </h3>
                <tr>
                    <td><label>Anilla: </label></td>
                    <td><input type="text" value="<%=ave.getAnilla()%>" name="anilla" readonly/></td>
                </tr>
                <tr>
                    <td><label>Introduce la especie: </label></td>
                    <td><input type="text" value="" name="especie" maxlength="20"/></td>
                </tr>
                <tr>
                    <td><label>Introduce el lugar: </label></td>
                    <td><input type="text" value="" name="lugar" maxlength="50"/></td>
                </tr>
                <tr>
                    <td><label>Introduce la fecha: </label></td>
                    <td><input type="text" value="" name="fecha" placeholder="19/08/1989" maxlength="10"/></td>
                </tr>
            </table>
            <%
                }
            %>
            <button type="submit" value="cancelar" name="operacion">Cancelar</button>
            <button id="eliminar" type="submit" value="Actualizar" name="operacion">Actualizar</button>
        </form>
    </body>
</html>
