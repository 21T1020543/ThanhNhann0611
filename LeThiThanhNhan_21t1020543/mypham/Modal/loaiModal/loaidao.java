package loaiModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoimodal.KetNoi;

public class loaidao {
	public ArrayList<loai> getLoai() throws Exception {
		ArrayList<loai> ds = new ArrayList<loai>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM loai";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//b3 duyet rs luu du lieu vaof ds
		while(rs.next()) {
			String maloai = rs.getString("maloai");
			String tenloai = rs.getString("tenloai");
			ds.add(new loai(maloai, tenloai));
			
			
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
}
