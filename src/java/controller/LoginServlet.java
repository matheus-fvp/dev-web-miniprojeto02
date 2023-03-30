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
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsuarioDao usuarioDao;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("login");
        String pwd = request.getParameter("password");
        Connection conn = (Connection) request.getAttribute("conn");
        usuarioDao = new UsuarioDao(conn);
        Usuario usuario = usuarioDao.findByUserName(user);
        
        //verifica se o usuário existe ou os dados fornecidos no formulário batem com os que estão armazenados no BD
        if(usuario != null && usuario.getUserName().equals(user) && usuario.getPassword().equals(pwd)) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", user);
            session.setMaxInactiveInterval(1140*60);
            usuario.setSessionId(session.getId());
            usuarioDao.update(usuario);
            Cookie userName = new Cookie("userName", user);
            userName.setMaxAge(30*60);
            response.addCookie(userName);
            request.getRequestDispatcher("PedidosController").forward(request, response);
        }else{
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.html");
            PrintWriter out= response.getWriter();
            out.println("<font color=red>Erro: UserName ou password incorreto.</font>");
            rd.include(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
