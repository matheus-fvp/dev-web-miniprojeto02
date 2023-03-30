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
        <link rel="stylesheet" href="VisualizarPedidos.css">
        <!--<script src="ajaxReload.js"></script>-->
    </head>
    <body>
        <form action="ControllerPedidos" method="POST">
            <h1>Lista Pedidos</h1>

            <%--O botão abaixo faz com que o servlet faça uma nova consulta no BD e retorne os dados atualizados --%>
            <button type="submit" name="RecarregarConsulta" class="recarregarButton" value="recarregar">Recarregar Visualização Manualmente</button>
            <br/><br/>

            <%List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidos");%>
            <table border="1">
                <thead>
                    <tr>
                        <%--Demais dados do Pedido serão mostrados na página de "Ver Mais" --%>
                        <th>ID</th>
                        <th>Nome do Cliente</th>
                        <th>Ver mais detalhes do Pedido</th>
                    </tr>

                </thead>
                <tbody class="table">
                    <% for(int i=0;i<pedidos.size();i++){%>
                    <tr class="table-content">
                        <%
                        /**
                           Id da célula Td abaixo é usado para identificar se os pedidos estão sendo visualizados
                         * de acordo com a ordem de inserção feita no banco de dados. 
                         * Como a consulta utilizada pelo BD contém um Order By(Consulta SELECT_ALL_Pedidos
                         * do arquivo Repository.PedidoDao), então podemos usar tanto o índice i do For acima
                         * quanto o método getID do Pedido, pois os valores serão os mesmos a serem retornados
                         * - Requisito do projeto.
                        **/
                        %>
                        <td id=<%=i%>><%=i%></td>
                        <%
                        /**
                           É possível pegar todos os outros parâmetros do pedido guardados no BD, porém, para a 
                           * visualização ficar mais simples, está sendo mostrado apenas ID do pedido e Nome, a
                           * visualização completa dos dados, poderá ser vista ao clicar no botão "Ver Mais".
                        **/
                        %>
                        <td><%=pedidos.get(i).getClienteNome()%></td>
                        <%
                        /**
                           O Botão abaixo recebe como valor o Id do Pedido para que seja enviado ao Servlet,
                           * que guardou as informações completas retornadas pela chamada do VisualizarPedidos.jsp no
                           * arquivo index.html, essa estratégia foi usada pelo grupo para que não seja feita uma nova
                           * consulta no BD se o funcionário apenas quiser ver mais detalhes do pedido, pois com a mesma
                           * consulta,é possível pegar todos os dados de uma só vez e utilizar quando for melhor.
                           * 
                           * Como é uma estratégia apenas a função de Ver Mais Detalhes, não há impactos na inserção
                           * ou atualização automática dos pedidos, em resumo, as páginas VisualizarPedidos.jsp e
                           * MaisDetalhes.jsp, compartilham os mesmos dados sem a necessidade de uma segunda consulta
                           * ao BD na transição de uma página para outra.
                        **/
                        %>
                        <td><button type="submit" name="DetalhesPedido" class="button" value="<%=i%>">Ver Mais</button></td>
                    </tr>
                    </form>
                    <%}%>
                </tbody>
            </table>
    </body>
</html>
