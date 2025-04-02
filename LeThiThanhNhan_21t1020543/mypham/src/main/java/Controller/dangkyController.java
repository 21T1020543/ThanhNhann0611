package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;
import ketnoimodal.KetNoi;
import loaiModal.loaibo;

/**
 * Servlet implementation class dangkyController
 */
@WebServlet("/dangkyController")
public class dangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		KetNoi kn = new KetNoi();
        String message = "";
        try {
            kn.ketnoi();
            String hoten = request.getParameter("txthoten");
            String diachi = request.getParameter("txtdiachi");
            String sodt = request.getParameter("txtsdt");
            String email = request.getParameter("txtemail");
            String tendn = request.getParameter("txtun");
            String pass = request.getParameter("txtpass");
            loaibo lbo= new loaibo();
			HttpSession session = request.getSession();
			giohangbo g = new giohangbo();
		 	g=(giohangbo)session.getAttribute("gh");
		 	if(g != null) {
		 		request.setAttribute("g", g);
		 	}
		 	if (hoten != null && !hoten.trim().isEmpty() &&
		 		    diachi != null && !diachi.trim().isEmpty() &&
		 		    sodt != null && !sodt.trim().isEmpty() &&
		 		    email != null && !email.trim().isEmpty() &&
		 		    tendn != null && !tendn.trim().isEmpty() &&
		 		    pass != null && !pass.trim().isEmpty()) {
            	    String sql = "insert into KhachHang (hoten, diachi, sodt, email, tendn, pass) VALUES (?, ?, ?, ?, ?, ?)";
            	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
            	    cmd.setString(1, hoten);
            	    cmd.setString(2, diachi);
            	    cmd.setString(3, sodt);
            	    cmd.setString(4, email);
            	    cmd.setString(5, tendn);
            	    cmd.setString(6, ecrypt(pass));
            	    cmd.executeUpdate();
            	    message = "Đăng ký thành công!";
            	} else {
            	    message = "Vui lòng điền đầy đủ thông tin!";
            	}

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("message", message);
        RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
        rd.forward(request, response);
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
