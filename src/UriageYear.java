

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
 * Servlet implementation class UriageYear
 */
@WebServlet("/UriageYear")
public class UriageYear extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageYear() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);

		HttpSession session = request.getSession();

		if(session.getAttribute("s_name") != null) {
			session.removeAttribute("s_name");
		}

		if(session.getAttribute("c_id") != null) {
			session.removeAttribute("c_id");
		}

		DBAccess db=new DBAccess();

		String yearstr ="1";
		if(yearstr != null && ((String) yearstr).length() != 0) {

			SelectYearBean years = new SelectYearBean();

			int startyear = db.getStartYear();
			if(startyear <= 0) {
				years.setStartyear(1900);
			}
			else {
				years.setStartyear(startyear);
			}

			Calendar cal = Calendar.getInstance();
			int endyear = cal.get(Calendar.YEAR);
			years.setEndyear(endyear);
			session.setAttribute("yearslist", years);

			request.setAttribute("year", yearstr);

			//request.getRequestDispatcher("uriageYear.jsp").forward(request, response);
		}
		else {


			SelectYearBean years = new SelectYearBean();

			int startyear = db.getStartYear();
			if(startyear <= 0) {
				years.setStartyear(1900);
			}
			else {
				years.setStartyear(startyear);
			}

			Calendar cal = Calendar.getInstance();
			int endyear = cal.get(Calendar.YEAR);
			years.setEndyear(endyear);
			session.setAttribute("yearslist", years);

			request.setAttribute("year", yearstr);

			//request.getRequestDispatcher("uriageYear.jsp").forward(request, response);
		}



		ArrayList<String[]> n = db.getUriageYearData();
		session.setAttribute("URIAGEY", n);

		request.getRequestDispatcher("uriageYear.jsp")
		.forward(request, response);
	}

}
