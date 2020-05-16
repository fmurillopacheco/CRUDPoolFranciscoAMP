<%-- 
    Document   : finEliminar
    Created on : 16-may-2020, 20:24:48
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Aves eliminadas.</title>
    </head>
    <body>
        <h1>Se han ELIMINADO las aves seleccionadas.</h1>
        <form action="ControladorFinal" method="post">
            <button type="submit" value="menu" name="operacion">Menú</button>
        </form>
    </body>
</html>
