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
        <link rel="stylesheet" href="InserirPedidos.css">
    </head>
    <body>
        <%List<Lanche> lanches = (List<Lanche>) request.getAttribute("lanches");%>
        <%List<Adicional> adicionais = (List<Adicional>) request.getAttribute("adicionais");%>


        <form action="ControllerPedidos" method="POST">
            <div id="main">
                <div class="teste">
                    <div class="input-group">
                        <h3>Selecione o lanche:</h3>
                        <div id="lanches">
                            <% for(Lanche l: lanches){%>
                            <div class="radio-pedido">
                                <%--Apenas o ID do lanche é necessário para o servlet adicionar as demais informações no BD --%>
                                <input type="radio" name="lanche" id="lanche-<%=l.getId()%>" value="<%=l.getId()%>">
                                <label for="lanche-<%=l.getId()%>"><%=l.getNome()%></label>
                            </div>
                            <div class="descri">
                                <label for="<%=l.getId()%>"><%=l.getDescricao()%></label>
                            </div>
                            <%}%>
                        </div>

                    </div>

                    <div class="input-group">
                        <h3>Selecione os adicionais:</h3><br>
                        <div id="adicionais-1">

                            <% for(Adicional a: adicionais){%>

                            <div>
                                <%--Apenas o ID do adicional é necessário para o servlet adicionar as demais informações no BD --%>
                                <input type="checkbox" name="adicionais" id="adicional-<%=a.getId()%>" value="<%=a.getId()%>">
                                <label for="adicional-<%=a.getId()%>"><%=a.getNome()%></label>
                            </div>
                            <%}%>

                        </div>
                    </div>
                </div>

                <br/>
                <div>
                    <button id="adicionar-lanche">Adicionar Lanche</button>
                    <button id="remover-lanche">Remover último lanche adicionado</button>
                </div>
                <div class="endereco">
                    <h3>Coloque aqui seus dados pessoais:</h3>
                    * Nome:<input type="text" id="nome">
                    * Email:<input type="text" id="email">
                    * Telefone:<input type="text" id="telefone">
                    * Rua:<input type="text" id="rua">
                    * Número:<input type="text" id="numero">
                    * Bairro:<input type="text" id="bairro">
                    Complemento: (Deixe vazio se não houver um):<input type="text" id="complemento">
                </div>
                <button type="submit" id="enviar-pedido" name="enviar-pedido" value="Submeter">Enviar Pedido</button>

                <%--Elemento hidden onde o servlet irá pegar as informações do pedido submetido --%>
                <input type="hidden" id="pedido-enviado" name="pedido-enviado">
            </div>
        </form>
        <script>
            const form = document.querySelector('form');
            const adicionarLancheBtn = document.querySelector('#adicionar-lanche');
            const removerLancheBtn = document.querySelector('#remover-lanche');

            let pedido = [];
            let teste = ['teste'];

            //your comment
            adicionarLancheBtn.addEventListener('click', function (event) {
                event.preventDefault(); // previne o comportamento padrão do botão

                //Pegando o lanche marcado
                const lanche = document.querySelector('input[name="lanche"]:checked');

                if (lanche !== null) {

                    //Limpando a seleção de lanches
                    lanche.checked = false;
                    const lancheId = lanche.value;
                    var lancheTitulo = document.querySelector('label[for=\'lanche-' + lancheId + '\']').innerHTML;

                    const adicionaisId = [];
                    const adicionaisTitulo = [];
                    const checkboxes = document.querySelectorAll('input[name="adicionais"]:checked');
                    checkboxes.forEach(function (checkbox) {
                        adicionaisId.push(checkbox.value);
                        adicionaisTitulo.push(document.querySelector('label[for=\'adicional-' + checkbox.value + '\']').innerHTML);
                        checkbox.checked = false;
                    });
                    /**
                     Os atributos lancheTitulo e adicionaisTitulo estão sendo usados apenas para ter uma
                     melhor visualização do pedido na própria página, o servlet não estará usando estes atributos
                     **/

                    pedido.push({
                        lancheId: lancheId,
                        lancheTitulo: lancheTitulo,
                        adicionaisId: adicionaisId,
                        adicionaisTitulo: adicionaisTitulo
                    });

                    //Faz a rendereização do pedido na página de inserção, para o cliente saber o que pediu
                    renderLanches(pedido);
                    alert("Lanche adicionado!");
                } else {
                    //Um pedido deve conter ao menos 1 lanche adicionado, não pode ter apenas adicionais
                    alert("Você não escolheu um lanche para ser adicionado, tente novamente");
                }


            });


            //A ação de remoção do lanche remove o último lanche adicionado pelo cliente antes da confirmação do pedido
            removerLancheBtn.addEventListener('click', function (event) {
                event.preventDefault(); // previne o comportamento padrão do botão
                if (pedido.length === 0)
                    alert('Você não tem um lanche adicionado ainda, para fazer essa ação, por favor, adicione um lanche em sua compra primeiro.');
                else {
                    pedido.pop();
                    renderLanches(pedido);
                    alert("Lanche removido!");
                }
            });

            form.addEventListener('submit', function () {
                if (pedido.length === 0) {
                    //Um cliente deve fazer um pedido com ao menos 1 lanche adicionado
                    alert('Você não tem um lanche adicionado ainda, para fazer essa ação, por favor, adicione um lanche em sua compra primeiro.');
                    event.preventDefault();
                }
                //Faz o tratamento dos dados a serem enviados para o servlet e empacota eles em um objeto JSON
                else {
                    //Dados pessoais do cliente
                    let nome = document.querySelector("#nome").value;
                    let email = document.querySelector("#email").value;
                    let telefone = document.querySelector("#telefone").value;

                    //Endereço 
                    let rua = document.querySelector("#rua").value;
                    let numero = document.querySelector("#numero").value;
                    let bairro = document.querySelector("#bairro").value;
                    let complemento = document.querySelector("#complemento").value; //Opcional de ser preenchido

                    //Se algum dos campos necessários estiver vazio, o pedido não pode ser feito
                    if (nome === '' || email === '' || telefone === '' || rua === '' || numero === '' || bairro === '') {
                        alert("Preencha os campos necessários dos seus dados pessoais");
                        event.preventDefault();
                    } else {
                        pedido.push({
                            nome: nome,
                            email: email,
                            telefone: telefone,
                            rua: rua,
                            numero: numero,
                            bairro: bairro,
                            complemento: complemento
                        });

                        //Conversão do pedido em um objeto JSON
                        let jsonPedido = JSON.stringify(pedido);
                        //O objeto é adicionado num elemento Hidden da página para ser enviado ao servlet
                        document.querySelector("#pedido-enviado").value = jsonPedido;
                        alert("Pedido enviado");
                    }

                }
            });

            //Função para renderizar os pedidos adicionados na tela do cliente antes da compra
            function renderLanches(pedidoLanches) {
                const lanchesDiv = document.querySelector('#main');

                let pedidoAtual = document.querySelector('.pedidoAtual');
                //Este If verifica se há algum pedido já renderizado, caso não haja, é criado uma div para acomodar os produtos
                if (pedidoAtual === null) {
                    pedidoAtual = document.createElement('div');
                    pedidoAtual.classList.add("pedidoAtual");
                }
                //Caso exista um produto já renderizado, a div deve ser limpada antes, para não duplicar os dados
                else
                    pedidoAtual.innerHTML = '';

                //Cada lanche adicionado no pedido será renderizado abaixo
                pedidoLanches.forEach(function (lanche, index) {

                    const h3 = document.createElement('h3');
                    const textH3 = document.createTextNode("Lanche número: " + (index + 1));
                    h3.appendChild(textH3);

                    const p = document.createElement('p');
                    const textP = document.createTextNode("Lanche: " + lanche.lancheTitulo);
                    p.appendChild(textP);


                    const p2 = document.createElement('p');
                    const textP2 = document.createTextNode("Adicionais: " + lanche.adicionaisTitulo.join(', '));
                    p2.appendChild(textP2);

                    const br = document.createElement("br");

                    pedidoAtual.appendChild(h3);
                    pedidoAtual.appendChild(p);
                    pedidoAtual.appendChild(p2);
                    pedidoAtual.appendChild(br);

                });
                lanchesDiv.appendChild(pedidoAtual);
            }
        </script>
    </body>
</html>
