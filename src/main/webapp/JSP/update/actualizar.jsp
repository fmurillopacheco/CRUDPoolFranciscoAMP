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
            
                <h3>El ave seleccionada es: </h3>
                <table>
                    <tr>
                        <th>Anilla</th>
                        <th>Especie</th>
                        <th>Lugar</th>
                        <th>Fecha</th>
                    </tr>
                    <tr>
                        <td><%=ave.getAnilla()%></td>
                        <td><%=ave.getEspecie()%></td>
                        <td><%=ave.getLugar()%></td>
                        <td><%=ave.getFecha()%></td>
                    </tr>
                </table>
                <br>


                <h3>Introduce los nuevos datos: </h3>
                    <% 
        boolean hayErrores = false;
        String anillaRepetida = "";
        String valueEspecie = "";
        String valueLugar = "";
        String valueFecha = "";
        String placeholder = "";
        
            if(request.getAttribute("anillaRepetida") != null){
                hayErrores = true;
                anillaRepetida = (String) request.getAttribute("anillaRepetida");
                placeholder = "Error en la anilla";
                if(request.getParameter("especie") != null){
                    valueEspecie = request.getParameter("especie");
                    }
                if(request.getParameter("lugar") != null){
                    valueLugar = request.getParameter("lugar");
                    }
                if(request.getParameter("fecha") != null){
                    valueFecha = request.getParameter("fecha");
                    }
                }
               
        %>
                
                    <label>Anilla: </label>
                    <input type="text" value="<%=ave.getAnilla()%>" name="anilla" readonly/><br><br>
                    <label>Introduce la especie: </label>
                    <input type="text" value="<%=valueEspecie%>" name="especie" maxlength="20"/><br><br>
                    <label>Introduce el lugar: </label>
                    <input type="text" value="<%=valueLugar%>" name="lugar" maxlength="50"/><br><br>
                    <label>Introduce la fecha: </label>
                    <input type="date" value="<%=valueFecha%>" name="fecha"/><br><br>
                

            <%
                }
            %>
            <button type="submit" value="cancelar" name="operacion">Cancelar</button>
            <button id="eliminar" type="submit" value="Actualizar" name="operacion">Actualizar</button>
        </form>
    </body>
</html>
