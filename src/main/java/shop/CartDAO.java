package shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CartDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public static CartDAO instance = new CartDAO();

	public static CartDAO getInstance() {
		return instance;
	}

	public CartDAO() {

	}

	private Connection getConnection() throws Exception{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
		conn = ds.getConnection();
		System.out.println("conn:"+conn);

		return conn;
	}//getConnection
	
	
}
