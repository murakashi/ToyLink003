

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SyouhinBean;

/**
 * Servlet implementation class InsertFinish
 */
@WebServlet("/InsertFinish")
public class InsertFinish extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFinish() {
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

		HttpSession session = request.getSession();

		String s_id = (String)session.getAttribute("s_id");
		String s_name = (String)session.getAttribute("s_name");
		String c_id = (String)session.getAttribute("c_id");
		String siire_tanka = (String)session.getAttribute("siire_tanka");
		String h_tanka = (String)session.getAttribute("h_tanka");
		String safe_zaiko = (String)session.getAttribute("safe_zaiko");

		DBAccess db = new DBAccess();

		db.insert_Syohin(s_id,s_name,c_id,siire_tanka,h_tanka,safe_zaiko);

		/**************続けて発注する際に使う********************************/
		ArrayList<SyouhinBean> syohin = db.select_Single_Syohin(s_id);
		session.setAttribute("syohin", syohin);
		/**************続けて発注する際に使う********************************/

		session.removeAttribute("s_name");
		session.removeAttribute("c_id");

		RequestDispatcher rd = request.getRequestDispatcher("insertFinish.jsp");

		rd.forward(request, response);
	}

}
