package khachhangmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ketnoimodal.KetNoi;

public class khachhangdao {
	public khachhang ktdangnhap(String tendn, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM KhachHang where tendn= ? and pass= ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,tendn);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		khachhang kh =null;
		//b3 duyet rs luu du lieu vao ds
		if(rs.next()) {
			
			long makh = rs.getLong("makh");
			String hoten = rs.getString("hoten");
					String diachi = rs.getString("diachi");
					String sodt = rs.getString("sodt");
					
					String email = rs.getString("email");					
					kh = new khachhang(makh,hoten,diachi,sodt,email,tendn,pass);

		}
		rs.close();
		kn.cn.close();
		return kh;
	}
//	public khachhang Them(String hoten, String diachi, Long sodt,String email, String tendn, String pass) throw Exception{
		
//	}
	
	public int getSoLuongKhachHang() throws Exception {
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();
	    String sql = "SELECT COUNT(makh) AS SoLuongKhachHang FROM KhachHang";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    ResultSet rs = cmd.executeQuery();
	    int sokh = 0; // Biến để lưu số lượng khách hàng
	    if (rs.next()) {
	        sokh = rs.getInt("SoLuongKhachHang"); // Lấy giá trị từ cột SoLuongKhachHang
	    }
	    rs.close();
	    cmd.close(); // Đừng quên đóng PreparedStatement
	    kn.cn.close();
	    return sokh;
	}
}
