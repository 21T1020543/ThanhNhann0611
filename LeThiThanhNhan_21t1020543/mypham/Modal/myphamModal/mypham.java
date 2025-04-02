package myphamModal;

public class mypham {
	private String maMP;
	private String tenMP;
	private String nhaSanXuat;
	private Long gia;
	private Long soLuong;
	private String anh;
	private String maLoai;
	public mypham(String maMP, String tenMP, String nhaSanXuat, Long gia, Long soLuong, String anh, String maLoai) {
		super();
		this.maMP = maMP;
		this.tenMP = tenMP;
		this.nhaSanXuat = nhaSanXuat;
		this.gia = gia;
		this.soLuong = soLuong;
		this.anh = anh;
		this.maLoai = maLoai;
	}
	public mypham() {
		super();
	}
	public String getMaMP() {
		return maMP;
	}
	public void setMaMP(String maMP) {
		this.maMP = maMP;
	}
	public String getTenMP() {
		return tenMP;
	}
	public void setTenMP(String tenMP) {
		this.tenMP = tenMP;
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
	public Long getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(Long soLuong) {
		this.soLuong = soLuong;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getMaLoai() {
		return maLoai;
	}
	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}
	
}
