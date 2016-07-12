package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import entidade.Usuario;
import recurso.FabricaDeConexao;

public class DAOUsuario implements IDAO<Usuario> {
	
	PreparedStatement ps;
	Connection con;
	ResultSet result;

	@Override
	public void salvar(Usuario objeto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Usuario> buscar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario buscar(int codigo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Usuario objeto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletar(int codigo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Usuario> buscar(String pesquisa) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getLast() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public boolean existe(Usuario usuario){
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM usuario WHERE nomeusuario = ? and senha = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getSenha());
			result = ps.executeQuery();
			boolean existe = false;
			existe = result.next();
			ps.close();
			con.close();
			result.close();		
			return existe;					
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}	
}
