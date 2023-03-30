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
import java.util.List;
import model.Usuario;

/**
 *
 * @author vieir
 */
public class UsuarioDao {
    
    private Connection conn;

    public UsuarioDao(Connection conn) {
        this.conn = conn;
    }
    
    public Usuario findByUserName(String userName) {
        String find_by_query = "SELECT * FROM user WHERE username = ?";
        Usuario usuario = null;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(find_by_query);
            preparedStatement.setString(1, userName);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                if(usuario == null) usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setUserName(rs.getString("username"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSessionId(rs.getString("session_id"));
                usuario.setPassword(rs.getString("password"));
            }
            
        }catch(SQLException e) {
            DB.printSQLException(e);
        }
        return usuario;
        
    }
    
    public List<Usuario> findAll() {
        return null;
    }
    
    public void save(Usuario usuario) {
        String sql_save = "INSERT INTO user(username, email, session_id) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql_save);
            ps.setString(1, usuario.getUserName());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSessionId());
        }catch(SQLException e) {
            DB.printSQLException(e);
        }
    }
    
    public void update(Usuario usuario) {
        String sql_update = "UPDATE user " +
                "SET username = ?, email = ?, password = ?, session_id = ? " +
                "WHERE id = ?";
        try {
            System.out.println(usuario);
           PreparedStatement ps = conn.prepareStatement(sql_update);
           ps.setString(1, usuario.getUserName());
           ps.setString(2, usuario.getEmail());
           ps.setString(3, usuario.getPassword());
           ps.setString(4, usuario.getSessionId());
           ps.setInt(5, usuario.getId());
           int executeUpdate = ps.executeUpdate();
        }catch(SQLException e) {
            DB.printSQLException(e);
        }
    }
    
     
    
    
}
