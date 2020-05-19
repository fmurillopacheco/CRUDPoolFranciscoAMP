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
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/error404.css" />
        <title>Error interno del servidor.</title>
        <!--ERROR 500-->
    </head>
    <body>
        <div class="error">
            <a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/IMG/error500Coyote.png"/></a>
            <h2>¡Vaya!Lo sentimos, algo salió mal</h2>
            <h2>Error interno del servidor.</h2>
            <h3>Pulsa en la imagen para volver al Men&uacute;.</h3>
            
        </div>

        <div class=container>
              
        </div>
    </body>
</html>
