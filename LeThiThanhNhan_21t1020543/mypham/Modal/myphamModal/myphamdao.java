package myphamModal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ketnoimodal.KetNoi;
import myphamModal.mypham;

public class myphamdao {
	public ArrayList<mypham> getMyPham()throws Exception{
		ArrayList<mypham> ds = new ArrayList<mypham>();
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String sql = "SELECT * FROM mypham";
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		//b3 duyet rs luu du lieu vaof ds
		while(rs.next()) {
			String maMP = rs.getString("maMP");
			String tenMP = rs.getString("tenMP");
			String nhaSanXuat = rs.getString("nhaSanXuat");
			Long gia = rs.getLong("gia");
			Long soLuong= rs.getLong("soluong");
			String anh = rs.getString("anh");
			String maLoai = rs.getString("maloai");
			
			ds.add(new mypham(maMP, tenMP, nhaSanXuat, gia, soLuong, anh, maLoai));	
		}
		rs.close();
		kn.cn.close();
		return ds;
	}
	
	public ArrayList<mypham> getMyPhamPhanTrang(int pageNumber) throws Exception {
	    ArrayList<mypham> ds = new ArrayList<mypham>();
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();
	    String sql = "SELECT * FROM mypham ORDER BY mamp OFFSET (? - 1)*9 ROWS FETCH NEXT 9 ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setInt(1, pageNumber);
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        String maMP = rs.getString("mamp");
	        String tenMP = rs.getString("tenmp");
	        String nhaSanXuat = rs.getString("nhasanxuat");
	        Long gia = rs.getLong("gia");
	        Long soLuong = rs.getLong("soluong");
	        String anh = rs.getString("anh");
	        String maLoai = rs.getString("maloai");

	        ds.add(new mypham(maMP, tenMP, nhaSanXuat, gia, soLuong, anh, maLoai));
	    }

	    rs.close();
	    kn.cn.close();
	    return ds;
	}
	
	
	public ArrayList<mypham> getMyPhamPhanTrangTheoLoai(int pageNumber,String category) throws Exception {
	    ArrayList<mypham> ds = new ArrayList<mypham>();
	    KetNoi kn = new KetNoi();
	    kn.ketnoi();
	    String sql = "SELECT * FROM mypham WHERE maloai = ? ORDER BY mamp OFFSET (? - 1)*9 ROWS FETCH NEXT 9 ROWS ONLY";
	    PreparedStatement cmd = kn.cn.prepareStatement(sql);
	    cmd.setString(1, category);
	    cmd.setInt(2, pageNumber);
	    ResultSet rs = cmd.executeQuery();
	    while (rs.next()) {
	        String maMP = rs.getString("mamp");
	        String tenMP = rs.getString("tenmp");
	        String nhaSanXuat = rs.getString("nhasanxuat");
	        Long gia = rs.getLong("gia");
	        Long soLuong = rs.getLong("soluong");
	        String anh = rs.getString("anh");
	        String maLoai = rs.getString("maloai");

	        ds.add(new mypham(maMP, tenMP, nhaSanXuat, gia, soLuong, anh, maLoai));
	    }

	    rs.close();
	    kn.cn.close();
	    return ds;
	}
	
	
	
	public int layTongSoLuongMyPham() throws Exception {
        KetNoi kn = new KetNoi();
        kn.ketnoi();

        try (
        	PreparedStatement cmd = kn.cn.prepareStatement("SELECT COUNT(*) FROM mypham");
            ResultSet rs = cmd.executeQuery()
        ) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } 
            kn.cn.close();
     

        return 0;
    }
	
	
	  public int layTongSoLuongMyPhamTheoLoai(String category) throws Exception {
	        KetNoi kn = new KetNoi();
	        kn.ketnoi();

	        try (
	            PreparedStatement cmd = kn.cn.prepareStatement("SELECT COUNT(*) FROM mypham WHERE maloai = ?");
	        ) {
	            cmd.setString(1, category);
	            ResultSet rs = cmd.executeQuery();

	            if (rs.next()) {
	                return rs.getInt(1);
	            }
	        } 
	            kn.cn.close();
	        return 0;
	    }
	  
	  public ArrayList<mypham> TimMyPhamTheoTuKhoa(String keyword) throws Exception {
	        KetNoi kn = new KetNoi();
	        kn.ketnoi();
	        ArrayList<mypham> ds = new ArrayList<>();

	        try (
	        		PreparedStatement cmd = kn.cn.prepareStatement("SELECT * FROM mypham WHERE tenmp LIKE ?");

	        ) {
	        	cmd.setString(1, "%" + keyword + "%");
	            ResultSet rs = cmd.executeQuery();

	            while (rs.next()) {
	                String maMP = rs.getString("mamp");
	    	        String tenMP = rs.getString("tenmp");
	    	        String nhaSanXuat = rs.getString("nhasanxuat");
	    	        Long gia = rs.getLong("gia");
	    	        Long soLuong = rs.getLong("soluong");
	    	        String anh = rs.getString("anh");
	    	        String maLoai = rs.getString("maloai");

	    	        ds.add(new mypham(maMP, tenMP, nhaSanXuat, gia, soLuong, anh, maLoai));
	            }
	        } 
	            kn.cn.close();
	        return ds;
	    }
	  
	  public int getSoLuongMyPhamHienCo() throws Exception {
		    KetNoi kn = new KetNoi();
		    kn.ketnoi();
		    String sql = "SELECT SUM(soluong) AS SoLuongMyPhamHienCo FROM mypham";
		    PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    ResultSet rs = cmd.executeQuery();
		    int soluongmypham = 0; // Biến để lưu số lượng khách hàng
		    if (rs.next()) {
		    	soluongmypham = rs.getInt("SoLuongMyPhamHienCo"); // Lấy giá trị từ cột SoLuongKhachHang
		    }
		    rs.close();
		    cmd.close(); // Đừng quên đóng PreparedStatement
		    kn.cn.close();
		    return soluongmypham;
		}
	  
	  public int getSoMyPhamDangHetHang() throws Exception {
		    KetNoi kn = new KetNoi();
		    kn.ketnoi();
		    String sql = "SELECT COUNT(mamp) AS SoMyPhamHetHang FROM sach WHERE soluong = 0";
		    PreparedStatement cmd = kn.cn.prepareStatement(sql);
		    ResultSet rs = cmd.executeQuery();
		    int soluongmypham = 0; // Biến để lưu số lượng khách hàng
		    if (rs.next()) {
		    	soluongmypham = rs.getInt("SoSachHetHang"); // Lấy giá trị từ cột SoLuongKhachHang
		    }
		    rs.close();
		    cmd.close(); // Đừng quên đóng PreparedStatement
		    kn.cn.close();
		    return soluongmypham;
		}
	  
}
