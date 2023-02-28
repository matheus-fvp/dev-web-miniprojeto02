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
import model.Adicional;

/**
 *
 * @author vieir
 */
public class AdicionalDao {
    
    private String SELECT_ALL_Adicionais = "SELECT * FROM adicional;";
    
    public List<Adicional> findAll() {
        List<Adicional> adicionais = new ArrayList<>();
        
        try {
            
            Connection conn = DB.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_Adicionais);
            ResultSet rs = preparedStatement.executeQuery();
            
            
            while(rs.next()) {
                Adicional a = new Adicional();
                adicionais.add(a);
                
                a.setId(rs.getLong("id"));
                a.setValor(rs.getDouble("valor"));
                a.setNome(rs.getString("nome"));
                 
            }
            preparedStatement.close();
            rs.close();
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }finally {
            DB.closeConnection();
        }
        return adicionais;
    }
    
}
