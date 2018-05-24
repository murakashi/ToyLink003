

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TanaorosiFin
 */
@WebServlet("/TanaorosiFin")
public class TanaorosiFin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TanaorosiFin() {
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

		request.setCharacterEncoding("UTF-8");

		String s_id = request.getParameter("s_id");
		//String s_name = request.getParameter("s_name");
		String tana_count = request.getParameter("tana_count");

		DBAccess db = new DBAccess();

		//棚卸による在庫テーブルへのインサートを行う
		db.insert_Zaiko(s_id,tana_count);

		request.getRequestDispatcher("tanaorosiFin.jsp")
		.forward(request, response);
	}

}
