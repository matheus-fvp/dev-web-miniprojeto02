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
import java.util.ArrayList;
import java.util.List;
import model.Lanche;

/**
 *
 * @author vieir
 */
public class LancheDao {
    
    private String SELECT_ALL_Lanches = "SELECT * FROM lanche;";
    
    public List<Lanche> findAll() {
        List<Lanche> lanches = new ArrayList<>();
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_Lanches);
            ResultSet rs = preparedStatement.executeQuery();
            
            
            while(rs.next()) {
                Lanche l = new Lanche();
                lanches.add(l);
                
                l.setId(rs.getLong("id"));
                l.setValor(rs.getDouble("valor"));
                l.setDescricao(rs.getString("descricao"));
                l.setNome(rs.getString("nome"));
                 
            }
            preparedStatement.close();
            rs.close();
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally {
            DB.closeConnection();
        }
        return lanches;
    }
    
}
