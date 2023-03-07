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
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

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

            //O servlet irá entrar no if abaixo se o usuário entrar na página de Visualizar Pedidos no index.html
            if ("Visualizar Pedidos".equals(radio)) {
                //Consulta do BD é feita para não haver Forward entre Inserção e Visualização - Requisito do Trabalho
                pedidos = pedidoDao.findAll();
                request.setAttribute("pedidos", pedidos);
                RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                dispatcher.forward(request, response);
            } //O servlet irá entrar no else if abaixo se o usuário entrar na página de Inserir Pedidos no index.html
            else if ("Inserir Pedidos".equals(radio)) {
                //Consulta dos Lanches e Adicionais são feitas no BD para o conteúdo apresentado ao cliente não precisar estar chumbado no html 
                lanches = lancheDao.findAll();
                adicionais = addDao.findAll();
                request.setAttribute("lanches", lanches);
                request.setAttribute("adicionais", adicionais);
                RequestDispatcher dispatcher = request.getRequestDispatcher("InserirPedidos.jsp");
                dispatcher.forward(request, response);

            } /**
             * O servlet irá entrar no Else em caso de qualquer outra operação
             * fora do index.html, para verificar sua origem e qual o tratamento
             * a ser feito
             *
             */
            else {

                String idPedido = request.getParameter("DetalhesPedido");
                String recarregarConsulta = request.getParameter("RecarregarConsulta");
                String recarregarAjax = request.getParameter("RecarregarAjax");
                String pedidoEnviado = request.getParameter("enviar-pedido");
                String dadosPedidoEnviado = request.getParameter("pedido-enviado");

                //Operação de Recarregar a Consulta manualmente na página de Visualização, necessário nova consulta no BD para ser feita
                if (recarregarConsulta != null) {
                    pedidos = pedidoDao.findAll();
                    request.setAttribute("pedidos", pedidos);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("VisualizarPedidos.jsp");
                    dispatcher.forward(request, response);
                } //Operação de Recarregar a Consulta automaticamente por AJAX, necessário nova consulta no BD para ser feita
                else if (recarregarAjax != null) {

                    pedidos = pedidoDao.findAll();
                    //Biblioteca Jackson sendo utilizada para encapsular um objeto List em um JSON e ser enviado para o AJAX no responseText
                    ObjectMapper mapper = new ObjectMapper();

                    //Linha abaixo necessária para encapsular corretamente os dados de formato DateTime no JSON
                    mapper.registerModule(new JavaTimeModule());
                    String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(pedidos);

                    out.print(json);
                    out.flush();
                } /**
                 * Operação de Ver Mais detalhes de um pedido, não é necessário
                 * nova consulta no BD(redundante) As páginas
                 * VisualizarPedidos.jsp e MaisDetalhes.jsp, compartilham os
                 * mesmos dados sem a necessidade de uma segunda consulta ao BD
                 * na transição de uma página para outra, a lista de pedidos é
                 * obtida abaixo do servlet.
                 *
                 */
                else if (idPedido != null) {
                    request.setAttribute("idPedido", idPedido);
                    request.setAttribute("pedidos", pedidos);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("MaisDetalhes.jsp");
                    dispatcher.forward(request, response);
                } //Operação do Envio de um pedido, vindo da página Inserir Pedidos, recebe um objeto JSON e converte em List para ser enviado ao BD
                else if (pedidoEnviado != null && dadosPedidoEnviado != null) {
                    //Lendo objeto JSON passado pelo forms através da lib Jackson
                    String detalhesPedido = request.getParameter("pedido-enviado");
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonNode = objectMapper.readTree(detalhesPedido);

                    //Tratando Dados Pessoais
                    JsonNode dadosPessoaisJson = jsonNode.get(jsonNode.size() - 1);
                    String nome = dadosPessoaisJson.get("nome").asText();
                    String email = dadosPessoaisJson.get("email").asText();
                    String telefone = dadosPessoaisJson.get("telefone").asText();

                    String rua = dadosPessoaisJson.get("rua").asText();
                    String numero = dadosPessoaisJson.get("numero").asText();
                    String bairro = dadosPessoaisJson.get("bairro").asText();
                    String complemento = dadosPessoaisJson.get("complemento").asText();

                    //Instanciando objeto Endereco e seus dados
                    Endereco endereco = new Endereco();
                    endereco.setRua(rua);
                    endereco.setNumero(numero);
                    endereco.setBairro(bairro);
                    //Complemento é opcional para ser instanciado
                    if (!complemento.isEmpty()) {
                        endereco.setComplemento(complemento);
                    }
                    enderecoDAO.save(endereco);

                    //Criação de um novo pedido para ser inserido no BD
                    Pedido pedido = new Pedido();
                    pedido.setClienteNome(nome);
                    pedido.setClienteEmail(email);
                    pedido.setClienteTelefone(telefone);
                    pedido.setEnderecoDeEntrega(endereco);

                    for (int i = 0; i < jsonNode.size() - 1; i++) {
                        //Cada lanche é recebido do tratamento feito pela biblioteca Jackson para ser instanciado nos devidos objetos
                        ItemPedido itemPedido = new ItemPedido();
                        JsonNode lanche = jsonNode.get(i);

                        //Tratamento e instanciação de um novo lanche
                        Long lancheId = Long.valueOf(lanche.get("lancheId").asText());
                        Lanche l = new Lanche();
                        l.setId(lancheId);
                        itemPedido.setProduto(l);
                        itemPedido.setQuantidade(1);

                        //Tratamento e instanciação de um novo adicional linkado ao lanche
                        JsonNode adicionaisIdJson = lanche.get("adicionaisId");
                        if (adicionaisIdJson.isArray()) {
                            for (final JsonNode objNode : adicionaisIdJson) {
                                Long adicionalId = Long.valueOf(objNode.asText());
                                Adicional a = new Adicional();
                                a.setId(adicionalId);
                                itemPedido.addAdicional(a);
                            }
                        }
                        //Operação para adicionar e salvar um produto do pedido(lanche com/sem adicionais)
                        pedido.addItemPedido(itemPedido);
                        ItemPedidoDao.save(itemPedido);
                    }
                    //Operação para salvar o pedido completo(com 1 ou mais lanches pedidos)
                    pedidoDao.save(pedido);
                    response.sendRedirect("index.html");
                }
            }
        }
    }
}
