

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

		DBAccess db = new DBAccess();

		String s_id = request.getParameter("s_id");
		//String s_name = request.getParameter("s_name");
		int tana_count = Integer.parseInt(request.getParameter("tana_count"));//棚卸の実数を受け取る

		//棚卸の数ひくシステム上の在庫数
		tana_count = tana_count - db.select_Zaiko(s_id);

		//棚卸による在庫テーブルへのインサートを行う
		db.insert_TanaZaiko(s_id,tana_count);

		request.getRequestDispatcher("tanaorosiFin.jsp")
		.forward(request, response);
	}

}
