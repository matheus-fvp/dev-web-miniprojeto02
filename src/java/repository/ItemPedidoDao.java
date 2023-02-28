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
import model.ItemPedido;
import model.Produto;

/**
 *
 * @author vieir
 */
public class ItemPedidoDao {
    
    private String INSERT_Item_Pedido_SQL = "INSERT INTO item_pedido" 
            + " (quantidade, lanche_id_fk) values (?, ?)";
    
    private String INSERT_Item_Pedido_Adicional_SQL = "INSERT INTO item_pedido_adicional" +
            " (item_pedido_id_fk, adicional_id_fk) values (?, ?)";
    
    public void save(ItemPedido itemPedido) {
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement statement = conn.prepareStatement(INSERT_Item_Pedido_SQL, Statement.RETURN_GENERATED_KEYS);
            statement.setDouble(1, itemPedido.getQuantidade());
            statement.setLong(2, itemPedido.getProduto().getId());
            
            //verifica se a inserção ocorreu 
            int linhasAfetadas = statement.executeUpdate();
            
            if(linhasAfetadas > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if(rs.next()) {
                    Long id = rs.getLong(1);
                    itemPedido.setId(id);
                }else {
                    throw new RuntimeException("Erro ao inserir o objrto");
                }
                rs.close();
            }
            statement.close();
            statement = conn.prepareStatement(INSERT_Item_Pedido_Adicional_SQL);
            for(Produto adicional : itemPedido.getAdicionais()) {
                statement.setLong(1, itemPedido.getId());
                statement.setLong(2, adicional.getId());
                statement.executeUpdate();
            }
            
            statement.close();
            
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally{
            DB.closeConnection();
        }
        
    }
    
    
}
