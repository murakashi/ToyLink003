

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CategoryBean;
import bean.SyouhinBean;

/**
 * Servlet implementation class Order
 */
@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
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

		/******戻るボタンのときにセッション切る*****/
		session.removeAttribute("syohin");

		session.removeAttribute("siire_list");

		session.removeAttribute("siire_id");

		session.removeAttribute("count_arr");


		DBAccess db = new DBAccess();

		//String s_id = (String)session.getAttribute("s_id");/**新規追加からの発注の流れのためのもの*/

		ArrayList<SyouhinBean> syohin = new ArrayList<SyouhinBean>();

		syohin = db.select_AllSyohin();

		session.setAttribute("syohin", syohin);

		ArrayList<CategoryBean> category = new ArrayList<CategoryBean>();

		category = db.select_Category();

		session.setAttribute("category", category);

		RequestDispatcher rd = request.getRequestDispatcher("order.jsp");

		rd.forward(request, response);
	}

}
