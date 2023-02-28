/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author vieir
 */
public class Lanche extends Produto {
    
    private String descricao;
    
    private List<Produto> adicionais = new ArrayList<>();

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<Produto> getAdicionais() {
        return adicionais;
    } 
    
    public void addAdicional(Produto adicional) {
        adicionais.add(adicional);
    }

    @Override
    public Double valorFinal() {
        Double valorTotal = 0.0;
        Iterator<Produto> adicioanisIterator = this.adicionais.iterator();
        while(adicioanisIterator.hasNext()) {
            valorTotal += adicioanisIterator.next().getValor();
        }
        
        return valorTotal + this.getValor();
    }

    @Override
    public String toString() {
        return "Lanche{" + "descricao=" + descricao + ", adicionais=" + adicionais + '}';
    }
    
    
    
}
