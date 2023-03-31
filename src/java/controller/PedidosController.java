/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import model.Adicional;
import model.Lanche;
import model.Pedido;
import repository.AdicionalDao;
import repository.EnderecoDao;
import repository.ItemPedidoDao;
import repository.LancheDao;
import repository.PedidoDao;

/**
 *
 * @author vieir
 */
public class PedidosController extends HttpServlet {

    private PedidoDao pedidoDao = null;
    private List<Pedido> pedidos = null;

    @Override
    public void init() throws ServletException {
        pedidoDao = new PedidoDao();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String loginRedirect = (String) request.getAttribute("loginRedirect");

            String idPedido = request.getParameter("DetalhesPedido");
            String recarregarConsulta = request.getParameter("RecarregarConsulta");
            String recarregarAjax = request.getParameter("RecarregarAjax");

            //Visualização de Mais Detalhes dos Pedidos - Funcionando no T3
            if (idPedido != null) {
                request.setAttribute("idPedido", idPedido);
                request.setAttribute("pedidos", pedidos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("MaisDetalhes.jsp");
                dispatcher.forward(request, response);
            } 
            //Recarga Manual dos Pedidos - Funcionando no T3
            else if (recarregarConsulta != null) {
                pedidos = pedidoDao.findAll();
                request.setAttribute("pedidos", pedidos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                dispatcher.forward(request, response);
            } 
            //Recarga a cada 20 seg pelo Ajax - Funcionando no T3
            else if (recarregarAjax != null) {

                pedidos = pedidoDao.findAll();
                //Biblioteca Jackson sendo utilizada para encapsular um objeto List em um JSON e ser enviado para o AJAX no responseText
                ObjectMapper mapper = new ObjectMapper();

                //Linha abaixo necessária para encapsular corretamente os dados de formato DateTime no JSON
                mapper.registerModule(new JavaTimeModule());
                String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(pedidos);

                out.print(json);
                out.flush();
            } 
            //O servlet irá entrar no if abaixo se o filtro redirecionar ele para cá(Login efetuado com sucesso ou session restaurada)
            else if ("Visualizar Pedidos".equals(loginRedirect)) {
                System.out.println("Pedidos Controller Carregado");
                //Consulta do BD é feita para não haver Forward entre Inserção e Visualização - Requisito do Trabalho
                pedidos = pedidoDao.findAll();
                request.setAttribute("pedidos", pedidos);
                request.setAttribute("loginRedirect", null);
                RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                dispatcher.forward(request, response);
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
