/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database.dao;

import database.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Adicional;
import model.Endereco;
import model.ItemPedido;
import model.Lanche;
import model.Pedido;

/**
 *
 * @author vieir
 */
public class PedidoDao {
    
    private Connection conn = null;
    
    private String SELECT_ALL_Pedidos = "SELECT\n" 
            + "	   p.id as pedido_id, p.cliente_email, p.cliente_nome, p.cliente_telefone, p.data_pedido,\n" 
            + "    e.id as endereco_id, e.bairro, e.numero, e.rua, e.complemento,\n" 
            + "    ip.id as item_pedido_id, ip.quantidade as item_pedido_qtd,\n" 
            + "    l.id as lanche_id, l.nome as lanche_nom, l.valor as lanche_valor, l.descricao as lanche_descricao,\n" 
            + "    a.id as adicional_id, a.nome as adicional_nome,  a.valor as adicional_valor\n" 
            + "FROM pedido AS p\n" 
            + "	INNER JOIN endereco AS e ON (p.endereco_id_fk = e.id)\n" 
            + "    INNER JOIN pedido_item_pedido AS pip ON (p.id = pip.pedido_id_fk)\n" 
            + "    INNER JOIN item_pedido AS ip ON (pip.titem_pedido_id_fk = ip.id)\n" 
            + "    INNER JOIN lanche AS l on (ip.lanche_id_fk = l.id)\n" 
            + "    LEFT JOIN lanche_adicional AS la on (l.id = la.lanche_id_fk)\n" 
            + "    LEFT JOIN adicional AS a on (la.adicional_id_fk = a.id);"; 
    
    public List<Pedido> findAll() {
        Map<Long, Pedido> pedidos = new LinkedHashMap<>();
        
        try {
            
            conn = DB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_Pedidos);
            ResultSet rs = preparedStatement.executeQuery();
            
            
            while(rs.next()) {
                
                Long produto_id = rs.getLong("pedido_id");
                System.out.println(produto_id);
                Pedido p = null;
                if(!pedidos.containsKey(produto_id)) {
                   
                    p = new Pedido();
                    p.setId(produto_id);
                    p.setClienteNome(rs.getString("cliente_nome"));
                    p.setClienteEmail(rs.getString("cliente_email"));
                    p.setClienteTelefone(rs.getString("cliente_telefone"));
                    Endereco endereco = intanciarEndereco(rs, conn);
                    ItemPedido itemPedido = instanciarItemPedido(rs, conn);
                    p.setEnderecoDeEntrega(endereco);
                    p.addItemPedido(itemPedido);
                    pedidos.put(produto_id, p);
                    
                }else {
                   pedidos.get(produto_id).addItemPedido(instanciarItemPedido(rs, conn));
                }
                 
            }
            
        }catch(SQLException e) {
            printSQLException(e);
        }
        
        return new ArrayList<>(pedidos.values());
        
    }
    
    private Endereco intanciarEndereco(ResultSet rs, Connection conn) throws SQLException {
        
        Endereco endereco = new Endereco();
        endereco.setId(rs.getLong("endereco_id"));
        endereco.setBairro(rs.getString("bairro"));
        endereco.setNumero(rs.getString("numero"));
        endereco.setRua(rs.getString("rua"));
        endereco.setComplemento(rs.getString("complemento"));
        
        return endereco;
    }
    
    private ItemPedido instanciarItemPedido(ResultSet rs, Connection conn) throws SQLException {
        
        ItemPedido itemPedido = new ItemPedido();
        itemPedido.setId(rs.getLong("item_pedido_id"));
        itemPedido.setQuantidade(rs.getInt("item_pedido_qtd"));
        Lanche lanche = instanciarLanche(rs, conn);
        itemPedido.setProduto(lanche);
        return itemPedido;
        
    }
    
    private Lanche instanciarLanche(ResultSet rs, Connection conn) throws SQLException {
        Lanche lanche = new Lanche();
        
        lanche.setId(rs.getLong("lanche_id"));
        lanche.setNome(rs.getString("lanche_nom"));
        lanche.setValor(rs.getDouble("lanche_valor"));
        lanche.setDescricao(rs.getString("lanche_descricao"));
        Adicional adicional = instanciarAdicional(rs, conn);
        if(adicional != null) {
            lanche.addAdicional(adicional);
        } 
        return lanche;
    }
    
    private Adicional instanciarAdicional(ResultSet rs, Connection conn) throws SQLException {
        if(rs.getString("adicional_id") == null) return null;
        Adicional adicional = new Adicional();
        
        adicional.setId(rs.getLong("adicional_id"));
        adicional.setNome(rs.getString("adicional_nome"));
        adicional.setValor(rs.getDouble("adicional_valor"));
        
        return adicional;
    }
    
    private void printSQLException(SQLException ex) {
        for(Throwable e : ex) {
            if(e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while(t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
}
