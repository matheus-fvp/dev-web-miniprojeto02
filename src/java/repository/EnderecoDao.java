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
import model.Endereco;

/**
 *
 * @author vieir
 */
public class EnderecoDao {
    
    private String INSERT_Endereco_SQL = "INSERT INTO endereco" 
            + " (bairro, rua, numero, complemento) values" 
            + " (?, ?, ?, ?)";
    
    public void save(Endereco endereco) {
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement statement = conn.prepareStatement(INSERT_Endereco_SQL, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, endereco.getBairro());
            statement.setString(2, endereco.getRua());
            statement.setString(3, endereco.getNumero());
            statement.setString(4, endereco.getComplemento());
            
            //verifica se a inserção ocorreu 
            int linhasAfetadas = statement.executeUpdate();
            
            if(linhasAfetadas > 0) {
                ResultSet rs = statement.getGeneratedKeys();
                if(rs.next()) {
                    Long id = rs.getLong(1);
                    endereco.setId(id);
                }else {
                    throw new RuntimeException("Erro ao inserir o objrto");
                }
                rs.close();
            }
            statement.close();
            
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally{
            DB.closeConnection();
        }
    }
            
            
    
}
