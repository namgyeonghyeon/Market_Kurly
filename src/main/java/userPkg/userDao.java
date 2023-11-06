package userPkg;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class userDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static userDao instance = new userDao();
	
	public userDao(){
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,dbId,dbPw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static userDao getInstance() {
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
	
	public ArrayList<userBean> selectAllData(){
		ArrayList<userBean> lists = new ArrayList<userBean>();
		String sql = "select * from userdata order by asc";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int no = Integer.parseInt(rs.getString("no"));
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String passwdcheck = rs.getString("passwdcheck");
			String name = rs.getString("name");
			String email = rs.getString("email");
			int tel1 = Integer.parseInt(rs.getString("tel1"));
			int tel2 = Integer.parseInt(rs.getString("tel2"));
			int tel3 = Integer.parseInt(rs.getString("tel3"));
			String job = rs.getString("job");
			
			userBean ud = new userBean();
			ud.setNo(no);
			ud.setId(id);
			ud.setPasswd(passwd);
			ud.setPasswdcheck(passwdcheck);
			ud.setName(name);
			ud.setEmail(email);
			ud.setTel1(tel1);
			ud.setTel2(tel2);
			ud.setTel3(tel3);
			ud.setJob(job);
			
			lists.add(ud);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public boolean searchId(String id) throws Exception {
		conn = getConnection();
		boolean isCheck = false;
		String sql = "select id from userdata where id = ?";
		
		try {
			ps = conn.prepareCall(sql);
			ps.setString(1, id);
			
	        rs = ps.executeQuery();
			
			if(rs.next()) {
				isCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isCheck;
	}
	
	public int insertuser(userBean ub) {
		int cnt = -1;
		String sql = "insert into userdata values(suser_seq.nextval,?,?,?,?,?,?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, ub.getId());
			ps.setString(2, ub.getPasswd());
			ps.setString(3, ub.getPasswdcheck());
			ps.setString(4, ub.getName());
			ps.setString(5, ub.getEmail());
			ps.setInt(6, ub.getTel1());
			ps.setInt(7, ub.getTel2());
			ps.setInt(8, ub.getTel3());
			ps.setString(9, ub.getJob());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public userBean getUserInfo(String id, String passwd) throws Exception {
		conn = getConnection();
		userBean ub = null;
		String sql = "select * from userdata where id = ? and passwd = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, passwd);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			ub = getUserBean(rs);
		}
		return ub;
	}
	
	public userBean getMemberByNameAndEmail(String name, String email) throws Exception {
		conn = getConnection();
		userBean mb = null;
		String sql = "select * from userdata where name = ? and email = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, email);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			mb = getUserBean(rs);
		}
		return mb;
	}
	
	public userBean getMemberByIdAndNameAndEmail(String id, String name, String email) throws Exception {
		conn = getConnection();
		userBean mb = null;
		String sql = "select * from userdata where id = ? and name = ? and email = ?";
		
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, email);
		
		rs = ps.executeQuery();
		if(rs.next()) {
			mb = getUserBean(rs);
		}
		return mb;
	}
	
	public userBean getUserBean(ResultSet rs) throws SQLException{
		userBean ub = new userBean();
		ub.setNo(rs.getInt("no"));
		ub.setId(rs.getString("id"));
		ub.setPasswd(rs.getString("passwd"));
		ub.setPasswdcheck(rs.getString("passwdcheck"));
		ub.setName(rs.getString("name"));
		ub.setEmail(rs.getString("email"));
		ub.setTel1(rs.getInt("tel1"));
		ub.setTel2(rs.getInt("tel2"));
		ub.setTel3(rs.getInt("tel3"));
		ub.setJob(rs.getString("job"));
		
		return ub;
	}
}
