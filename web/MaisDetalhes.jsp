<%-- 
    Document   : empregadoView
    Created on : 17 de fev. de 2023, 10:19:17
    Author     : vieir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pedido"%>
<%@page import="model.ItemPedido"%>
<%@page import="model.Produto"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Pedidos</title>
        <link rel="stylesheet" href="MaisDetalhes.css">
    </head>
    <body>
        <%
            String idPedido = (String)(request.getAttribute("idPedido"));
            int idpedidoI = Integer.parseInt(idPedido);
            
            /**
                * As páginas VisualizarPedidos.jsp e MaisDetalhes.jsp, compartilham os mesmos dados
                * sem a necessidade de uma segunda consulta
                * ao BD na transição de uma página para outra, a lista de pedidos é obtida abaixo do servlet.
            **/
            List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");
            
            //Pedido atual que foi clicado na página de Visualizar Pedidos
            Pedido p = pedidos.get(idpedidoI); 
            
            //Lista para fazer o tratamento da consulta vinda do BD, para os adicionais serem colocados no devido lugar da renderização
            List<Long> lanchesMostrados = new ArrayList<>();
        %>



        <h1>ID do Pedido:<%= idPedido%></h1>
        <h2>Data do pedido:<%=p.getDataPedido()%></h2>

        <h3 class="list-heading">Informações do cliente:</h3>
        <ul>
            <li>Nome do cliente: <%=p.getClienteNome()%></li>
            <li>ID do cliente: <%=p.getId()%></li>
            <li>Email do cliente: <%=p.getClienteEmail()%></li>
            <li>Telefone do cliente: <%=p.getClienteTelefone()%></li>
            <li>Endereço de Entrega do cliente: <%=p.getEnderecoDeEntrega().toString()%></li> 
        </ul>


        <h3 class="list-heading">Detalhes dos Produtos:</h3>

        <% for(ItemPedido i : p.getLanches()){%>        
        <%
            //Leitura do primeiro lanche pedido
            if(lanchesMostrados.size()==0){
            System.out.println("Iniciando "+i.getProduto().getId());
            lanchesMostrados.add(i.getProduto().getId());
        %>
        <div class="box">
            <ul>
                <li>Qtde de Produtos Pedidos: <%=i.getQuantidade()%></li>
                <li>ID do Produto: <%=i.getProduto().getId()%></li>
                <li>Nome do Produto: <%=i.getProduto().getNome()%></li>
                <li>Adicionais:</li>
                <ul>
                    <% for(Produto adicional : i.getAdicionais()){%>

                    <li><%=adicional.getNome()%></li>

                    <%}
                    }
                    /**
                     * Se o id do produto lido não estiver na lista neste ponto, significa que os dados
                     * do lanche atual acabaram e o próximo será lido
                    **/
                        else if(!lanchesMostrados.contains(i.getProduto().getId())){
                        System.out.println("prox pedido");
                        lanchesMostrados.add(i.getProduto().getId()); 
                    %>
                </ul> 
            </ul>
        </div> 
        <div class="box">
            <ul>
                <li>Qtde de Produtos Pedidos: <%=i.getQuantidade()%></li>
                <li>ID do Produto: <%=i.getProduto().getId()%></li>
                <li>Nome do Produto: <%=i.getProduto().getNome()%></li>
                <li>Adicionais:</li>
                <ul>
                    <% for(Produto adicional : i.getAdicionais()){%>

                    <li><%=adicional.getNome()%></li>

                    <%}
                }
            else{
                    /**
                     * Se o ID do objeto que veio do BD está na lista, estamos no mesmo lanche ainda,
                     * porém, outro adicional, será renderizado na mesma div
                    **/
                    for(Produto adicional : i.getAdicionais()){
                        System.out.println("adicional vindo");
                    %>
                    <li><%=adicional.getNome()%></li>
                        <%

                        }
                        }
                            System.out.println(lanchesMostrados);}%>
                    </body>
                    </html>
