<%-- 
    Document   : finInsertar
    Created on : 16-may-2020, 20:23:59
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
         <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Insertar Ave.</title>
    </head>
    <body>
        <h1>Se ha creado un nuevo ave.</h1>
        <form action="ControladorFinal" method="post">
            <p>Ave con anilla: <strong><%=request.getParameter("anilla")%></strong></p>
            <p>Especie del ave: <strong><%=request.getParameter("especie")%></strong></p>
            <p>Lugar de avistamiento: <strong><%=request.getParameter("lugar")%></strong></p>
            <p>Fecha de avistamiento: <strong><%=request.getParameter("fecha")%></strong></p>
            <button type="submit" value="menu" name="operacion">Menú</button>
        </form>
    </body>
</html>
