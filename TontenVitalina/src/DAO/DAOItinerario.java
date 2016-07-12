 package DAO;

import entidade.Itinerario;
import entidade.Linha;
import entidade.Localidade;
import java.sql.*;
import java.util.ArrayList;

import recurso.FabricaDeConexao;

public class DAOItinerario implements IDAO<Itinerario> {
	
	PreparedStatement ps;
	Connection con;
	ResultSet result;
	
	@Override
	public void salvar(Itinerario objeto) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String executar = "INSERT INTO itinerario (fkIdLinha,fkIdLocalidade,ordem) VALUES (?,?,?)";
			ps = con.prepareStatement(executar);
			ps.setInt(1, objeto.getIdLinha());
			ps.setInt(2, objeto.getIdLocalidade());
			ps.setInt(3, objeto.getOrdem());
			ps.execute();
			
			ps.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public ArrayList<Itinerario> buscar() {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM itinerario";
			ps = con.prepareStatement(query);
			result = ps.executeQuery();
			
			ArrayList<Itinerario> retorno = new ArrayList<Itinerario>();
			while (result.next()) {
				retorno.add( new Itinerario( result.getInt(1), result.getInt(2), result.getInt(3), result.getInt(4)) );
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
	public Itinerario buscar(int codigo) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "SELECT * FROM itinerario where idItinerario = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, codigo);
			result = ps.executeQuery();
					
			Itinerario itinerario = null;
			while (result.next()) {
				itinerario =  new Itinerario( result.getInt(1), result.getInt(2), result.getInt(3), result.getInt(4));
			}
					
			ps.close();
			con.close();
			result.close();
					
			return itinerario;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
	
	public ArrayList<Itinerario> filtrar(Integer linha, Integer localidade) {
		// TODO Auto-generated method stub
		
		String query = "SELECT * FROM itinerario WHERE ";		
		
		if (linha==null && localidade==null)
			return this.buscar();
		
		if (linha!= null){
			
			query += "fkIdLinha = " + Integer.valueOf(linha);
		}
		
		if (localidade != null ){			
			if (linha != null)
				query += " and ";
			query += "fkIdLocalidade = " + Integer.valueOf(localidade) ;					
		}
		
		try {
			con = FabricaDeConexao.getConnection();			
			ps = con.prepareStatement(query);			
			result = ps.executeQuery();
			
			ArrayList<Itinerario> retorno = new ArrayList<Itinerario>();
			while (result.next()) {
				retorno.add( new Itinerario( result.getInt(1), result.getInt(2), result.getInt(3), result.getInt(4)) );
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
	
	//Incluí este método:
	public ArrayList<Itinerario> buscar(int partida, int chegada) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "select * from  itinerario i where fkIdLocalidade in (?) and " +
					"(select fkIdLocalidade from itinerario where fkIdLocalidade = ? and " +
					"fkIdLinha = i.fkIdLinha) and  " +
					"(select fkIdLocalidade from itinerario where fkIdLocalidade = ? and fkIdLinha = i.fkIdLinha) " +
					"order by ordem, fkIdlinha;";
			ps = con.prepareStatement(query);
			ps.setInt(1,chegada);
			ps.setInt(2,partida);
			ps.setInt(3,chegada);
			result = ps.executeQuery();
			
			ArrayList<Itinerario> retorno = new ArrayList<Itinerario>();
			while (result.next()) {
				
				retorno.add(new Itinerario( result.getInt(1), result.getInt(2), result.getInt(3), result.getInt(4)));
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
	public void update(Itinerario objeto) {
		// TODO Auto-generated method stub
		try {
			con = FabricaDeConexao.getConnection();
			String query = "UPDATE itinerario SET fkIdLinha = ?, fkIdLocalidade = ?, ordem = ? where idItinerario = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1,objeto.getIdLinha());
			ps.setInt(2, objeto.getIdLocalidade());
			ps.setInt(3, objeto.getOrdem());
			ps.setInt(4, objeto.getIdItinerario());
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
		
		
	}
	
	@Override
	public int getLast() {
		
		return 0;
	}

	@Override
	public ArrayList<Itinerario> buscar(String pesquisa) {
		// TODO Auto-generated method stub
		return null;
	}
}
