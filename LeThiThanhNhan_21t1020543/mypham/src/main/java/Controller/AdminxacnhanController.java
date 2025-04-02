package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chitiethoadon.chitiethoadonbo;
import giohangmodal.giohangbo;
import loaiModal.loaibo;


/**
 * Servlet implementation class AdminxacnhanController
 */
@WebServlet("/AdminxacnhanController")
public class AdminxacnhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminxacnhanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			chitiethoadonbo ctbo = new chitiethoadonbo();
			String mct = request.getParameter("mct");
			String mctxoa = request.getParameter("mctxoa");
			String btms = request.getParameter("but1");
			String slsua = request.getParameter(btms);
			loaibo lbo= new loaibo();
			HttpSession session = request.getSession();
			giohangbo g = new giohangbo();
		 	g=(giohangbo)session.getAttribute("gh");
		 	if(g != null) {
		 		request.setAttribute("g", g);
		 	}
			if(slsua == null) {
				if (mctxoa != null) {
					ctbo.Xoa(Long.parseLong(mctxoa));
					  request.setAttribute("message", "Xóa thành công mã chi tiết " + mctxoa);
				}
			}else {
				if (btms != null) {
					ctbo.Capnhatsoluong(Long.parseLong(btms), Long.parseLong(slsua));
					  request.setAttribute("message", "Cập nhật số lượng thành công cho mã " + btms);
				}
			}
			
			if(mct != null) {
				ctbo.CapNhat(Long.parseLong(mct));
				request.setAttribute("message", "Xác nhận thành công cho mã chi tiết " + mct);
				
			}
			request.setAttribute("ds", ctbo.getxacnhan());
			RequestDispatcher rd= request.getRequestDispatcher("homeadminxacnhan.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
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