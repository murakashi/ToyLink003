

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

		request.getRequestDispatcher("uriageIn.jsp")
		.forward(request, response);

	}

}
