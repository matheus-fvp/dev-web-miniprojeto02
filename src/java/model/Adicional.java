/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vieir
 */
public class Adicional extends Produto{

    @Override
    public Double valorFinal() {
        return getValor();
    }
    
}