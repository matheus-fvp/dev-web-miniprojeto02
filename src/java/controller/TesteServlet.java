/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.DB;
import database.dao.PedidoDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.util.List;
import model.Department;
import model.Pedido;

/**
 *
 * @author vieir
 */
public class TesteServlet extends HttpServlet {
    
    private PedidoDao pedidoDao = null;

    @Override
    public void init() throws ServletException {
        pedidoDao = new PedidoDao();
    }

    
    
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            List<Pedido> pedidos = pedidoDao.findAll();
            request.setAttribute("pedidos", pedidos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("teste.jsp");
            dispatcher.forward(request, response);
        }
    }

}
