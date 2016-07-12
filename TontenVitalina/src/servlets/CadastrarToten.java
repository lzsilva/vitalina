package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOLocalidade;
import DAO.DAOToten;
import entidade.Localidade;
import entidade.Toten;

/**
 * Servlet implementation class CadastrarToten
 */
@WebServlet("/CadastrarToten")
public class CadastrarToten extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarToten() {
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
		
		int idLocalidade = Integer.parseInt(request.getParameter("localidade"));
		Toten toten = new Toten(idLocalidade);
		DAOToten daoToten = new DAOToten();
		daoToten.salvar(toten);
		
		RequestDispatcher r = request.getRequestDispatcher("CadTonten.jsp");
		r.forward(request, response);
	}

	
}
