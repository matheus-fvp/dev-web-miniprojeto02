<%-- 
    Document   : empregadoView
    Created on : 17 de fev. de 2023, 10:19:17
    Author     : vieir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Pedido"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Pedidos</title>
    </head>
    <body>
        <h1>Lista Pedidos</h1>
        <%List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");%>
        <table border="1">
            
            <thead>
                
                <tr>
                    <th>ID</th>
                    <th>Nome Cliente</th>
                    <th>Email do Cliente</th>
                    <th>Telefone do cliente</th>
                    <th>Endereco</th>
                    <th>ValorFinal<th>
                </tr>
                
            </thead>
            <tbody>
                <% for(Pedido p : pedidos){%>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getClienteNome()%></td>
                    <td><%=p.getClienteEmail()%></td>
                    <td><%=p.getClienteTelefone()%></td>
                    <td><%=p.getEnderecoDeEntrega()%></td>
                    <td><%=p.valorTotalPedido()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
