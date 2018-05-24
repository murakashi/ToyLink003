

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CategoryBean;

/**
 * Servlet implementation class Zaiko
 */
@WebServlet("/Uriage")
public class Uriage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uriage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		DBAccess db=new DBAccess();

		ArrayList<String[]> n = db.getUriageData();
		session.setAttribute("URIAGE", n);


		ArrayList<CategoryBean> categorylist = new ArrayList<CategoryBean>();
		categorylist = db.select_Category();
		session.setAttribute("categorylist", categorylist);

		session.removeAttribute("s_name");
		session.removeAttribute("c_id");

		request.getRequestDispatcher("uriage.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		session.removeAttribute("year");

		DBAccess db=new DBAccess();

		ArrayList<String[]> n = db.getUriageData();
		session.setAttribute("URIAGE", n);


		ArrayList<CategoryBean> categorylist = new ArrayList<CategoryBean>();
		categorylist = db.select_Category();
		session.setAttribute("categorylist", categorylist);

		session.removeAttribute("s_name");
		session.removeAttribute("c_id");

		request.getRequestDispatcher("uriage.jsp")
		.forward(request, response);


	}

}