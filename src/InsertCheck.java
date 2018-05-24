

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SyohinInsert
 */
@WebServlet("/InsertCheck")
public class InsertCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCheck() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		RequestDispatcher rd;

		/***********入力項目取得************************/
		String s_id = request.getParameter("s_id");

		String s_name = request.getParameter("s_name");

		String category = request.getParameter("category");

	    String siire_tanka = request.getParameter("siire_tanka");

	    String h_tanka = request.getParameter("h_tanka");

		String safe_zaiko = request.getParameter("safe_zaiko");

		/**************追加確認画面でキャンセルボタンを押したときの値保持のため*******/
		session.setAttribute("s_id", s_id);
		session.setAttribute("s_name", s_name);
		session.setAttribute("c_id", category);
		session.setAttribute("siire_tanka", siire_tanka);
		session.setAttribute("h_tanka", h_tanka);
		session.setAttribute("safe_zaiko", safe_zaiko);

		DBAccess db = new DBAccess();

		String c_name = db.select_Cname(category);

		session.setAttribute("c_name", c_name);

		rd = request.getRequestDispatcher("insertCheck.jsp");

		rd.forward(request, response);
	}

}

