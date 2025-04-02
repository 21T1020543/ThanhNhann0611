package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;
import lichsumodal.lichsubean;
import lichsumodal.lichsubo;
import loaiModal.loaibo;

/**
 * Servlet implementation class lichsuController
 */
@WebServlet("/lichsuController")
public class lichsuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsuController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//Lấy loại va sách về
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			lichsubo lsbo= new lichsubo();
			loaibo lbo= new loaibo();
			HttpSession session = request.getSession();
			giohangbo g = new giohangbo();
		 	g=(giohangbo)session.getAttribute("gh");
		 	if(g != null) {
		 		request.setAttribute("g", g);
		 	}
			request.setAttribute("dsloai", lbo.getLoai());
			ArrayList<lichsubean> dsls = lsbo.getlichsu();
			Collections.reverse(dsls);
			request.setAttribute("dslichsu", dsls);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd= request.getRequestDispatcher("lichsu.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
