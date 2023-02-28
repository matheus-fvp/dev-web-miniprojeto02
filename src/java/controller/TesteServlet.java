/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import repository.PedidoDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;
import repository.*;

/**
 *
 * @author vieir
 */
public class TesteServlet extends HttpServlet {
    
    private PedidoDao pedidoDao = null;
    private EnderecoDao enderecoDAO = null;
    private ItemPedidoDao ItemPedidoDao = null;

    @Override
    public void init() throws ServletException {
        pedidoDao = new PedidoDao();
        enderecoDAO = new EnderecoDao();
        ItemPedidoDao = new ItemPedidoDao();
    }

    
    
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            List<Pedido> pedidos = pedidoDao.findAll();
            System.out.println(pedidoDao.findById(3L));
            request.setAttribute("pedidos", pedidos);
            
            //Salavando no BD teste
            /*Endereco e = new Endereco();
            e.setBairro("Jardim Nova Esperança");
            e.setRua("Rua Humberto Sampaio de Souza");
            e.setNumero("665");
            e.setComplemento("Bar da Carolina");
            e.setId(53L);
            
            Lanche l = new Lanche();
            l.setId(2L);
            Lanche l2 = new Lanche();
            l2.setId(5L);
            
            Adicional a = new Adicional();
            a.setId(1L);
            Adicional a2 = new Adicional();
            a2.setId(3L);
            
            
            ItemPedido itemPedido = new ItemPedido();
            itemPedido.setQuantidade(1);
            itemPedido.setProduto(l);
            itemPedido.addAdicional(a);
            itemPedido.addAdicional(a2);
            
            ItemPedido itemPedido2 = new ItemPedido();
            itemPedido2.setQuantidade(3);
            itemPedido2.setProduto(l2);
            
            Pedido pedido = new Pedido();
            pedido.setClienteNome("Matheus Vieira");
            pedido.setClienteEmail("matheusvieira@gmail.com");
            pedido.setClienteTelefone("(15)66677-9090");
            pedido.setEnderecoDeEntrega(e);
            pedido.addItemPedido(itemPedido);
            pedido.addItemPedido(itemPedido2);
            System.out.println(e);
            System.out.println(pedido);
            
            
            //enderecoDAO.save(e);
            ItemPedidoDao.save(itemPedido);
            ItemPedidoDao.save(itemPedido2);
            System.out.println(itemPedido);
            pedidoDao.save(pedido);*/
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("teste.jsp");
            dispatcher.forward(request, response);
        }
    }

}
