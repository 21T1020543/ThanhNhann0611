package xacnhanmodal;

import java.sql.Date;

public class xacnhanbean {
	private String hoten;
	private Date Ngaymua;
	private Long SoLuongMua;
	private Long gia;
	private Long ThanhTien;
	private String mahoadon;
	private boolean damua;
	public xacnhanbean() {
		super();
	}
	public xacnhanbean(String hoten, Date ngaymua, Long soLuongMua, Long gia, Long thanhTien, String mahoadon,
			boolean damua) {
		super();
		this.hoten = hoten;
		Ngaymua = ngaymua;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.mahoadon = mahoadon;
		this.damua = damua;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public Date getNgaymua() {
		return Ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		Ngaymua = ngaymua;
	}
	public Long getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(Long soLuongMua) {
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
	public String getMahoadon() {
		return mahoadon;
	}
	public void setMahoadon(String mahoadon) {
		this.mahoadon = mahoadon;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
	
	
	
}
