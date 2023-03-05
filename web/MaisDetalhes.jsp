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
        <%String idPedido = (String)(request.getAttribute("idPedido")); %>
        <%List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");%>
        <%int idpedidoI = Integer.parseInt(idPedido); %>
        <%Pedido p = pedidos.get(idpedidoI);%>
        <%List<Long> pedidosMostrados = new ArrayList<>();%>



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
            if(pedidosMostrados.size()==0){
            System.out.println("Iniciando "+i.getProduto().getId());
            pedidosMostrados.add(i.getProduto().getId());
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

                    <%}%>
                    <%
                    }
else if(!pedidosMostrados.contains(i.getProduto().getId())){
System.out.println("prox pedido");
                        pedidosMostrados.add(i.getProduto().getId()); 
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
            for(Produto adicional : i.getAdicionais()){
System.out.println("adicional vindo");
                    %>
                    <li><%=adicional.getNome()%></li>
                        <%

                        }
                        }
                            System.out.println(pedidosMostrados);}%>
                    </body>
                    </html>
