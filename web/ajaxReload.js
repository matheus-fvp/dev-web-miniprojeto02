/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

setInterval(function recarregarAjax() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/trabalhoweb/ControllerPedidos");
    xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let dados = JSON.parse(this.responseText);
            let table = document.querySelector('.table');
            table.innerHTML = '';

            for (let i = 0; i < dados.length; i++) {

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

                tableContent.appendChild(tdId);
                tableContent.appendChild(tdNomeCliente);
                tableContent.appendChild(tdButton);
                table.appendChild(tableContent);
            }
        }
    };

    xhttp.send('RecarregarAjax=recarregar');
}, 20000);

