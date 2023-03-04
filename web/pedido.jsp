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
                            <input type="radio" name="lanche" id="<%=l.getId()%>">
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
                                
                                <input type="checkbox" name="adicionais" id="<%=a.getId()%>">
                                <label for="<%=a.getId()%>"><%=a.getNome()%></label>
                            <%}%>
                            
                        </div>
                    </div>

                    <button id="adicionar-lanche">Adicionar Lanche</button>
                    <button id="enviar-pedido">Enviar Pedido</button>
                </div>
            </form>
            <script>
              const form = document.querySelector('form');
              const adicionarLancheBtn = document.querySelector('#adicionar-lanche');
              const enviarPedidoBtn = document.querySelector('#enviar-pedido');
              let lanches = [];
              

              adicionarLancheBtn.addEventListener('click', function(event) {
                event.preventDefault(); // previne o comportamento padrão do botão

                const lanche = document.querySelector('#lanche').value;
                const adicionais = [];
                const checkboxes = document.querySelectorAll('input[name="adicionais"]:checked');
                checkboxes.forEach(function(checkbox) {
                  adicionais.push(checkbox.value);
                });

                lanches.push({
                  lanche: lanche,
                  adicionais: adicionais
                });

                form.reset();
                renderLanches();
              });

              enviarPedidoBtn.addEventListener('click', function(event) {
                event.preventDefault(); // previne o comportamento padrão do botão

                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                  if (this.readyState === 4 && this.status === 200) {
                    console.log(this.responseText);
                  }
                };
                xhttp.open('POST', '/link do servlet');
                xhttp.setRequestHeader('Content-type', 'application/json');
                xhttp.send(JSON.stringify(lanches));
              });

              function renderLanches() {
                const lanchesDiv = document.querySelector('#lanches');
                lanchesDiv.innerHTML = '';
                lanches.forEach(function(lanche, index) {
                  const lancheDiv = document.createElement('div');
                  lancheDiv.innerHTML = `
                    <h3>Lanche ${index + 1}</h3>
                    <p><strong>Lanche:</strong> ${lanche.lanche}</p>
                    <p><strong>Adicionais:</strong> ${lanche.adicionais.join(', ')}</p>
                  `;
                  lanchesDiv.appendChild(lancheDiv);
                });
              }
            </script>
        <script>
            
        </script>
        
</body>
</html>
