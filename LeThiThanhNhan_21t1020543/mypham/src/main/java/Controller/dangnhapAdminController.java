package Controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dangnhapAdminmodal.dangnhapAdminbo;
import nl.captcha.Captcha;

/**
 * Servlet implementation class dangnhapAdminController
 */
@WebServlet("/dangnhapAdminController")
public class dangnhapAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
			String username = request.getParameter("txtun");
			String password = request.getParameter("txtpass");
			String tb = null;
			HttpSession session = request.getSession();
			Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
			request.setCharacterEncoding("UTF-8");
			String answer = request.getParameter("answer");
			int dem = 0;
		    if(session.getAttribute("dem")!= null)
		    	dem = (int)session.getAttribute("dem");
		    if(answer != null)
		    if(dem>=3 && !captcha.isCorrect(answer)) {
		    	RequestDispatcher rd = request.getRequestDispatcher("dangnhapAdmin.jsp");
				rd.forward(request, response);
		    }		    
			if(username!=null && password!=null){
				dangnhapAdminbo dnbo = new dangnhapAdminbo();
				if(dnbo.ktDangnhap(username, password)!=null){//xu ly sau
					session.setAttribute("dnadmin", username);
					response.sendRedirect("AdminqlmyphamController");return;		
				}
				else{
					tb = "Dang nhap sai"; request.setAttribute("tb", tb);
					if(session.getAttribute("dem") == null)
							session.setAttribute("dem", (int)0);
					int d = (int)session.getAttribute("dem");d++;
					session.setAttribute("dem", d);
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("dangnhapAdmin.jsp");
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
