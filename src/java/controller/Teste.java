/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import model.Usuario;
import repository.UsuarioDao;

/**
 *
 * @author vieir
 */
public class Teste extends HttpServlet {

    public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        private UsuarioDao usuarioDao;
        

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

            // get request parameters for userID and password
            String user = request.getParameter("login");
            String pwd = request.getParameter("password");
            Connection conn = (Connection) request.getAttribute("conn");
            usuarioDao = new UsuarioDao(conn);
            Usuario usuario = usuarioDao.findByUserName(user);
            System.out.println("Entrei no Teste");
            
            if(usuario != null) {
                System.out.println("O erro é aqui 211");
                if(usuario.getUserName().equals(user)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", user);
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("userName", user);
                    userName.setMaxAge(30*60);
                    response.addCookie(userName);
                    response.sendRedirect("index.html");
                }
            }else{
                System.out.println("O erro é aqui");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
                PrintWriter out= response.getWriter();
                out.println("<font color=red>Erro: User id ou password incorreto.</font>");
                rd.include(request, response);
            }

	}

}

}
