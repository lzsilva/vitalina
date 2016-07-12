package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOItinerario;
import entidade.Itinerario;

/**
 * Servlet implementation class CadastrarItinerario
 */
@WebServlet("/ServItinerario")
public class ServItinerario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServItinerario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		DAOItinerario daoItinerario = new DAOItinerario();
		int idLinha = Integer.parseInt(request.getParameter("linha"));
		int idLocalidade = Integer.parseInt(request.getParameter("localidade"));
		int ordem = Integer.parseInt(request.getParameter("ordem"));
		
		switch (acao){
		case "cadastrar":
			Itinerario itinerario = new Itinerario(idLinha, idLocalidade, ordem);
			daoItinerario.salvar(itinerario);			
			break;
			
		case "editar":
			int idItinerario = (Integer.parseInt(request.getParameter("itinerario")));
			Itinerario itinerario_id = new Itinerario(idItinerario, idLinha, idLocalidade, ordem);			
			daoItinerario.update(itinerario_id);			
			break;
		}		
		
		response.sendRedirect("ListarItinerarios.jsp");
	}

}
