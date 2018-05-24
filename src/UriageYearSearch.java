

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UriageYearSearch
 */
@WebServlet("/UriageYearSearch")
public class UriageYearSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageYearSearch() {
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


		HttpSession session = request.getSession();

		String year=request.getParameter("year");

		session.setAttribute("year", year);

		if(year!="") {
		DBAccess db=new DBAccess();

		ArrayList<String[]> n = db.UriageYearDataSearch(year);
		session.setAttribute("URIAGEY", n);

		request.getRequestDispatcher("uriageYear.jsp")
		.forward(request, response);
		}else {
			request.getRequestDispatcher("UriageYear")
			.forward(request, response);
		}

	}

}
