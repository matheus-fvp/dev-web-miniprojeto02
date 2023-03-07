/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/**
 Função para enviar uma requisição ao servlet a cada 20 segundos, receber os dados do BD que serão consultados na hora
 pelo servlet, tratar esses dados e inserir eles no HTML, tendo uma atualização automática da visualização dos dados
 **/
setInterval(function recarregarAjax() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/trabalhoweb/ControllerPedidos");

    //Configurando Conexão em form para o servlet
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.onreadystatechange = function () {
        //Se a request funcionar, vai retornar os códigos abaixo em readyState e Status
        if (this.readyState === 4 && this.status === 200) {

            /**
             Os dados são serializados em json no servlet, necessário fazer o parse para
             converter os dados em array e inserir eles no html depois disso
             **/
            let dados = JSON.parse(this.responseText);

            //Query para pegar o corpo da tabela e zerar o conteúdo dela
            let table = document.querySelector('.table');
            table.innerHTML = '';

            //A tabela terá conteúdos sendo inseridos a partir do response do servlet, na ordem correta dos pedidos
            for (let i = 0; i < dados.length; i++) {

                /**
                 Cada elemento tr abaixo contém um pedido sendo inserido, com inicialmente o ID,
                 nome e botão para ver mais detalhes
                 **/
                const tableContent = document.createElement('tr');
                tableContent.classList.add("table-content");

                const tdId = document.createElement('td');
                tdId.setAttribute("id", i);
                const textTdId = document.createTextNode(i);
                tdId.appendChild(textTdId);

                const tdNomeCliente = document.createElement('td');
                const textNomeCliente = document.createTextNode(dados[i].clienteNome);
                tdNomeCliente.appendChild(textNomeCliente);


                const tdButton = document.createElement('td');
                const buttonDetalhes = document.createElement('button');
                buttonDetalhes.setAttribute('type', 'submit');
                buttonDetalhes.setAttribute('name', 'DetalhesPedido');
                buttonDetalhes.classList.add("button");
                buttonDetalhes.setAttribute('value', i);

                const buttonDetalhesText = document.createTextNode("Ver Mais");
                buttonDetalhes.appendChild(buttonDetalhesText);
                tdButton.appendChild(buttonDetalhes);

                //Ao final, todos os elementos de conteúdo são adicionados na linha de conteúdo e as linhas na tabela
                tableContent.appendChild(tdId);
                tableContent.appendChild(tdNomeCliente);
                tableContent.appendChild(tdButton);
                table.appendChild(tableContent);
            }
        }
    };
    /**
     Parâmetro de request para o ajax enviar ao servlet, serve para o servlet identificar qual fluxo
     seguir e qual response será retornado
     **/
    xhttp.send('RecarregarAjax=recarregar');
}, 20000);

