package entidade;

import java.util.ArrayList;

import DAO.DAOLocalidade;
import DAO.DAOUsuario;
import DAO.DAOItinerario;
import DAO.DAOLinha;
import DAO.DAOEmpresa;

public class TestesGenericos {

	public static void main(String[] args) {
		ArrayList<Empresa> empresas = new DAOEmpresa().buscar();
		ArrayList<Itinerario> itinerarios;
		for (Empresa emp : empresas){
			System.out.println(emp.getNome() + " id = " + emp.getIdEmpresa());
			for (Linha linha: (ArrayList<Linha>)emp.getLinhas()){
				itinerarios = null;
				itinerarios = new DAOItinerario().buscarPorLinha(linha.getIdLinha());
				System.out.println(linha.getNome());
				for (Itinerario iti : itinerarios){
					System.out.println("Itinerário" + iti.getIdItinerario());
				}
			}
		}
	  
	}

}
