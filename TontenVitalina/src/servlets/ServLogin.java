package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DAOUsuario;
import entidade.Usuario;

/**
 * Servlet implementation class ServLogin
 */
@WebServlet("/ServLogin")
public class ServLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pagina = "Login.jsp?erro=1";		
		if(request.getParameter("acao").equals("logar")) {
			DAOUsuario daouser = new DAOUsuario();
			Usuario usuario = new Usuario(request.getParameter("nome"), request.getParameter("senha"));
			if (daouser.existe(usuario)){
				HttpSession sessao = request.getSession();				
				sessao.setAttribute("login", request.getParameter("nome"));					
				pagina = "Administracao.jsp";
			}
				
			
		} else if(request.getParameter("acao").equals("sair")) {			
			HttpSession sessao = request.getSession();
			sessao.invalidate();			
			pagina = "Login.jsp";
		}	
		response.sendRedirect(pagina);
	}	
	
}
