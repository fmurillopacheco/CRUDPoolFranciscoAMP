<%-- 
    Document   : index
    Created on : 15-may-2020, 22:22:59
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=McLaren&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <%@include file="/INC/metas.inc"%>
        <title>CRUD Avistamiento de Aves.</title>
    </head>
    <body>
        <h1>Bienvenido al grandioso y maravilloso mundo de las aves, elije una opción: </h1>
    
        <form action="Operacion" method="post">
            <ul>
                <li><button type="submit" value="Insertar" name="operacion">Insertar ave</button></li>
                <li><button type="submit" value="Visualizar" name="operacion">Visualizar aves</button></li>
                <li><button type="submit" value="Actualizar" name="operacion">Actualizar ave</button></li>
                <li><button type="submit" value="Eliminar" name="operacion">Eliminar aves</button></li>
            </ul>
                
        </form>
    </body>
</html>
