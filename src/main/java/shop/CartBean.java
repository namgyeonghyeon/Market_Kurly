package shop;

import java.util.Vector;

public class CartBean { // 장바구니
	private Vector<ProductBean> clist;
	
	public CartBean() {
		clist = new Vector<ProductBean>();
	}//CartBean
	
	public void addProduct(int pnum, int oqty) throws Exception{
		System.out.println(pnum+"/"+oqty); // 12,2
		// 10,3
		ProductBean pb = null;
		ProductDao pdao = ProductDao.getInstance();
		
		pb = pdao.selectProdNum(pnum);   
		
		for(int i=0;i<clist.size();i++) {
//			0:3,1
//			1:10,1
			int cPnum = clist.get(i).getPnum();
			if(cPnum == pnum) {
				int cPqty = clist.get(i).getCount();
				clist.get(i).setCount(cPqty+oqty);
				return;
			}//if
		}//for
		
		pb.setCount(oqty); 
		clist.add(pb);
		System.out.println("clist.size():"+clist.size());
		
		for(int i=0;i<clist.size();i++) {
			System.out.println(clist.get(i).getPnum());
			System.out.println(clist.get(i).getPname());
			System.out.println(clist.get(i).getCount());
		}
	}//addProduct=>
	
	public Vector<ProductBean> getAllProducts() {
		return clist;
	}//getAllProducts
	

	public void deleteProduct(int pnum){
		for(ProductBean pb : clist) {
			if(pb.getPnum() == pnum) {
				clist.removeElement(pb);
				break;
			}
		}
	}//deleteProduct
	
	public void removeAllProducts(){
		clist.removeAllElements();
	}//removeAllProducts
	
	public void setUpdate(String pnum,String count){
		for( ProductBean pb : clist) {
			if(pb.getPnum() == Integer.parseInt(pnum)) {
				if(Integer.parseInt(count) == 0) {
					clist.removeElement(pb);
					break;
				}else {
					pb.setCount(Integer.parseInt(count));
					break;
				}
			}
		}
	}
}






