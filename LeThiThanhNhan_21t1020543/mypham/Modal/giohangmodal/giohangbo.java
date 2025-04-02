package giohangmodal;

import java.util.ArrayList;

public class giohangbo {
public ArrayList<hang> ds = new ArrayList<hang>();
	
	public ArrayList<hang> getDs() {
		return ds;
	}

	public void Them(String mamp, String tenmp, Long gia, Long soluong) {
		for(hang h : ds) {
			if(h.getMamp().equals(mamp)) {
				h.setSoluong(h.getSoluong()+soluong);
				return;
			}
		}
		
		ds.add(new hang(mamp, tenmp, gia, soluong));
	}
	
	public void Xoa(String mamp) {
		for(hang h : ds) {
			if(h.getMamp().equals(mamp)) {
				ds.remove(h);
				break;
			}
		}
	}
	
	public void Sua(String mamp, Long soluongMoi) {
	    for (hang h : ds) {
	        if (h.getMamp().equals(mamp)) {
	            h.setSoluong(soluongMoi); // Cập nhật lại số lượng
	            break;
	        }
	    }
	}
	
	
	public long Tong() {
		long s = 0;
		for(hang h : ds) 
			s = s + h.getThanhtien();
			return s;
		
	}
}
