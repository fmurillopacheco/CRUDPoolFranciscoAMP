<%-- 
    Document   : eliminar
    Created on : 16-may-2020, 20:24:26
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
        <title>Eliminar registro.</title>
    </head>
    <%
      
        List<Ave> aves = null;
        Iterator<Ave> it = null;//crado el iterador
        if (request.getAttribute("aves") != null) {
            aves = (List) request.getAttribute("aves");
            it = aves.iterator();
        }
    %>
    <body>
        <h1>¿Estás seguro que deseas ELIMINAR estas aves?</h1>
        
                <form action="<%=request.getContextPath()%>/Concluir" method="post">
        <h3>Las aves seleccionadas son: </h3>

            <%
                while (it.hasNext()) {
                    Ave ave = it.next();
            %>
            <table border = 1>

                
                <tr id="leerTabla">
                    <td><%=ave.getAnilla()%></td>
                    <td><%=ave.getEspecie()%></td>
                    <td><%=ave.getLugar()%></td>
                    <td><%=ave.getFecha()%></td>
                </tr>

            </table>
            <br>
            <%  
                }//fin while
            %>
            <button type="submit" value="cancelar" name="operacion">Cancelar</button>
            <button id="eliminar" type="submit" value="Eliminar" name="operacion">Eliminar</button>
        </form>
    </body>
</html>
