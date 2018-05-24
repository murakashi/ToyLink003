

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UriageIn
 */
@WebServlet("/UriageFin")
public class UriageFin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UriageFin() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String syouID = request.getParameter("syouID");
		String day = request.getParameter("day");
		String salNum = request.getParameter("salNum");
		String tanka = request.getParameter("tanka");
		String br= request.getParameter("break");


		String hason;

		if(br != null && br.equals("hason")) {
			hason="1";
		}else {
			hason="0";

		}

			int i = Integer.parseInt(tanka);
			int n = Integer.parseInt(salNum);

			DBAccess da=new DBAccess();

			int tax=da.getTax();
			int taxOnly=i*tax/100;
			int taxIn=i+taxOnly;


			da.register(syouID, day, salNum,tanka,hason,taxIn);
			int salNum2=-n;
			da.zaikoReduce(syouID, salNum2);

			request.getRequestDispatcher("uriageFin.jsp")
			.forward(request, response);

	}

}