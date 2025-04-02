package chitiethoadon;

import java.util.ArrayList;

import adminmodal.adminxacnhanbean;

public class chitiethoadonbo {
	chitiethoadondao ctdao = new chitiethoadondao();
	public int Them(String MaMP,long SoLuongMua,long MaHoaDon) throws Exception{
		return ctdao.Them(MaMP, SoLuongMua, MaHoaDon);
	}
	public ArrayList<adminxacnhanbean> getxacnhan() throws Exception{
		return ctdao.getxacnhan();
	}
	public int CapNhat(long mct) throws Exception{
		return ctdao.CapNhat(mct);
	}
	
	public void Xoa(Long mct) throws Exception {
		ctdao.xoaAdminXacNhan(mct);
	}
	public void Capnhatsoluong(Long mct, Long sl) throws Exception{
		ctdao.Capnhatsoluong(mct, sl);
	}
}
