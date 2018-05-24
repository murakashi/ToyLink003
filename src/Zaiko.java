

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CategoryBean;
import bean.SyouhinBean;

/**
 * Servlet implementation class Zaiko
 */
@WebServlet("/Zaiko")
public class Zaiko extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Zaiko() {
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
		response.setCharacterEncoding("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String bname = request.getParameter("bname");
		if(bname.equals("在庫状況")) {
			DBAccess dba = new DBAccess();
			ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();
			syouhinlist = dba.select_AllZaiko();

			ArrayList<CategoryBean> categorylist = new ArrayList<CategoryBean>();
			categorylist = dba.select_Category();

			session.setAttribute("syohinlist", syouhinlist);
			session.setAttribute("categorylist", categorylist);

			request.getRequestDispatcher("zaiko.jsp").forward(request, response);;
		}

	}

}
