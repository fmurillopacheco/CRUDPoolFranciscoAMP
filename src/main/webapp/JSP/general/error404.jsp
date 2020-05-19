<%-- 
    Document   : error404
    Created on : 19-may-2020, 14:02:06
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/error404.css" />
        <title>404 P&aacute;gina no encontrada...</title>
    </head>
    <body>
        
        <div class="error">
            <a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/IMG/error404Coyote.png"/></a>
            <h1>Error 404</h1><h2>  No pude encontrar la página.</h2>
            <h3>Pulsa en la imagen para volver al Men&uacute;.</h3>
            
        </div>
        <div class=container>

        </div>
    </body>
</html>
