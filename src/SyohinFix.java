

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
 * Servlet implementation class SyohinFix
 */
@WebServlet("/SyohinFix")
public class SyohinFix extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SyohinFix() {
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
		HttpSession session = request.getSession(false);
		ArrayList<SyouhinBean> syohindata = (ArrayList<SyouhinBean>)session.getAttribute("syohindata");
		String bname = request.getParameter("bname");
		if (syohindata != null) {
			if(bname == null || bname.length() == 0) {
				session.setAttribute("syohinlist", syohindata);

				ArrayList<CategoryBean> categorylist = new ArrayList<CategoryBean>();
				categorylist = dba.select_Category();

				String c_id = dba.select_CategoryID(syohindata.get(0).getC_id());
				session.setAttribute("c_id", c_id);
				session.setAttribute("categorylist", categorylist);
				request.getRequestDispatcher("syohinfix.jsp").forward(request, response);
			}
			else {

				if(bname.equals("変更")) {

					/***変更前の商品のデータ取得（Syohin.javaから）***/


					//カテゴリ取得
//					String category = (String)request.getParameter("category");

					SyouhinBean syohin = new SyouhinBean();

					syohin.setS_id(syohindata.get(0).getS_id());

					//商品名取得
					String s_name = (String)request.getParameter("s_name");
					//if(s_name.getBytes("UTF-8").length <= 50) {
						syohin.setS_name(s_name);

						/********カテゴリID受け取ってカテゴリ名にする*************/
						String c_id = (String)request.getParameter("category");
						//syohin.setS_name(s_name);
						String c_name = dba.select_Cname(c_id);

						session.setAttribute("c_id", c_id);
						session.setAttribute("c_name", c_name);

						//仕入基準単価取得
						String baseprice = (String)request.getParameter("baseprice");
						syohin.setBaseprice(Integer.parseInt(baseprice));

						//
						String htanka = (String)request.getParameter("htanka");
						syohin.setHtanka(Integer.parseInt(htanka));

						String safezaiko = (String)request.getParameter("safezaiko");
						syohin.setSafezaiko(Integer.parseInt(safezaiko));

						session.setAttribute("updatesyohin", syohin);
						ArrayList<String> change = new ArrayList<String>();


						if(!(syohindata.get(0).getS_name().equals(syohin.getS_name()))) {
							change.add("1");
						}

						if(!(syohindata.get(0).getC_id().equals(c_name))) {
							change.add("2");
						}

						if(!(syohindata.get(0).getBaseprice() ==syohin.getBaseprice())) {
							change.add("3");
						}

						if(!(syohindata.get(0).getHtanka() ==syohin.getHtanka())) {
							change.add("4");
						}

						if(!(syohindata.get(0).getSafezaiko() ==syohin.getSafezaiko())) {
							change.add("5");
						}
						session.setAttribute("change", change);
						request.getRequestDispatcher("syohinfin.jsp").forward(request, response);
					//}
				}
				else if(bname.equals("戻る")) {
					session.removeAttribute("c_id");
					request.getRequestDispatcher("Syohin").forward(request, response);
				}
				else if (bname.equals("はい")) {
					SyouhinBean syohin = (SyouhinBean)session.getAttribute("updatesyohin");
					ArrayList<CategoryBean> category = (ArrayList<CategoryBean>)session.getAttribute("categorylist");
					dba.update_Syohin(syohin,(String)session.getAttribute("c_id"));
					request.getRequestDispatcher("updatefin.jsp").forward(request, response);

				}
				else if (bname.equals("いいえ")) {
					String c_id = dba.select_CategoryID(syohindata.get(0).getC_id());
					session.setAttribute("c_id", c_id);
					request.getRequestDispatcher("syohinfix.jsp").forward(request, response);
				}
			}
		}
	}

}
