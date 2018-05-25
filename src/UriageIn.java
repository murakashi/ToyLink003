

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.SelectYearBean;
import bean.SyouhinBean;

/**
 * Servlet implementation class UriageIn
 */
@WebServlet("/UriageIn")
public class UriageIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();


		DBAccess db=new DBAccess();

		ArrayList<SyouhinBean> syouhinlist = new ArrayList<SyouhinBean>();
		syouhinlist = db.All_SyohinData();
		session.setAttribute("syouhinlist", syouhinlist);

		try {
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

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = df.parse(startyear+"-01-01");
			Date enddate = new Date();


			session.setAttribute("startdate", df.format(startdate));
			session.setAttribute("enddate", df.format(enddate));

			request.getRequestDispatcher("uriageIn.jsp")
			.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}


	}

}
