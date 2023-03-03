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
        <link rel="stylesheet" href="teste.css">
    </head>
    <body>
        <form action="TesteServlet" method="POST">
        <h1>Lista Pedidos</h1>
        <button type="submit" name="RecarregarConsulta" class="recarregarButton" value="recarregar">Recarregar Visualização</button>
        <%List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");%>
        <table border="1">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Nome Cliente</th>
                    <th>Ver mais detalhes do Pedido</th>
                </tr>

            </thead>
            <tbody class="table">
                <% for(Pedido p : pedidos){%>
                <tr class="table">
                    <td id=<%=p.getId()%>><%=p.getId()%></td>
                    <td><%=p.getClienteNome()%></td>
                    <td><button type="submit" name="DetalhesPedido" class="button" value="<%=p.getId()%>">Ver Mais</button></td>
                </tr>
              </form>
            <%}%>
        </tbody>
    </table>
</body>
</html>
