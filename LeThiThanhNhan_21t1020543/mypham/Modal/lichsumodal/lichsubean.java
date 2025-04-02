package lichsumodal;

import java.util.Date;

public class lichsubean {
	private String hoten;
	private String tenmp;
	private Long SoLuongMua;
	private Long gia;
	private Long ThanhTien;
	private Date NgayMua;
	private boolean damua;
	private Long makh;
	public lichsubean() {
		super();
	}
	public lichsubean(String hoten, String tenmp, Long soLuongMua, Long gia, Long thanhTien, Date ngayMua,
			boolean damua, Long makh) {
		super();
		this.hoten = hoten;
		this.tenmp = tenmp;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		NgayMua = ngayMua;
		this.damua = damua;
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTenmp() {
		return tenmp;
	}
	public void setTenmp(String tenmp) {
		this.tenmp = tenmp;
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
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	public Long getMakh() {
		return makh;
	}
	public void setMakh(Long makh) {
		this.makh = makh;
	}
	@Override
	public String toString() {
		return "lichsubean [hoten=" + hoten + ", tenmp=" + tenmp + ", SoLuongMua=" + SoLuongMua + ", gia=" + gia
				+ ", ThanhTien=" + ThanhTien + ", NgayMua=" + NgayMua + ", damua=" + damua + ", makh=" + makh + "]";
	}
	
	
	
	
}
