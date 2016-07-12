package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidade.Itinerario;
import entidade.Linha;
import entidade.ObjetoDeTransporte;

import DAO.DAOItinerario;
import DAO.DAOLinha;
import DAO.DAOLocalidade;


/**
 * Servlet implementation class ListarLinhas
 */
@WebServlet("/ListarLinhas")
public class ListarLinhas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarLinhas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		System.out.print("ola mundo do get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String partida = request.getParameter("partida");
		String chegada = request.getParameter("chegada");
		int pt = Integer.parseInt(partida);
		int cg = Integer.parseInt(chegada);
		DAOItinerario daoItinerario = new DAOItinerario();
		DAOLinha daoLinha = new DAOLinha();
		Linha linha=null;
		ArrayList<Itinerario> itinerario = daoItinerario.buscar(pt, cg);
		ArrayList<ObjetoDeTransporte> objetos = new ArrayList<ObjetoDeTransporte>();
		
		if(daoItinerario != null){			
			for (Itinerario it: itinerario){
				linha = daoLinha.buscar(it.getIdLinha());
				objetos.add(new ObjetoDeTransporte(linha.getNome(),it.getOrdem()));				
			}
		}
		
		DAOLocalidade dl = new DAOLocalidade();
		String origem = dl.buscar(pt).getNome();
		String destino = dl.buscar(cg).getNome();
		
		request.setAttribute("lista", objetos);
		request.setAttribute("nomeOrigem",origem);
		request.setAttribute("nomeDestino",destino);
		
		RequestDispatcher r = request.getRequestDispatcher( "RespostaPesquisa.jsp" );		
		r.forward( request, response );
		
		
		//for(ObjetoDeTransporte ot: objetos){
			//System.out.println(ot.getNomeDaLinha()+" "+ot.getOrdem());
		//}
				
	}

}
