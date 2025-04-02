package dangnhapAdminmodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ketnoimodal.KetNoi;

public class dangnhapAdmindao {
	public String ktDangnhap(String tendn, String pass) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql="SELECT * FROM dangnhap WHERE TenDangNhap = ? AND MatKhau = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		String kq = null;
		if(rs.next())
			kq = tendn;
		rs.close();kn.cn.close();
		return kq;
	}
}
