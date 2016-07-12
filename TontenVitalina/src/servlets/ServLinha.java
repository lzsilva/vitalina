package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOEmpresa;
import DAO.DAOLinha;
import entidade.Empresa;
import entidade.Linha;

/**
 * Servlet implementation class CadastrarLinha
 */
@WebServlet("/ServLinha")
public class ServLinha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServLinha() {
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
		DAOLinha daoLinha = new DAOLinha();
		
		int idEmpresa = Integer.parseInt(request.getParameter("empresa"));
		String nome = request.getParameter("nome");
		
		switch(acao){
			case "cadastrar":								
				Linha linha = new Linha(nome, idEmpresa);
				daoLinha.salvar(linha);				
				break;
				
			case "editar":				
				int idLinha = (Integer.parseInt(request.getParameter("id")));				
				daoLinha.update(idLinha, idEmpresa, nome);				
				break;
		}
		
		
		response.sendRedirect("ListarLinhas.jsp");
		//r.forward(request, response);
	}

}
