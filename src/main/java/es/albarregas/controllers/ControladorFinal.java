
package es.albarregas.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Francisco_Antonio
 */
@WebServlet(name = "ControladorFinal", urlPatterns = {"/ControladorFinal"})
public class ControladorFinal extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            //redirección al index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    
    }


}
