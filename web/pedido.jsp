<%-- 
    Document   : empregadoView
    Created on : 17 de fev. de 2023, 10:19:17
    Author     : vieir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Pedido"%>
<%@page import="model.ItemPedido"%>
<%@page import="model.Produto"%>
<%@page import="model.Adicional"%>
<%@page import="model.Lanche"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido de lanches</title>
        <link rel="stylesheet" href="pedido.css">
    </head>
    <body>
        <%List<Lanche> lanches = (List<Lanche>) request.getAttribute("lanches");%>
        <%List<Adicional> adicionais = (List<Adicional>) request.getAttribute("adicionais");%>
        
        
        <form action="TesteServlet" method="POST">
                <div id="lanche-1">
                    <div class="input-group">
                        <label for="lanche-1-select">Selecione o lanche:</label>
                        <div class="lanches">
                            <% for(Lanche l: lanches){%>
                            <input type="radio" name="pedi" id="<%=l.getId()%>">
                            <label for="<%=l.getId()%>"><%=l.getNome()%></label>
                            <div class="descri">
                                <label for="<%=l.getId()%>"><%=l.getDescricao()%></label>
                            </div>
                            <%}%>
                        </div>
                        <input type="hidden" id="lanche-1-nome" name="lanche-1-nome">
                    </div>

                    <div class="input-group">
                        <label>Selecione os adicionais:</label><br>
                        <div id="adicionais-1">
                            
                            <% for(Adicional a: adicionais){%>
                                
                                <input type="checkbox" name="pedi" id="<%=a.getId()%>">
                                <label for="<%=a.getId()%>"><%=a.getNome()%></label>
                            <%}%>
                            <input type="checkbox" name="pedi" id="nenhum">
                            <label for="nenhum">Nenhum</label>
                        </div>
                    </div>

                    <button type="button" class="btn add-lanche">Adicionar outro lanche</button>
                    <button type="button" class="btn remover-lanche" style="display: none;">Remover lanche</button>
                </div>

                <button type="submit" class="btn">Finalizar pedido</button>
            </form>
        <script>
            
        </script>
        
</body>
</html>
