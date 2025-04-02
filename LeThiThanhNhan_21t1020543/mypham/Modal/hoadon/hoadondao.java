package hoadon;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import ketnoimodal.KetNoi;

public class hoadondao {
	public int Them(long makh,Date Ngaymua,boolean damua) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "INSERT INTO hoadon (makh,NgayMua,damua) VALUES (?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		//chuyen ngay util sang ngay sql de truyen vao tham so thu 2
		
		cmd.setDate(2, new java.sql.Date(Ngaymua.getTime()));
		cmd.setBoolean(3, false);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
	}
	
	public long getMaxHd() throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT MAX(MaHoaDon) AS maxHd FROM hoadon";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long max = 0;
		if(rs.next()) {
			max = rs.getLong(1);
		}
		rs.close();
		kn.cn.close();
		return max;
	}
	
	public long getDoanhThu() throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT SUM(ThanhTien) AS DoanhThu FROM VDoanhThu";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long doanhthu = 0;
		if(rs.next()) {
			doanhthu = rs.getLong("DoanhThu");
		}
		rs.close();
		kn.cn.close();
		return doanhthu;
	}
	
	public long getSoLuongMyPhamBanRa() throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT SUM(SoLuongMua) AS SoLuongMyPhamBanRa FROM VDoanhThu";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		long soluongmyphambanra = 0;
		if(rs.next()) {
			soluongmyphambanra = rs.getLong("SoLuongMyPhamBanRa");
		}
		rs.close();
		kn.cn.close();
		return soluongmyphambanra;
	}

	
}
