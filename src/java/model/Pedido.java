/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author vieir
 */
public class Pedido {
    
    private Long id;

    private LocalDateTime dataPedido = LocalDateTime.now();

    private String clienteNome;

    private String clienteEmail;

    private String clienteTelefone;

    private Endereco enderecoDeEntrega;

    private List<ItemPedido> lanches = new ArrayList<>(); 
    
    public double valorTotalPedido() {
        double soma = 0.0;
        for(ItemPedido itemPedido : lanches) {
            soma += itemPedido.valorTotal();
        }
        return soma;
    }
    
    public void addItemPedido(ItemPedido  itemPedido) {
        lanches.add(itemPedido);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(LocalDateTime dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getClienteNome() {
        return clienteNome;
    }

    public void setClienteNome(String clienteNome) {
        this.clienteNome = clienteNome;
    }

    public String getClienteEmail() {
        return clienteEmail;
    }

    public void setClienteEmail(String clienteEmail) {
        this.clienteEmail = clienteEmail;
    }

    public String getClienteTelefone() {
        return clienteTelefone;
    }

    public void setClienteTelefone(String clienteTelefone) {
        this.clienteTelefone = clienteTelefone;
    }

    public Endereco getEnderecoDeEntrega() {
        return enderecoDeEntrega;
    }

    public void setEnderecoDeEntrega(Endereco enderecoDeEntrega) {
        this.enderecoDeEntrega = enderecoDeEntrega;
    }

    public List<ItemPedido> getLanches() {
        return lanches;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 11 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pedido other = (Pedido) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "Pedido{" + "id=" + id + ", dataPedido=" + dataPedido + ", clienteNome=" + clienteNome + ", clienteEmail=" + clienteEmail + ", clienteTelefone=" + clienteTelefone + ", enderecoDeEntrega=" + enderecoDeEntrega + ", lanches=" + lanches + '}';
    }
    
    
}
