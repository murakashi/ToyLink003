

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

/**
 * Servlet implementation class NewSyohin
 */
@WebServlet("/NewSyohin")
public class NewSyohin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewSyohin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		DBAccess db = new DBAccess();

		int s_id = db.select_Max_Sid();

		ArrayList<CategoryBean> category = db.select_Category();

		session.setAttribute("s_id", s_id);

		session.setAttribute("category", category);

		RequestDispatcher rd = request.getRequestDispatcher("newSyohin.jsp");

		rd.forward(request, response);
	}

}
