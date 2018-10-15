/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import com.ufpr.tads.web2.beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Itay
 */
public class UsuarioDAO {
    
    private Connection con;

    public UsuarioDAO() throws SQLException, ClassNotFoundException {
        this.con = ConnectionFactory.getConnection();
    }
    
    public Usuario selectUsuarioEspecifico(String login, String senha) throws SQLException {

        String sql = "SELECT * FROM tb_usuario WHERE login_usuario = (?) AND senha_usuario = (?) LIMIT 1;";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, login);
        st.setString(2, senha);

        ResultSet rs = st.executeQuery();
        Usuario usuario = new Usuario();

        while (rs.next()) {
            usuario.setId_usuario(rs.getInt(1));
            usuario.setLogin_usuario(rs.getString(2));
            usuario.setSenha_usuario(rs.getString(3));
            usuario.setNome_usuario(rs.getString(4));
            return usuario;
        }
        return null;
    }
        
    public List<Usuario> selectUsuario() throws SQLException {
        
        List<Usuario> resultados = new ArrayList<>();
        
        String sql = "SELECT * FROM tb_usuario";
        PreparedStatement st = con.prepareStatement(sql);
        
        ResultSet rs = st.executeQuery();
        
        while (rs.next()) {
            Usuario usuario = new Usuario();
            usuario.setId_usuario(rs.getInt("id_usuario"));
            usuario.setLogin_usuario(rs.getString("login_usuario"));
            usuario.setSenha_usuario(rs.getString("senha_usuario"));
            usuario.setNome_usuario(rs.getString("nome_usuario"));
            resultados.add(usuario);
        }
        return resultados;
    }
    
    public void insertUsuario(Usuario usuario) throws SQLException {
        
        String sql = "INSERT INTO tb_usuario (nome_usuario, login_usuario, senha_usuario) VALUES ((?), (?), (?))";
        PreparedStatement st = con.prepareStatement(sql);
        
        st.setString(1, usuario.getNome_usuario());
        st.setString(2, usuario.getLogin_usuario());
        st.setString(3, usuario.getSenha_usuario());
        st.executeUpdate();
    }
}
