package myphamModal;

import java.util.ArrayList;

import myphamModal.mypham;
import myphamModal.myphamdao;

public class myphambo {
	myphamdao mpdao = new myphamdao();
	ArrayList<mypham> ds;
	
	  public ArrayList<mypham> getMypham() throws Exception{ ds= mpdao.getMyPham(); return ds; }
	 
	
	public ArrayList<mypham> getMyphamPhanTrang(int PageNumber) throws Exception{
		ds=  mpdao.getMyPhamPhanTrang(PageNumber);
		return ds;
	}
	
	public int layTongSoLuongMyPham() throws Exception {   
        return mpdao.layTongSoLuongMyPham();
    }
    
    public int layTongSoLuongMyPhamTheoLoai(String category) throws Exception {
       
        return  mpdao.layTongSoLuongMyPhamTheoLoai(category);
    }

    public ArrayList<mypham> getMyPhamPhanTrangTheoLoai(int PageNumber, String category) throws Exception {
    	return  mpdao.getMyPhamPhanTrangTheoLoai(PageNumber, category);
    }
	
	
	
	
	
	public ArrayList<mypham> TimMa(String maLoai,int PageNumber) throws Exception{
		ArrayList<mypham> tam = new ArrayList<mypham>();
		 ArrayList<mypham> ds = getMyphamPhanTrang(PageNumber);
		 for (mypham s : ds) {
	            if (s.getMaLoai().toLowerCase().trim().equals(maLoai.toLowerCase().trim())) 
	                tam.add(s); // Nếu tìm thấy sách có mã loại khớp, thêm vào danh sách tạm
	            
	        }
		return tam;
	}
	
	public ArrayList<mypham> Tim(String key,int PageNumber) throws Exception{
		
			ArrayList<mypham> tam = new ArrayList<mypham>();
			 ArrayList<mypham> ds = getMyphamPhanTrang(PageNumber);
			  for (mypham mp : ds) {
				  if (mp.getTenMP().toLowerCase().trim().contains(key.toLowerCase().trim()) || 
						  mp.getNhaSanXuat().toLowerCase().trim().contains(key.toLowerCase().trim())) 
		                tam.add(mp); // Nếu tìm thấy sách có mã loại khớp, thêm vào danh sách tạm
		            
		        }
		
		return tam;
	}
	
	 public ArrayList<mypham> TimMyPhamTheoTuKhoa(String keyword) throws Exception {
	        return mpdao.TimMyPhamTheoTuKhoa(keyword);
	    }
	 
	 public int getSoLuongMyPhamHienCo() throws Exception{
			return mpdao.getSoLuongMyPhamHienCo();
		}
	 public int getSoMyPhamDangHetHang() throws Exception{
			return mpdao.getSoMyPhamDangHetHang();
		}
}
