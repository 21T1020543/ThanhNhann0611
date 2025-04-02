package khachhangmodal;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	public khachhang ktdangnhap(String tendn, String pass) throws Exception{
		return khdao.ktdangnhap(tendn, pass);
	}
	public int getSoLuongKhachHang() throws Exception{
		return khdao.getSoLuongKhachHang();
	}
}
