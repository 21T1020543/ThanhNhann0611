package adminmodal;

import java.util.Date;

public class adminxacnhanbean {
	private String hoten;
	private Date NgayMua;
	private int SoLuongMua;
	private Long gia;
	private Long ThanhTien;
	private Long MaHoaDon;
	private boolean damua;
	public adminxacnhanbean(String hoten, Date ngayMua, int soLuongMua, Long gia, Long thanhTien, Long maHoaDon,
			boolean damua) {
		super();
		this.hoten = hoten;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		MaHoaDon = maHoaDon;
		this.damua = damua;
	}
	
	public adminxacnhanbean(String hoten, Date ngayMua, int soLuongMua, Long gia, Long thanhTien, Long maHoaDon
			) {
		super();
		this.hoten = hoten;
		NgayMua = ngayMua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		MaHoaDon = maHoaDon;

	}
	public adminxacnhanbean() {
		super();
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
	public Long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(Long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
	
}