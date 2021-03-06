package DAO;

import entidade.Linha;
import entidade.Localidade;
import java.sql.*;
import java.util.ArrayList;

import recurso.FabricaDeConexao;

public class DAOLinha implements IDAO<Linha> {
	
	PreparedStatement ps;
	Connection con;
	ResultSet result;
	
	@Override
	public void salvar(Linha objeto) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String executar = "INSERT INTO linha (nomeLinha,fkIdEmpresa) VALUES (?,?)";
			ps = con.prepareStatement(executar);
			ps.setString(1, objeto.getNome());
			ps.setInt(2, objeto.getIdEmpresa());
			ps.execute();
			
			ps.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public ArrayList<Linha> buscar() {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM linha";
			ps = con.prepareStatement(query);
			result = ps.executeQuery();
			
			ArrayList<Linha> retorno = new ArrayList<Linha>();
			while (result.next()) {
				retorno.add( new Linha( result.getInt(1), result.getString(2), result.getInt(3) ) );
			}
			
			ps.close();
			con.close();
			result.close();
			
			return retorno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return null;
	}
	
	@Override
	public Linha buscar(int codigo) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM linha WHERE idLinha = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1,codigo);
			result = ps.executeQuery();
			
			result.next();
			
				Linha linha = new Linha(result.getInt(1),result.getString(2),result.getInt(3));
				
				ps.close();
				con.close();
				result.close();
				
				return linha;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void update(Linha objeto) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "UPDATE linha SET nomeLinha = ? WHERE idLinha = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,objeto.getNome());
			ps.setInt(2, objeto.getIdEmpresa());
			ps.execute();
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Linha> buscarPorEmpresa(int codigo) {
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM linha WHERE fkIdEmpresa = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, codigo);
			result = ps.executeQuery();
			ArrayList<Linha> retorno = new ArrayList<Linha>();
			while (result.next()) {
				retorno.add( new Linha( result.getInt(1), result.getString(2), result.getInt(3) ) );
			}			
			ps.close();
			con.close();
			result.close();			
			return retorno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}
	
	public ArrayList<Linha> buscar(String nome, Integer idEmpresa) {
		// TODO Auto-generated method stub
		String semEspaco = "";
		
		if (nome != null)
			semEspaco = nome.replace(" ", "");
		
		if (nome == null && idEmpresa==null )
			return this.buscar();					
		
		if (semEspaco.isEmpty() && idEmpresa==null)
			return this.buscar();
		
		String select = "SELECT * FROM linha WHERE";
		
		boolean temNome = false;		
		
		if (nome != null && !semEspaco.isEmpty()){
			select += " nomeLinha like ?";
			temNome = true;
			if (idEmpresa!=null)
				select += " and ";
		}
		
		if (idEmpresa != null)
			select += " fkIdEmpresa = " +Integer.toString(idEmpresa); 		
		
		try {
			con = FabricaDeConexao.getConnection();			
			ps = con.prepareStatement(select);
			if (temNome)
				ps.setString(1,"%"+nome+"%");			
			result = ps.executeQuery();
			
			ArrayList<Linha> retorno = new ArrayList<Linha>();
			while (result.next()) {
				retorno.add( new Linha( result.getInt(1), result.getString(2), result.getInt(3) ) );
			}
			
			ps.close();
			con.close();
			result.close();
			
			return retorno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return null;
	}
	
	public void update(int idLinha, int idEmpresa, String nomeLinha) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "UPDATE linha SET nomeLinha = ?, fkIdEmpresa = ? where idLinha = ?";
			ps = con.prepareStatement(query);
			ps.setString(1,nomeLinha);
			ps.setInt(2, idEmpresa);
			ps.setInt(3, idLinha);
			ps.execute();
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deletar(int codigo) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "DELETE FROM linha WHERE idLinha = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1,codigo);
			ps.execute();
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public int getLast() {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT count(*) FROM linha";
			ps = con.prepareStatement(query);
			result = ps.executeQuery();
			
			result.next();
			
			int retorno = result.getInt(1);
			
			con.close();
			ps.close();
			
			return retorno;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public ArrayList<Linha> buscar(String pesquisa) {
		// TODO Auto-generated method stub
		return null;
	}

}
