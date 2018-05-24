

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
 * Servlet implementation class SyohinDel
 */
@WebServlet("/SyohinDel")
public class SyohinDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SyohinDel() {
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
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		DBAccess dba = new DBAccess();
		String bname = request.getParameter("bname");
		String updateid = request.getParameter("updatebtn");
		String deleteid = request.getParameter("deletebtn");
		HttpSession session = request.getSession();

		session.setAttribute("message", "");
		if(bname != null) {
			if(bname.equals("はい")) {
				deleteid = (String)session.getAttribute("delid");
				dba.delete_Syohin(deleteid);
				request.getRequestDispatcher("deletedecide.jsp").forward(request, response);

			}
		}
		else if (deleteid != null) {
			ArrayList<SyouhinBean> syouhinlist = dba.select_Single_Syohin(deleteid);
			if(syouhinlist.get(0).getZaiko() > 0) {
				session.setAttribute("message", "在庫が残っています");
				request.getRequestDispatcher("syohin.jsp").forward(request, response);
			}
			else {
				/**************セッション切る***************/
				if(session.getAttribute("s_name") != null) {
					session.removeAttribute("s_name");
				}

				if(session.getAttribute("c_id") != null) {
					session.removeAttribute("c_id");
				}

				session.setAttribute("syohinlist", syouhinlist);
				session.setAttribute("delid", deleteid);
				request.getRequestDispatcher("syohindel.jsp").forward(request, response);
			}
		}
		else {
			request.getRequestDispatcher("syohin.jsp").forward(request, response);
		}
	}

}
