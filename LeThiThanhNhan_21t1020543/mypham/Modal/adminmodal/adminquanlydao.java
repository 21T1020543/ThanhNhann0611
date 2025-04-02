package adminmodal;

import java.sql.PreparedStatement;

import ketnoimodal.KetNoi;

public class adminquanlydao {
	public int ThemMyPham(String maMP, String tenMP,  Long soLuong, 
			Long gia,String maLoai, String anh, String ngaynhap, String nhaSanXuat) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "INSERT INTO mypham (mamp, tenmp, soluong, gia, maloai, anh, NgayNhap, NhaSanXuat)" + "VALUES(?,?,?,?,?,?,?,?)";
		//B3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,maMP);
		cmd.setString(2,tenMP);
		cmd.setLong(3,soLuong);
		cmd.setLong(4,gia);
		cmd.setString(5,maLoai);
		cmd.setString(6,anh);
		cmd.setString(7,ngaynhap);
		cmd.setString(8,nhaSanXuat);
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
		
	}
	public void xoa(String maMP) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		
		String sql = "DELETE FROM mypham WHERE mamp = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maMP);
		
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	public int CapNhat(String maMP, String tenMP,  Long soLuong, 
			Long gia,String maLoai, String anh, String ngaynhap, String NhaSanXuat) throws Exception {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "UPDATE mypham "
			        + "SET mamp = ?, "
			        + "    tenmp = ?, "
			        + "    soluong = ?, "
			        + "    gia = ?, "
			        + "    maloai = ?,"
			        + "    anh = ?, "
			        + "    NgayNhap = ?, "
			        + "    NhaSanXuat = ? "
			        + "WHERE mamp = ?";
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, maMP);
			cmd.setString(2, tenMP);
			cmd.setLong(3, soLuong);
			cmd.setLong(4, gia);
			cmd.setString(5, maLoai);
			cmd.setString(6, anh);
			cmd.setString(7, ngaynhap);
			cmd.setString(8, NhaSanXuat);
			cmd.setString(9, maMP); // Thêm tham số để chỉ định mã sách cần cập nhật
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			
			return kq;
		}
	
	public int ThemLoai(String maLoai, String tenLoai) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//b2: tao cau lenh sql
		String sql = "INSERT INTO loai (maloai, tenloai)" + "VALUES(?,?)";
		//B3 tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,maLoai);
		cmd.setString(2,tenLoai);		
		int kq = cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
		return kq;
		
	}
	
	public void xoaLoai(String maLoai) throws Exception{
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		
		String sql = "DELETE FROM loai WHERE maloai = ?";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1, maLoai);
		
		cmd.executeUpdate();
		cmd.close();
		kn.cn.close();
	}
	

	
	public int CapNhatLoai(String maLoai, String tenLoai) throws Exception {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "UPDATE loai SET maloai =?, tenloai = ? WHERE maloai= ? ";
		
			
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1, maLoai);
			cmd.setString(2, tenLoai);			
			cmd.setString(3, maLoai); // Thêm tham số để chỉ định mã sách cần cập nhật
			
			int kq = cmd.executeUpdate();
			cmd.close();
			kn.cn.close();
			
			return kq;
		}
}
