

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

		HttpSession session = request.getSession();

		String syouID = request.getParameter("syouID");//商品ID取得
		String day = request.getParameter("day");//売上日取得
		int salNum = Integer.parseInt(request.getParameter("salNum"));//売上個数取得
		int tanka = Integer.parseInt(request.getParameter("tanka"));//販売単価取得
		String br= request.getParameter("break");//破損チェックボックスの値取得

		/*******入力値をセッションに入れる********/
		session.setAttribute("syouID", syouID+"");
		session.setAttribute("salNum", salNum+"");
		session.setAttribute("tanka", tanka+"");

		String hason;

		/*****破損チェックボックスのチェックの有無判断************/
		if(br != null && br.equals("hason")) {
			hason="1";
		}else {
			hason="0";

		}

		DBAccess db = new DBAccess();

		int zaiko_count = db.select_Zaiko(syouID) - salNum;

		/*****売上数によって在庫数がマイナスになる場合、売上入力エラー画面に遷移する*****/
		if(zaiko_count < 0) {
			RequestDispatcher rd = request.getRequestDispatcher("uriageInError.jsp");
			rd.forward(request, response);
			return;
		}

		/*****税込価格を求める*****/
		int tax=db.getTax();
		int taxOnly=tanka*tax/100;
		int taxIn=tanka+taxOnly;


		//売上テーブルにインサートする
		db.register(syouID, day, salNum,tanka,hason,taxIn);

		/****在庫にマイナスの数量に変換してインサートする******/
		salNum = -salNum;
		db.zaikoReduce(syouID, salNum);

		request.getRequestDispatcher("uriageFin.jsp")
		.forward(request, response);
	}

}