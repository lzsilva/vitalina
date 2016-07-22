package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOLocalidade;
import entidade.Localidade;

/**
 * Servlet implementation class CadastrarLocal
 */
@WebServlet("/ServLocalidade")
public class ServLocalidade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServLocalidade() {
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
		String acao =  request.getParameter("acao");
		DAOLocalidade daoLocalidade = new DAOLocalidade();
		String nome = request.getParameter("nome");
		
		
		
		switch(acao){
		case "cadastrar":
			char tipoC = request.getParameter("tipo").charAt(0);	
			Localidade local = new Localidade(nome, tipoC);
			daoLocalidade.salvar(local);
			break;
		case "editar":
			char tipoE = request.getParameter("tipo").charAt(0);	
			Localidade local_id = new Localidade(Integer.valueOf(request.getParameter("id")),nome, tipoE);
			daoLocalidade.update(local_id);			
			break;
		
		case "deletar":		
			int codigo = Integer.valueOf(request.getParameter("id"));
			daoLocalidade.deletar(codigo);			
			break;
		}	
		
		response.sendRedirect("ListarLocalidades.jsp");		
	}

}
