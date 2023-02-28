/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import database.DB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
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
    
    private String INSERT_Pedido_SQL = "INSERT INTO pedido" 
            + " (cliente_nome, cliente_email, cliente_telefone, data_pedido, endereco_id_fk)" 
            + " values (?, ?, ?, ?, ?);";
    private String INSERT_Pedido_Item_Pedido_SQL = "INSERT INTO pedido_item_pedido" 
            + "(pedido_id_fk, titem_pedido_id_fk) values (?, ?);";
    
    private String SELECT_BY_ID_Pedido = "SELECT\n" 
            + "	   p.id as pedido_id, p.cliente_email, p.cliente_nome, p.cliente_telefone, p.data_pedido,\n" 
            + "    e.id as endereco_id, e.bairro, e.numero, e.rua, e.complemento,\n" 
            + "    ip.id as item_pedido_id, ip.quantidade as item_pedido_qtd,\n" 
            + "    l.id as lanche_id, l.nome as lanche_nome, l.valor as lanche_valor, l.descricao as lanche_descricao,\n" 
            + "    a.id as adicional_id, a.nome as adicional_nome,  a.valor as adicional_valor\n" 
            + "FROM pedido AS p\n" 
            + "	INNER JOIN endereco AS e ON (p.endereco_id_fk = e.id) AND p.id = ?\n" 
            + "    INNER JOIN pedido_item_pedido AS pip ON (p.id = pip.pedido_id_fk)\n" 
            + "    INNER JOIN item_pedido AS ip ON (pip.titem_pedido_id_fk = ip.id)\n" 
            + "    INNER JOIN lanche AS l on (ip.lanche_id_fk = l.id)\n" 
            + "    LEFT JOIN item_pedido_adicional AS ipa on (ip.id = ipa.item_pedido_id_fk)\n" 
            + "    LEFT JOIN adicional AS a on (ipa.adicional_id_fk = a.id)";
    
    private String SELECT_ALL_Pedidos = "SELECT\n" 
            + "	   p.id as pedido_id, p.cliente_email, p.cliente_nome, p.cliente_telefone, p.data_pedido,\n" 
            + "    e.id as endereco_id, e.bairro, e.numero, e.rua, e.complemento,\n" 
            + "    ip.id as item_pedido_id, ip.quantidade as item_pedido_qtd,\n" 
            + "    l.id as lanche_id, l.nome as lanche_nome, l.valor as lanche_valor, l.descricao as lanche_descricao,\n" 
            + "    a.id as adicional_id, a.nome as adicional_nome,  a.valor as adicional_valor\n" 
            + "FROM pedido AS p\n" 
            + "	INNER JOIN endereco AS e ON (p.endereco_id_fk = e.id)\n" 
            + "    INNER JOIN pedido_item_pedido AS pip ON (p.id = pip.pedido_id_fk)\n" 
            + "    INNER JOIN item_pedido AS ip ON (pip.titem_pedido_id_fk = ip.id)\n" 
            + "    INNER JOIN lanche AS l on (ip.lanche_id_fk = l.id)\n" 
            + "    LEFT JOIN item_pedido_adicional AS ipa on (ip.id = ipa.item_pedido_id_fk)\n" 
            + "    LEFT JOIN adicional AS a on (ipa.adicional_id_fk = a.id)"; 
    
    
    public void save(Pedido pedido) {
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement statement = conn.prepareStatement(INSERT_Pedido_SQL, 
                    Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, pedido.getClienteNome());
            statement.setString(2, pedido.getClienteEmail());
            statement.setString(3, pedido.getClienteTelefone());
            statement.setTimestamp(4, Timestamp.valueOf(pedido.getDataPedido()));
            statement.setLong(5, pedido.getEnderecoDeEntrega().getId());
            
            //verifica se a inserção ocorreu 
            int linhasAfetadas = statement.executeUpdate();
            
            if(linhasAfetadas > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if(rs.next()) {
                    Long id = rs.getLong(1);
                    pedido.setId(id);
                }else {
                    throw new RuntimeException("Erro ao inserir o objrto");
                }
                rs.close();
            }
            statement.close();
            statement = conn.prepareStatement(INSERT_Pedido_Item_Pedido_SQL);
            for(ItemPedido itemPedido : pedido.getLanches()) {
                statement.setLong(1, pedido.getId());
                statement.setLong(2, itemPedido.getId());
                statement.executeUpdate();
            }
            
            statement.close();
            
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally{
            DB.closeConnection();
        }
        
    }
    
    public Pedido findById(Long id) {
        Pedido pedido = null;
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement statement = conn.prepareStatement(SELECT_BY_ID_Pedido);
            statement.setLong(1, id);
            ResultSet rs = statement.executeQuery();
            
            while(rs.next()) {
                if(pedido == null) pedido = new Pedido();
                construirPedido(pedido, rs, conn);
            }
            statement.close();
            rs.close();
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally{
            DB.closeConnection();
        }
        
        return pedido;
        
    }
    
    public List<Pedido> findAll() {
        Map<Long, Pedido> pedidos = new LinkedHashMap<>();
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_Pedidos);
            ResultSet rs = preparedStatement.executeQuery();
            
            
            while(rs.next()) {
                
                Long produto_id = rs.getLong("pedido_id");
                Pedido pedido = null;
                if(!pedidos.containsKey(produto_id)) {
                   
                    pedido = new Pedido();
                    construirPedido(pedido, rs, conn);
                    pedidos.put(produto_id, pedido);
                    
                }else {
                   pedidos.get(produto_id).addItemPedido(instanciarItemPedido(rs, conn));
                }
                 
            }
            rs.close();
            preparedStatement.close();
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally{
            DB.closeConnection();
        }
        
        return new ArrayList<>(pedidos.values());
        
    }
    
    private void construirPedido(Pedido pedido, ResultSet rs, Connection conn) throws SQLException {
        
        pedido.setId(rs.getLong("pedido_id"));
        pedido.setClienteNome(rs.getString("cliente_nome"));
        pedido.setClienteEmail(rs.getString("cliente_email"));
        pedido.setClienteTelefone(rs.getString("cliente_telefone"));
        pedido.setDataPedido(rs.getTimestamp("data_pedido").toLocalDateTime());
        Endereco endereco = intanciarEndereco(rs, conn);
        pedido.setEnderecoDeEntrega(endereco);
        ItemPedido itemPedido = instanciarItemPedido(rs, conn);
        pedido.addItemPedido(itemPedido);
    
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
        Adicional adicional = instanciarAdicional(rs, conn);
        if(adicional != null) {
            itemPedido.addAdicional(adicional);
        } 
        
        return itemPedido;
        
    }
    
    private Lanche instanciarLanche(ResultSet rs, Connection conn) throws SQLException {
        Lanche lanche = new Lanche();
        
        lanche.setId(rs.getLong("lanche_id"));
        lanche.setNome(rs.getString("lanche_nome"));
        lanche.setValor(rs.getDouble("lanche_valor"));
        lanche.setDescricao(rs.getString("lanche_descricao"));
        
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
    
}
