/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author vieir
 */
public class ItemPedido {
    
    private Long id;
    private Integer quantidade;
    private Produto produto;
    private List<Produto> adicionais = new ArrayList<>();
    
    public void addAdicional(Produto adicional) {
        adicionais.add(adicional);
    }
    
    public double valorTotal() {
        double valorProdutoMaisAdicionais = produto.getValor() + precoTotalAdicionais();
        return  valorProdutoMaisAdicionais;
    }
    
    private double precoTotalAdicionais() {
        double soma = 0.0;
        for(Produto adicional : adicionais) {
            soma += adicional.getValor();
        }
        return soma;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public List<Produto> getAdicionais() {
        return adicionais;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 61 * hash + Objects.hashCode(this.id);
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
        final ItemPedido other = (ItemPedido) obj;
        return Objects.equals(this.id, other.id);
    }

    @Override
    public String toString() {
        return "ItemPedido{" + "id=" + id + ", quantidade=" + quantidade + ", produto=" + produto + ", adicionais=" + adicionais + '}';
    }
    
    
}
