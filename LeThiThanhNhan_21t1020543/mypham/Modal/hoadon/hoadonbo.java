package hoadon;

import java.util.Date;

public class hoadonbo {
	hoadondao hddao = new hoadondao();
	public int Them(long makh,Date Ngaymua,boolean damua) throws Exception{
		return hddao.Them(makh,Ngaymua,damua);
	}
	
	public long getMaxHd() throws Exception{
		return hddao.getMaxHd();
	}
	
	public long getDoanhThu() throws Exception{
		return hddao.getDoanhThu();
	}
	
	public long getSoLuongMyPhamBanRa() throws Exception{
		return hddao.getSoLuongMyPhamBanRa();
	}
}
