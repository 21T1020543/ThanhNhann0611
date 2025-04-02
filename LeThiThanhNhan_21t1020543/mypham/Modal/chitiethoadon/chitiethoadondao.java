package chitiethoadon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import adminmodal.adminxacnhanbean;
import ketnoimodal.KetNoi;

public class chitiethoadondao {
	public int Them(String MaMP,long SoLuongMua,long MaHoaDon) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "INSERT INTO ChiTietHoaDon (MaMP,SoLuongMua,MaHoaDon) VALUES (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, MaMP);
		//chuyen ngay util sang ngay sql de truyen vao tham so thu 2
		
		cmd.setLong(2, SoLuongMua);
		cmd.setLong(3, MaHoaDon);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	public ArrayList<adminxacnhanbean> getxacnhan() throws Exception{
		ArrayList<adminxacnhanbean> ds = new ArrayList<adminxacnhanbean>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "select * from Vxacnhan";
		//b3: tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		//b4: truyen tham so vao cau lenh neu co
		//b5: thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		//b6: Duyet rs
		while(rs.next()) {
			String hoten = rs.getString("hoten");
			Date NgayMua = rs.getDate("NgayMua");
			int SoLuongMua = rs.getInt("SoLuongMua");
			Long Gia = rs.getLong("gia");
			Long ThanhTien = rs.getLong("ThanhTien");
			Long MaHoaDon = rs.getLong("MaHoaDon");

			ds.add(new adminxacnhanbean(hoten,NgayMua,SoLuongMua,Gia,ThanhTien,MaHoaDon));
		}
		//b7: dong
		rs.close();
		kn.cn.close();
		return ds;

	}
	
	public int CapNhat(Long MaHoaDon) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "UPDATE ChiTietHoaDon set damua = 1 where MaHoaDon = ?";
			
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, MaHoaDon);
	
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public void xoaAdminXacNhan(Long mact) throws Exception {
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();

	    String sql = "delete from hoadon where MaHoaDon = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, mact);

	    cmd.executeUpdate();
	    cmd.close();
	    kn.cn.close();
	}

	public void Capnhatsoluong(Long mct, Long sl) throws Exception {
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();

	    String sql = "update ChiTietHoaDon set SoLuongMua = ? where MaChiTietHD = ?";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setLong(1, sl);
	    cmd.setLong(2, mct); 

	     cmd.executeUpdate();

	    cmd.close();
	    kn.cn.close();
	}
}
