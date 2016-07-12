package entidade;

import java.util.ArrayList;

import DAO.DAOLocalidade;
import DAO.DAOUsuario;
import DAO.DAOItinerario;
import DAO.DAOLinha;

public class TestesGenericos {

	public static void main(String[] args) {
		DAOUsuario daouser = new DAOUsuario();
		
		Usuario usuario = new Usuario("Luiz","senha");
		
		System.out.println(daouser.existe(usuario));
	  
	}

}
