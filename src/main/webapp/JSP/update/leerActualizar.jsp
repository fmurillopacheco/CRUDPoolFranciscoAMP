<%-- 
    Document   : leerActualizar
    Created on : 16-may-2020, 20:27:25
    Author     : Francisco_Antonio
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="es.albarregas.beans.Ave"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/INC/metas.inc"%>
        <link rel="stylesheet" type="text/css" href="CSS/avesStyle.css">
        <title>Aves a Actualizar.</title>
    </head>
    <%  

        List<Ave> aves = null;
        Iterator<Ave> it = null; 
        if (request.getAttribute("aves") != null) {
            aves = (List) request.getAttribute("aves");
            it = aves.iterator();
        }

    %>
    
    <body>
        <h1>Elija las aves que desea ACTUALIZAR: </h1>
        
        <form action="<%=request.getContextPath()%>/Realizar" method="post">
        
            <%
                if (!it.hasNext()) {
            %>

        <h3>No existen datos, puede crear unos nuevos en la opción insertar</h3>    
            
            <%
            
                } else {
                        while (it.hasNext()) {
                            Ave ave = it.next();
            %>
        <input type="radio" value="<%=ave.getAnilla()%>" name="avesActualizar"><label id="listadoActualizar"><%=ave.getEspecie()%></label>
        <br>
            <%
                    }
                }
            %>
        <button type="submit" value="cancelar" name="operacion">Cancelar</button>
        <button id="actualizar" type="submit" value="aceptarActualizar" name="operacion">Actualizar</button>
        
        </form>
    </body>
</html>
