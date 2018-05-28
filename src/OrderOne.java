

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SiireBean;
import bean.SyouhinBean;

/**
 * Servlet implementation class OrderOne
 */
@WebServlet("/OrderOne")
public class OrderOne extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		DBAccess db = new DBAccess();

		ArrayList<SyouhinBean> syohin = (ArrayList<SyouhinBean>)session.getAttribute("syohin");

		ArrayList<SiireBean> siire_list = db.select_Siire();

		session.setAttribute("siire_list", siire_list);

		RequestDispatcher rd = request.getRequestDispatcher("orderCount.jsp");

		rd.forward(request, response);
	}

}
