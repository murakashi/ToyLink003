

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SelectYearBean;

/**
 * Servlet implementation class UriageMonth
 */
@WebServlet("/UriageMonth")
public class UriageMonth extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageMonth() {
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

		HttpSession session = request.getSession();

		if(session.getAttribute("s_name") != null) {
			session.removeAttribute("s_name");
		}

		if(session.getAttribute("c_id") != null) {
			session.removeAttribute("c_id");
		}

		DBAccess dba = new DBAccess();

		String bname = (String)request.getParameter("bname");

		String yearstr = (String)request.getParameter("year");
		session.setAttribute("year", yearstr);
		if(bname.equals("検索") || bname.equals("月間")) {

			if(yearstr != null && yearstr.length() != 0) {
				ArrayList<String[]> uriagelist = dba.getUriageMonthData(yearstr);

				SelectYearBean years = new SelectYearBean();

				int startyear = dba.getStartYear();
				if(startyear <= 0) {
					years.setStartyear(1900);
				}
				else {
					years.setStartyear(startyear);
				}

				Calendar cal = Calendar.getInstance();
				int endyear = cal.get(Calendar.YEAR);
				years.setEndyear(endyear);
				session.setAttribute("years", years);

				session.setAttribute("URIAGE",uriagelist);

				request.getRequestDispatcher("uriageMonth.jsp").forward(request, response);
			}
			else {
				ArrayList<String[]> uriagelist = dba.getUriageMonthData();

				SelectYearBean years = new SelectYearBean();

				int startyear = dba.getStartYear();
				if(startyear <= 0) {
					years.setStartyear(1900);
				}
				else {
					years.setStartyear(startyear);
				}

				Calendar cal = Calendar.getInstance();
				int endyear = cal.get(Calendar.YEAR);
				years.setEndyear(endyear);
				session.setAttribute("years", years);

				session.setAttribute("URIAGE",uriagelist);

				request.getRequestDispatcher("uriageMonth.jsp").forward(request, response);
			}
		}
		else if (bname.equals("戻る")) {
			//HttpSession session = request.getSession(false);
			if(session.getAttribute("yearslist") != null) {
				session.removeAttribute("yearslist");
			}
			request.getRequestDispatcher("Uriage").forward(request, response);
		}
	}

}
