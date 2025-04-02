package adminmodal;

import java.util.ArrayList;

public class adminquanlybo {
	adminquanlydao aqldao = new adminquanlydao();
	public int ThemMyPham(String maMP, String tenMP,  Long soLuong, 
			Long gia,String maLoai, String anh, String ngaynhap, String nhaSanXuat) throws Exception{
		return aqldao.ThemMyPham(maMP, tenMP, soLuong, gia, maLoai, anh, ngaynhap, nhaSanXuat);
	}
	public void xoa(String maMP) throws Exception{
		 aqldao.xoa(maMP);
	}
	public int CapNhat(String maMP, String tenMP,  Long soLuong, 
			Long gia,String maLoai, String anh, String ngaynhap, String nhaSanXuat) throws Exception{
		return aqldao.CapNhat(maMP, tenMP, soLuong, gia, maLoai, anh, ngaynhap, nhaSanXuat);
	}
	
	public int ThemLoai(String maLoai, String temLoai) throws Exception{
		return aqldao.ThemLoai(maLoai, maLoai);
	}
	public void xoaLoai(String maLoai) throws Exception{
		 aqldao.xoaLoai(maLoai);
	}
	public int CapNhatLoai(String maLoai, String tenLoai) throws Exception{
		return aqldao.CapNhatLoai(maLoai,tenLoai);
	}
}
