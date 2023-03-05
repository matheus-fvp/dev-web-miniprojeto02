/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.fasterxml.jackson.databind.JsonNode;
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
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 *
 * @author vieir
 */
public class ControllerPedidos extends HttpServlet {

    private PedidoDao pedidoDao = null;
    private EnderecoDao enderecoDAO = null;
    private ItemPedidoDao ItemPedidoDao = null;
    private List<Pedido> pedidos = null;
    private LancheDao lancheDao = null;
    private List<Lanche> lanches = null;
    private AdicionalDao addDao = null;
    private List<Adicional> adicionais = null;

    @Override
    public void init() throws ServletException {
        pedidoDao = new PedidoDao();
        enderecoDAO = new EnderecoDao();
        ItemPedidoDao = new ItemPedidoDao();
        lancheDao = new LancheDao();
        addDao = new AdicionalDao();
        
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String radio = request.getParameter("sampleRadio");
            if ("Visualizar Pedidos".equals(radio)) {
                pedidos = pedidoDao.findAll();
                /* TODO output your page here. You may use following sample code. */
                System.out.println("value of selected radio: " + radio);

                request.setAttribute("pedidos", pedidos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                dispatcher.forward(request, response);
            } else if ("Inserir Pedidos".equals(radio)) {
                lanches = lancheDao.findAll();
                adicionais = addDao.findAll();
                System.out.println("value of selected radio: " + radio);
                request.setAttribute("lanches", lanches);
                request.setAttribute("adicionais", adicionais);
                RequestDispatcher dispatcher = request.getRequestDispatcher("InserirPedidos.jsp");
                dispatcher.forward(request, response);
              
            } else {
                System.out.println("ELSE");
                String idPedido = request.getParameter("DetalhesPedido");
                String recarregarConsulta = request.getParameter("RecarregarConsulta");
                String pedidoT = request.getParameter("enviar-pedido");
                String pedidoT1 = request.getParameter("pedido-enviado");

                if (recarregarConsulta != null) {
                    pedidos = pedidoDao.findAll();
                    System.out.println(pedidos.size());
                    request.setAttribute("pedidos", pedidos);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                    dispatcher.forward(request, response);
                } else if (idPedido != null) {
                    System.out.println(pedidos.size());
                    request.setAttribute("idPedido", idPedido);
                    request.setAttribute("pedidos", pedidos);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("MaisDetalhes.jsp");
                    dispatcher.forward(request, response);
                } else if (pedidoT != null && pedidoT1 != null) {
                    //Lendo objeto JSON passado pelo forms através da lib Jackson
                    String detalhesPedido = request.getParameter("pedido-enviado");
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonNode = objectMapper.readTree(detalhesPedido);
                    System.out.println("Json: " + jsonNode);

                    //Tratando Dados Pessoais
                    JsonNode dadosPessoaisJson = jsonNode.get(jsonNode.size() - 1);
                    String nome = dadosPessoaisJson.get("nome").asText();
                    String email = dadosPessoaisJson.get("email").asText();
                    String telefone = dadosPessoaisJson.get("telefone").asText();

                    String rua = dadosPessoaisJson.get("rua").asText();
                    String numero = dadosPessoaisJson.get("numero").asText();
                    String bairro = dadosPessoaisJson.get("bairro").asText();
                    String complemento = dadosPessoaisJson.get("complemento").asText();

                    Endereco endereco = new Endereco();
                    
                    endereco.setRua(rua);
                    endereco.setNumero(numero);
                    endereco.setBairro(bairro);
                    if (!complemento.isEmpty()) {
                        endereco.setComplemento(complemento);
                    }
                    enderecoDAO.save(endereco);
                    
                    
                    Pedido pedido = new Pedido();
                    pedido.setClienteNome(nome);
                    pedido.setClienteEmail(email);
                    pedido.setClienteTelefone(telefone);
                    pedido.setEnderecoDeEntrega(endereco);

                    for (int i = 0; i < jsonNode.size() - 1; i++) {
                        ItemPedido itemPedido = new ItemPedido();
                        JsonNode lanche = jsonNode.get(i);
                        System.out.println("lanche "+i+": "+lanche);
                        
                        Long lancheId = Long.valueOf(lanche.get("lancheId").asText());
                        Lanche l = new Lanche();
                        l.setId(lancheId);
                        itemPedido.setProduto(l);
                        itemPedido.setQuantidade(1);

                        JsonNode adicionaisIdJson = lanche.get("adicionaisId");
                        if (adicionaisIdJson.isArray()) {
                            for (final JsonNode objNode : adicionaisIdJson) {
                                Long adicionalId = Long.valueOf(objNode.asText());
                                Adicional a = new Adicional();
                                a.setId(adicionalId);
                                itemPedido.addAdicional(a);
                            }
                        }
                        pedido.addItemPedido(itemPedido);
                        ItemPedidoDao.save(itemPedido);
                    }
                    
                    pedidoDao.save(pedido);
                    System.out.println(pedido);
                    response.sendRedirect("index.html");
                }
            }
        }
    }
}
