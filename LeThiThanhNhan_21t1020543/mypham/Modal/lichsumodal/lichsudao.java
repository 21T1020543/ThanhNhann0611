package lichsumodal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import ketnoimodal.KetNoi;

public class lichsudao {
	public ArrayList<lichsubean> getlichsu() throws Exception{
		ArrayList<lichsubean> ds = new ArrayList<lichsubean>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "select * from Vlichsu";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: truyen tham so vao cau lenh neu co
		//b5: thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b6: Duyet rs
		while(rs.next()) {
			String hoten = rs.getString("hoten") ;
			String tenmp = rs.getString("tenmp");
		
			Long soluongmua = rs.getLong("SoLuongMua");
			Long gia = rs.getLong("gia");
			String tien = rs.getString("ThanhTien");
			
		
			Long tien2 = Long.parseLong(tien);
			Date ngaymua = rs.getDate("NgayMua");
			Boolean damua = rs.getBoolean("damua");
			Long makh = rs.getLong("makh");
			ds.add(new lichsubean(hoten, tenmp, soluongmua,  gia,  tien2,  ngaymua,
					 damua, makh));
		}
		//b7: dong
		rs.close();
		kn.cn.close();
		return ds;

	}
}
