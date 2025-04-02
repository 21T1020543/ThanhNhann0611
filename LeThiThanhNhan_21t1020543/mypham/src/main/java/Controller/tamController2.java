package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import giohangmodal.giohangbo;

/**
 * Servlet implementation class tamController2
 */
@WebServlet("/tamController2")
public class tamController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tamController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
giohangbo gh=(giohangbo)session.getAttribute("gh");
if(gh!=null){
   if(request.getParameter("butxoa")!=null){//Xoa chon
    String[] d= request.getParameterValues("ck");
    for(String st:d){
    gh.Xoa(st);
}
   }
   if(request.getParameter("mmp")!=null){//Xoa tung dong
       String mmp=request.getParameter("mmp");
    gh.Xoa(mmp);
   }
   if(request.getParameter("butsua")!=null){ //Su so luong
       String mmp=request.getParameter("butsua");
    String sl= request.getParameter(mmp);
    gh.Them(mmp, "", (long)0, Long.parseLong(sl));
   }
session.setAttribute("gh",gh);
response.sendRedirect("htgioController");
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
