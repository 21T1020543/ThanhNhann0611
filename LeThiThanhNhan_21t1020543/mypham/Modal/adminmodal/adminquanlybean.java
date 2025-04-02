package adminmodal;

public class adminquanlybean {
	private String mamp;
	private String tenmp;
	private String nhaSanXuat;
	private Long gia;
	private Long soluong;
	
	private String maloai;
	private String anh;
	private String ngaynhap;
	public adminquanlybean(String mamp, String tenmp, String nhaSanXuat, Long gia, Long soluong, String maloai,
			String anh, String ngaynhap) {
		super();
		this.mamp = mamp;
		this.tenmp = tenmp;
		this.nhaSanXuat = nhaSanXuat;
		this.gia = gia;
		this.soluong = soluong;
		this.maloai = maloai;
		this.anh = anh;
		this.ngaynhap = ngaynhap;
	}
	public adminquanlybean() {
		super();
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
	public String getNhaSanXuat() {
		return nhaSanXuat;
	}
	public void setNhaSanXuat(String nhaSanXuat) {
		this.nhaSanXuat = nhaSanXuat;
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
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getNgaynhap() {
		return ngaynhap;
	}
	public void setNgaynhap(String ngaynhap) {
		this.ngaynhap = ngaynhap;
	}
	
} 
