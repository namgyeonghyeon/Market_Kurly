package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import shop.ProductBean;

public class OrderDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public static OrderDao instance = new OrderDao();
	
	public static OrderDao getInstance() {
		return instance;
	}
	
	public OrderDao() {
		
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);

		return conn;
	}//getConnection
	
	public int insertOrder(int memno, Vector<ProductBean> cv) throws Exception {
		conn = getConnection();
		String sql = "insert into orderdata values(order_seq.nextval,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		int cnt = 0;
		
		for(int i = 0; i < cv.size() ; i++) {
			ps.setInt(1, memno);
			ps.setInt(2, cv.get(i).getPnum());
			ps.setInt(3, cv.get(i).getCount());
			ps.setString(4, cv.get(i).getPtitle());
			ps.setString(5, cv.get(i).getProimg());
			ps.setInt(6, cv.get(i).getPrice());
			ps.setString(7, cv.get(i).getPackaging());
			ps.setString(8, cv.get(i).getOrigin());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			String pinputdate = sdf.format(today); 
			ps.setString(9, pinputdate);
			cnt += ps.executeUpdate();
		}
		return cnt;
	}
	
	public Vector<OrderBean> getOrderList(String id) throws Exception {
		conn = getConnection();
		Vector<OrderBean> lists = new Vector<OrderBean>();
		String sql = "select m.no, m.name, m.id, p.ptitle, p.proimg, p.price, TO_CHAR(o.buy_date, 'YYYY-MM-DD') as buy_date,o.qty, o.memno from (userdata m inner join orderdata o on m.no = o.memno)"
	            + "inner join kurlypro p on o.pnum = p.pnum where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		rs = ps.executeQuery();
		while(rs.next()) {
			OrderBean ob = new OrderBean(); 
			ob.setName(rs.getString("name"));
			ob.setId(rs.getString("id"));
			ob.setPtitle(rs.getString("ptitle"));
			ob.setProimg(rs.getString("proimg"));
			ob.setPrice(rs.getInt("price"));
			ob.setQty(rs.getInt("qty"));
			ob.setBuy_date(rs.getString("buy_date"));
			
			lists.add(ob);
		}
		return lists;
		
	}
}
