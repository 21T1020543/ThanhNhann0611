package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;
import loaiModal.loaibo;
import myphamModal.mypham;
import myphamModal.myphambo;


/**
 * Servlet implementation class sachController
 */
@WebServlet("/myphamController")
public class myphamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myphamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			
			
			loaibo lbo = new loaibo();
		
			myphambo mpbo = new myphambo();
			  String indexP = request.getParameter("index");
			  int index = (indexP != null) ? Integer.parseInt(indexP) : 1;
			String ml = request.getParameter("ml");
			String key = request.getParameter("txttk");
				ArrayList<mypham> ds ;
				 if (ml != null) {
				        int totalRecords = mpbo.layTongSoLuongMyPhamTheoLoai(ml);
				        int endPage2 = (totalRecords % 9 == 0) ? totalRecords / 9 : (totalRecords / 9) + 1;
				        request.setAttribute("endP", endPage2);
				 
				       

				        ds = mpbo.getMyPhamPhanTrangTheoLoai(index, ml);
				    } else if (key != null) {
				        ds = mpbo.Tim(key, index);
				        request.setAttribute("endP", 1);
				    } else {
				        int totalRecords = mpbo.layTongSoLuongMyPham();
				        int endPage = (totalRecords % 9 == 0) ? totalRecords / 9 : (totalRecords / 9) + 1;
				        request.setAttribute("endP", endPage);
				        ds = mpbo.getMyphamPhanTrang(index);
				    }
				
				
				
			HttpSession session = request.getSession();
			
			giohangbo g = new giohangbo();
		 	g=(giohangbo)session.getAttribute("gh");
		 	if(g != null) {
		 		request.setAttribute("g", g);
		 	}
			request.setAttribute("dsmypham", ds);
			request.setAttribute("dsloai", lbo.getLoai());
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}