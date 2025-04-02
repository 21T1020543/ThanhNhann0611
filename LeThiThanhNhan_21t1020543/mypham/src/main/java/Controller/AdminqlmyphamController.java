package Controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import adminmodal.adminquanlybo;
import giohangmodal.giohangbo;
import loaiModal.loaibo;

/**
 * Servlet implementation class AdminqlsachController
 */
@WebServlet("/AdminqlmyphamController")
public class AdminqlmyphamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminqlmyphamController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	 DiskFileItemFactory factory = new DiskFileItemFactory();
	 DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
	 ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
//	 String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "image_sach";
//	 response.getWriter().println(dirUrl1);
	
	try {
		adminquanlybo tbo = new adminquanlybo();

		if(request.getContentLength()<=0) {//Chay lan dau
			String mamp = request.getParameter("mamp");
			String tenmp = request.getParameter("tenmp");
			String nhasanxuat = request.getParameter("nhasanxuat");
			String gia = request.getParameter("gia");
		
			String soluong = request.getParameter("soluong");
			String anh = request.getParameter("anh");

			if(mamp != null) {
				request.setAttribute("mamp", mamp.trim());
				request.setAttribute("tenmp", tenmp.trim());
				request.setAttribute("nhasanxuat", nhasanxuat.trim());
				request.setAttribute("gia", gia.trim());
			
				request.setAttribute("soluong", soluong.trim());
				request.setAttribute("anh", anh);
			}
			
			String mctxoa = request.getParameter("mctxoa");
			if (mctxoa != null) {
			    tbo.xoa(mctxoa);
			}
			loaibo lbo= new loaibo();
			HttpSession session = request.getSession();
			giohangbo g = new giohangbo();
		 	g=(giohangbo)session.getAttribute("gh");
		 	if(g != null) {
		 		request.setAttribute("g", g);
		 	}
				RequestDispatcher rd= request.getRequestDispatcher("homeAdmin2.jsp");
				rd.forward(request, response);
				return;
          }
		String mamp = null;
		String tenmp = null;
		String nhasanxuat = null;
		long gia = 0;
		long soluong = 0;
		String ngaynhap = null;
		String anh = null;
		String maloai = null;
		String action = null;
		List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
		//duyệt qua các đối tượng gửi lên từ client gồm file và các control
		for (FileItem fileItem : fileItems) {
			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
			// xử lý file
			String nameimg = fileItem.getName();
			if (!nameimg.equals("")) {
		           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
				String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "img";
				File dir = new File(dirUrl);
				if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
					dir.mkdir();
				}
	           String fileImg = dirUrl + File.separator + nameimg;
	           File file = new File(fileImg);//tạo file
	           anh = "img/"+nameimg;
	            try {
	               fileItem.write(file);//lưu file
	              System.out.println("UPLOAD THÀNH CÔNG...!");
	              System.out.println("Đường dẫn lưu file là: "+dirUrl);
	           
				 } catch (Exception e) {
				    e.printStackTrace();
				}
		}
	 }
		else//Neu la control
		{
			String tentk = fileItem.getFieldName();

			if (tentk.equals("txtmamp")) {
			    mamp = fileItem.getString("UTF-8");
			}
			if (tentk.equals("txttenmp")) {
			    tenmp = fileItem.getString("UTF-8");
			}
			if (tentk.equals("txtnhasanxuat")) {
			    nhasanxuat = fileItem.getString("UTF-8");
			}
			if (tentk.equals("txtgia") && tentk != null) {
			    String giaStr = fileItem.getString("UTF-8").trim();
			    if (!giaStr.isEmpty()) {
			        gia = Long.parseLong(giaStr);
			    }
			}
			if (tentk.equals("txtsoluong")) {
			    String soluongStr = fileItem.getString("UTF-8").trim();
			    if (!soluongStr.isEmpty()) {
			        soluong = Long.parseLong(soluongStr);
			    }
			}
			if (tentk.equals("txtngaynhap")) {
				String ngaynhapStr = fileItem.getString("UTF-8").trim();
				if (!ngaynhapStr.isEmpty()) {
					ngaynhap = fileItem.getString("UTF-8");
			    }
				LocalDateTime currentDateTime = LocalDateTime.now();
			    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			    ngaynhap = currentDateTime.format(formatter);
			    
			}
			
			if (tentk.equals("txtmaloai")) {
			    maloai = fileItem.getString("UTF-8");
			}
			if (tentk.equals("action")) {
				action = fileItem.getString("UTF-8");
			}
			
		}
	}
		if(action.equals("Add")) {
			 if(!mamp.isEmpty() ) {
				 tbo.ThemMyPham(mamp,  tenmp,  soluong, gia,maloai,  anh, ngaynhap, nhasanxuat);
			 }
		}else if (action.equals("Update")){
			tbo.CapNhat(mamp, tenmp, soluong,gia, maloai, anh, ngaynhap, nhasanxuat);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	 RequestDispatcher rds= request.getRequestDispatcher("homeAdmin2.jsp");
	 rds.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}