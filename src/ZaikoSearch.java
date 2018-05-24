

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
 * Servlet implementation class ZaikoSearch
 */
@WebServlet("/ZaikoSearch")
public class ZaikoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZaikoSearch() {
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
		String orderbtn = request.getParameter("order");
		String dflg = request.getParameter("dflg");
		HttpSession session = request.getSession(false);

		if(bname != null) {
			if(dflg != null) {
				ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();
				syouhinlist = dba.select_DengerSyohin();
				session.setAttribute("syohinlist", syouhinlist);
				request.getRequestDispatcher("zaiko.jsp").forward(request, response);
			}
			else {
				if(bname.equals("メニュー")) {

					//(session != null) {
						if (session.getAttribute("s_name") != null) {
							session.removeAttribute("s_name");
						}
						if (session.getAttribute("c_id") != null) {
							session.removeAttribute("c_id");
						}
					//}
					request.getRequestDispatcher("menu.jsp").forward(request, response);
				}
				else if (bname.equals("検索")) {
					ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();

					String syouhin = (String)request.getParameter("syouhin");
					String category = (String)request.getParameter("category");
					session.setAttribute("s_name", syouhin);
					session.setAttribute("c_id", category);

					if (syouhin != null && syouhin.length() != 0) {
						if(syouhin.getBytes("UTF-8").length <= 50) {
							if(!(category.equals("未選択")) && category.length() != 0) {

								ArrayList<SyouhinBean> searchresult = dba.select_Syohin_Category(syouhin,category);
								session.setAttribute("syohinlist", searchresult);
								session.setAttribute("error", "");
							}
							else {
								ArrayList<SyouhinBean> searchresult = dba.select_Multi_Syohin(syouhin);
								session.setAttribute("syohinlist", searchresult);
								session.setAttribute("error", "");
							}
						}
						else {
							session.setAttribute("error", "検索条件が長すぎます");
						}

					}
					else if (!(category.equals("未選択"))) {
						ArrayList<SyouhinBean> searchresult = dba.select_Category(category);
						session.setAttribute("syohinlist", searchresult);
						session.setAttribute("error", "");
					}
					else {
						syouhinlist = dba.select_AllZaiko();
						session.setAttribute("syohinlist", syouhinlist);
					}
					request.getRequestDispatcher("zaiko.jsp").forward(request, response);

//					request.getRequestDispatcher("zaikosearch.jsp").forward(request, response);
				}
			}
		}
		else if (orderbtn != null) {
			String orderid = (String)request.getParameter("order");

			ArrayList<SyouhinBean> searchresult = dba.select_Single_Syohin(orderid);
			session.setAttribute("syohin", searchresult);

			ArrayList<CategoryBean> category = dba.select_Category();
			session.setAttribute("category", category);

			request.getRequestDispatcher("OrderOne").forward(request, response);
		}



	}

}
