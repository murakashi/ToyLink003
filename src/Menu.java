

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SyouhinBean;

/**
 * Servlet implementation class Menu
 */
@WebServlet("/Menu")
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Menu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

        DBAccess db = new DBAccess();
        ArrayList<SyouhinBean> zaiko = db.select_SyohinA();

        if(zaiko.size() > 0) {
        	session.setAttribute("zaiko00","安全在庫数を下回っている商品があります。確認してください。");
        }else {
        	session.setAttribute("zaiko00","");
        }

		 request.getRequestDispatcher("menu.jsp")
 	      .forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		/************セッションあったら切る********************/
		if(session.getAttribute("s_name") != null) {
			session.removeAttribute("s_name");
		}

		if(session.getAttribute("c_id") != null) {
			session.removeAttribute("c_id");
		}

		if(session.getAttribute("message") != null) {
			session.removeAttribute("message");
		}

		if(session.getAttribute("siire_tanka") != null) {
			session.removeAttribute("siire_tanka");
		}

		if(session.getAttribute("h_tanka") != null) {
			session.removeAttribute("h_tanka");
		}

		if(session.getAttribute("safe_zaiko") != null) {
			session.removeAttribute("safe_zaiko");
		}


		doGet(request, response);
	}

}
