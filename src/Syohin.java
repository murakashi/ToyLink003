

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
 * Servlet implementation class Syohin
 */
@WebServlet("/Syohin")
public class Syohin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Syohin() {
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

		DBAccess dba = new DBAccess();
		HttpSession session = request.getSession();
		String bname = request.getParameter("bname");
		String updatebtn = request.getParameter("updatebtn");
		String deletebtn = request.getParameter("deletebtn");
		session.setAttribute("message", "");



		if(bname != null) {
			if(bname.equals("メニュー")) {
				if(session != null) {
					if(session.getAttribute("searchlist") != null) {
						session.removeAttribute("searchlist");
					}
					if(session.getAttribute("categorylist") != null) {
						session.removeAttribute("categorylist");
					}
					if(session.getAttribute("syohindata") != null) {
						session.removeAttribute("syohindata");
					}
				}
				request.getRequestDispatcher("Menu").forward(request, response);
			}
		    else if(bname.equals("商品一覧") ||
		    		bname.equals("いいえ") ||
		    		bname.equals("戻る")) {
				ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();
				syouhinlist = dba.All_SyohinData();

				ArrayList<CategoryBean> categorylist = new ArrayList<CategoryBean>();
				categorylist = dba.select_Category();

				session.setAttribute("syouhinlist", syouhinlist);
				session.setAttribute("categorylist", categorylist);

				request.getRequestDispatcher("syohin.jsp").forward(request, response);;
			}
			else if(bname.equals("検索")) {
				ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();

				String syouhin = (String)request.getParameter("s_name");
				String category = (String)request.getParameter("category");


				/*****検索条件の保持のため************/
				session.setAttribute("s_name", syouhin);
				session.setAttribute("c_id", category);

				if (syouhin != null && syouhin.length() != 0) {
					if(syouhin.getBytes("UTF-8").length <= 50) {
						if(!(category.equals("未選択"))) {

							ArrayList<SyouhinBean> searchresult = dba.SyohinList_Name_Category_Search(syouhin,category);
							session.setAttribute("syouhinlist", searchresult);
							session.setAttribute("message", "");
						}
						else {
							ArrayList<SyouhinBean> searchresult = dba.SyohinList_NameSearch(syouhin);
							session.setAttribute("syouhinlist", searchresult);
							session.setAttribute("message", "");
						}
					}
					else {
						//session.setAttribute("error", "検索条件が長すぎます");
						session.setAttribute("message", "検索条件が長すぎます");
					}

				}
				else if (!(category.equals("未選択"))) {
					ArrayList<SyouhinBean> searchresult = dba.SyohinList_CategorySearch(category);
					session.setAttribute("syouhinlist", searchresult);
					session.setAttribute("message", "");
				}
				else {
					syouhinlist = dba.All_SyohinData();
					session.setAttribute("syouhinlist", syouhinlist);
				}
				request.getRequestDispatcher("syohin.jsp").forward(request, response);
			}
		}
		else if (updatebtn != null) {
			ArrayList<SyouhinBean> searchresult = dba.select_Single_Syohin(updatebtn);
			session.setAttribute("syohindata", searchresult);
			request.getRequestDispatcher("SyohinFix").forward(request, response);

		}
		else if (deletebtn != null) {
			ArrayList<SyouhinBean> searchresult = dba.select_Single_Syohin(deletebtn);
			session.setAttribute("syohindata", searchresult);
			request.getRequestDispatcher("SyohinDel").forward(request, response);

		}
	}

}
