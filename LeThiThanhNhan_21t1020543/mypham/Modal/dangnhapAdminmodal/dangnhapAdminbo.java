package dangnhapAdminmodal;

public class dangnhapAdminbo {
	dangnhapAdmindao dndao = new dangnhapAdmindao();
	public String ktDangnhap(String tendn, String pass) throws Exception{
		return dndao.ktDangnhap(tendn, pass);
	}
}
