/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package Filters;

import database.DB;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import model.Usuario;
import repository.UsuarioDao;

/**
 *
 * @author vieir
 */
public class RequisicaoFilter implements Filter {
    
    private ServletContext context;
    private UsuarioDao usuarioDao;
    private static Connection conn = null; 
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost/bd_user";
    private static String user = "root";
    private static String password = "123456"; 
    
    public void init(FilterConfig fConfig) throws ServletException{ 
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        }
        
    }
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println(conn);
        req.setAttribute("conn", conn);
        
        String userName = null;
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie c : cookies) {
                if(c.getName().equals("userName")) userName = c.getValue();
            }
        }
        
        if(userName != null) {
           usuarioDao = new UsuarioDao(conn);
           Usuario usuario = usuarioDao.findByUserName(userName);
           req.setAttribute("usuario", usuario);
           if(usuario != null && usuario.getSessionId() != null) {
               req.getRequestDispatcher("index.html").forward(request, response);
           }else {
               chain.doFilter(request, response);
           }
           
        }else {
            chain.doFilter(request, response);
        }
        
    }

    public void destroy() {        
    }

    
}
