
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderFinish
 */
@WebServlet("/OrderFinish")
public class OrderFinish extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFinish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesion = request.getSession();

		String siire_id = (String)sesion.getAttribute("siire_id");//仕入先ID取得

		String[] id_arr = (String[])sesion.getAttribute("id_arr");//商品IDの配列取得

		String[] count_arr = (String[])sesion.getAttribute("count_arr");//数量の配列取得

		String[] price_arr = (String[])sesion.getAttribute("price_arr");//仕入基準単価の配列取得（postgresで気づいた）

		DBAccess db = new DBAccess();

		int max_id = db.get_MaxId();//伝票IDの最大値+1を取得する；

		/***発注DBにインサートする***/
		for(int i=0;i<id_arr.length;i++) {
			db.insert_Order(max_id,id_arr[i],siire_id,count_arr[i],price_arr[i]);//伝ID,商品ID,仕入先ID,数量,仕入単価渡す
		}

		/*********検索条件の入力値のセッションを切る***********/
		sesion.removeAttribute("s_name");

		sesion.removeAttribute("category");

		RequestDispatcher rd = request.getRequestDispatcher("orderFinish.jsp");

		rd.forward(request, response);
	}

}
