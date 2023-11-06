package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static ProductDao instance = new ProductDao();
	
	public ProductDao(){
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,dbId,dbPw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ProductDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);
		
		return conn;
	}//getConnection
	
	
	public int inputProduct(MultipartRequest mr) throws Exception {
		conn = getConnection();
		int cnt = 0;

		String sql = "insert into kurlypro values(kulprod.nextval,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("ptitle"));
		ps.setString(2, mr.getParameter("pname"));
		ps.setString(3, mr.getFilesystemName("proimg"));
		ps.setInt(4, Integer.parseInt(mr.getParameter("count")));
		ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
		ps.setString(6, mr.getParameter("packaging"));
		ps.setString(7, mr.getParameter("origin"));
		ps.setInt(8, 0);
		
		cnt = ps.executeUpdate();

		return cnt;
	}

	public ArrayList<ProductBean> getAllProduct() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		conn = getConnection();
		String sql = "select * from kurlypro order by pnum";
		ps= conn.prepareStatement(sql);

		rs = ps.executeQuery();

		lists = makeArrayList(rs);

		return lists;
	}
	
	public ArrayList<ProductBean> getViewerProduct() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		conn = getConnection();
		String sql = "select * from kurlypro where viewer >= 10 order by viewer desc";
		ps= conn.prepareStatement(sql);

		rs = ps.executeQuery();

		lists = makeArrayList(rs);

		return lists;
	}
	
	public ArrayList<ProductBean> getPriceProduct() throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		conn = getConnection();
		String sql = "select * from kurlypro order by price";
		ps= conn.prepareStatement(sql);

		rs = ps.executeQuery();

		lists = makeArrayList(rs);

		return lists;
	}
	
	public ArrayList<ProductBean> getSeachProduct(String search) throws Exception{
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		conn = getConnection();
		String sql = "select * from kurlypro where pname like ?";
		ps= conn.prepareStatement(sql);
		ps.setString(1, '%'+search+'%');
		rs = ps.executeQuery();

		lists = makeArrayList(rs);

		return lists;
	}
	
	public ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		while(rs.next()) {
			ProductBean pb = new ProductBean();

			pb.setPnum(rs.getInt("pnum"));
			pb.setPtitle(rs.getString("ptitle"));
			pb.setPname(rs.getString("pname"));
			pb.setProimg(rs.getString("proimg"));
			pb.setPrice(rs.getInt("price"));
			pb.setCount(rs.getInt("count"));
			pb.setPackaging(rs.getString("packaging"));
			pb.setOrigin(rs.getString("origin"));
			pb.setViewer(rs.getInt("viewer"));

			lists.add(pb);
		}
		return lists;
	}

	public int deleteProduct(int pnum) throws SQLException {
		int cnt = -1;
		String sql = "delete from kurlypro where pnum = ?";

		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum); 
		cnt = ps.executeUpdate();

		return cnt;
	}

	public ProductBean selectProdNum(int pnum) throws Exception {
		int cnt = -1;
		String sql = "select * from kurlypro where pnum = ?";
		ProductBean pb = null;
		conn = getConnection();

		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);

		rs= ps.executeQuery();
		while(rs.next()) {
			pb = new ProductBean();

			pb.setPnum(rs.getInt("pnum"));
			pb.setPtitle(rs.getString("ptitle"));
			pb.setPname(rs.getString("pname"));
			pb.setProimg(rs.getString("proimg"));
			pb.setPrice(rs.getInt("price"));
			pb.setCount(rs.getInt("count"));
			pb.setPackaging(rs.getString("packaging"));
			pb.setOrigin(rs.getString("origin"));
			pb.setViewer(rs.getInt("viewer"));
		}

		return pb;
	}

	public int updateProduct(MultipartRequest mr, String img ) throws Exception{
		conn = getConnection();
		int cnt = -1;
		String sql = "update kurlypro set ptitle=?, pname=?, proimg=?, count=?, price=?, packaging=?, origin=?, viewer=? where pnum = ?";

		try {
			ps = conn.prepareStatement(sql);

			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("ptitle"));
			ps.setString(2, mr.getParameter("pname"));
			ps.setString(3, mr.getParameter("proimg"));
			ps.setInt(4, Integer.parseInt(mr.getParameter("count")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("packaging"));
			ps.setString(7, mr.getParameter("origin"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("viewer")));
			ps.setString(9, mr.getParameter("pnum"));

			cnt = ps.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();
		}
		return cnt;
	}//updateProduct
	
	public ProductBean selectProdpNum(int pnum) throws Exception {
		String sql = "select * from kurlypro where pnum = ?";
		String sql2 = "update kurlypro set viewer = viewer+1 where pnum = ?";
		ProductBean pb = null;
		conn = getConnection();

		ps = conn.prepareStatement(sql2);
		ps.setInt(1, pnum);
		ps.executeUpdate();
		
		ps = conn.prepareStatement(sql);
		ps.setInt(1, pnum);
		rs= ps.executeQuery();
		
		while(rs.next()) { 
			pb = new ProductBean();

			pb.setPnum(rs.getInt("pnum"));
			pb.setPtitle(rs.getString("ptitle"));
			pb.setPname(rs.getString("pname"));
			pb.setProimg(rs.getString("proimg"));
			pb.setPrice(rs.getInt("price"));
			pb.setCount(rs.getInt("count"));
			pb.setPackaging(rs.getString("packaging"));
			pb.setOrigin(rs.getString("origin"));
			pb.setViewer(rs.getInt("viewer"));
		}
		return pb;
	}
}
