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

import khachhangmodal.khachhang;
import khachhangmodal.khachhangbo;

/**
 * Servlet implementation class dangnhapController
 */
@WebServlet("/dangnhapController")
public class dangnhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangnhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {		
			
			String username = request.getParameter("txtun");
			String password = request.getParameter("txtpass");
			String errorMessage="";
			
			//dung dipascher chuyen huong dulieu , sendredicet ve controller , dispaster ve jsp ,	
			if(username!=null && password!=null){
				khachhangbo khbo = new khachhangbo();
				khachhang kh = khbo.ktdangnhap(username,ecrypt(password));			
				if(kh!=null){
					HttpSession session = request.getSession();
					session.setAttribute("dn", kh);
					response.sendRedirect("myphamController");					
				}
				else{
					errorMessage = "Thông tin đăng nhập không đúng!";
				}
			}			
			request.setAttribute("user", username);
			request.setAttribute("password", password);
			request.setAttribute("errorMessage", errorMessage);		
			//sendRedirect(htgioController);
			RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
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
	public static String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
	    String enrtext;
	    MessageDigest msd = MessageDigest.getInstance("MD5");
	    byte[] srctextbyte = text.getBytes("UTF-8");
	    byte[] enrtextbyte = msd.digest(srctextbyte);
	    BigInteger big = new BigInteger(1, enrtextbyte);
	    enrtext = big.toString(16);
	    return enrtext;
	}

}
