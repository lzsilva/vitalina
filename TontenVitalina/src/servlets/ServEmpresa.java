package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DAOEmpresa;

import entidade.Empresa;

/**
 * Servlet implementation class CadastrarEmpresa
 */
@WebServlet("/ServEmpresa")
public class ServEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServEmpresa() {
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
		DAOEmpresa daoEmpresa = new DAOEmpresa();	
		
		
		switch (acao){
		
			case "cadastrar":
				String nomeC = request.getParameter("nome");
				Empresa empresa = new Empresa(nomeC);			
				daoEmpresa.salvar(empresa);				
				break;
			case "editar":
				String nomeE = request.getParameter("nome");
				Empresa empresa_id = new Empresa (Integer.parseInt(request.getParameter("id")),nomeE);
				daoEmpresa.update(empresa_id);					
				break;
			case "deletar":	
				System.out.println("deletou.");
				daoEmpresa.deletar(Integer.parseInt(request.getParameter("id")));					
				break;
		}
		
		response.sendRedirect("ListarEmpresas.jsp"); 
		
		
	}

}
