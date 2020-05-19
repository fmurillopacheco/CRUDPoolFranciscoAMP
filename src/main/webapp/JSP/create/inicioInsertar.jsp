<%-- 
    Document   : inicioInsertar
    Created on : 16-may-2020, 20:23:41
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Inserta Ave.</title>
    </head>
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
    <body>
        
        <h1>INSERTE UN NUEVO AVE:</h1>
        
        <%
            if(hayErrores){
        %>
        
        <h3>La anilla <big><u><%=request.getAttribute("anillaRepetida")%></u></big> ya está introducida en la Base de Datos y no se puede repetir</h3>
        
        <%
            }

        %>
        <form action="<%=request.getContextPath()%>/Realizar" method="post">
            <label>Introduce anilla: </label>
            <input  type="text" value="" name="anilla" maxlength="6" placeholder="<%=placeholder%>"/><br><br>
            <label>Introduce la especie: </label>
                <input  type="text" value="<%=valueEspecie%>" name="especie" maxlength="20"/><br><br>
            <label>Introduce el lugar: </label>
                <input type="text" value="<%=valueLugar%>" name="lugar" maxlength="30"/><br><br>
            <label>Introduce la fecha: </label>
                <input  type="date" value="<%=valueFecha%>" name="fecha"/><br><br>
            <button type="submit" value="cancelar" name="operacion">Cancelar</button>
            <button id="insertar" type="submit" value="crearAve" name="operacion">Crear</button>
        </form>
        </div>
    </body>
</html>
