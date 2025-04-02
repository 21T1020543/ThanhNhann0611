package giohangmodal;

public class hang {
	public String mamp;
	public String tenmp;
	public Long gia;
	public Long soluong;
	public Long thanhtien;
	public hang() {
		super();
	}
	public hang(String mamp, String tenmp, Long gia, Long soluong) {
		super();
		this.mamp = mamp;
		this.tenmp = tenmp;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = soluong*gia;
	}
	public String getMamp() {
		return mamp;
	}
	public void setMamp(String mamp) {
		this.mamp = mamp;
	}
	public String getTenmp() {
		return tenmp;
	}
	public void setTenmp(String tenmp) {
		this.tenmp = tenmp;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public Long getThanhtien() {
		return soluong*gia;
	}
	public void setThanhtien(Long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
}
