<%-- 
    Document   : error500
    Created on : 16-may-2020, 20:25:56
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/error500.css" />
        <title>Error interno del servidor.</title>
        <!--ERROR 500-->
    </head>
    <body>
        

        <div class=container>
            <div class="error">
                <h2>Lo sentimos, algo salió mal.</h2>
            </div>
                <div class="error1">
                    <h3>Vuelve a intentarlo, si persiste ponte en contacto con el Administrador. Gracias. <br> <a href="<%=request.getContextPath()%>"> Volver </a></h3>
                </div>                
        </div>
    </body>
</html>
