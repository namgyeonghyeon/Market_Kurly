package board;
import java.sql.*;
import java.util.ArrayList;

public class BoardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbId = "sqlid";
	String dbPw = "sqlpw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static BoardDao instance = new BoardDao();
	
	private BoardDao() {
		try {
			Class.forName(driver);
			
			conn = DriverManager.getConnection(url,dbId,dbPw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public static BoardDao getInstance() {

		return instance;
	}
	
	public ArrayList<BoardBean> getArticles(int start, int end){
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content " ;		        
		sql += "from (select rownum as rank, num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from (select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from review  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = Integer.parseInt(rs.getString("num"));
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = Integer.parseInt(rs.getString("readcount"));
				int ref = Integer.parseInt(rs.getString("ref"));
				int re_step = Integer.parseInt(rs.getString("re_step"));
				int re_level = Integer.parseInt(rs.getString("re_level"));
				String content = rs.getString("content");
				
				BoardBean bb = new BoardBean();
				bb.setNum(num);
				bb.setWriter(writer);
				bb.setSubject(subject);
				bb.setPasswd(passwd);
				bb.setReg_date(reg_date);
				bb.setReadcount(readcount);
				bb.setRef(ref);
				bb.setRe_step(re_step);
				bb.setRe_level(re_level);
				bb.setContent(content);
				
				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public int getArticleCount() {
		String sql = "select count(*) as cnt from review";
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int inserArticle(BoardBean bb) {//원글쓰기
		int cnt = -1;
		String sql = "insert into review(num,writer,subject,passwd,"
				+ "reg_date,ref,re_step,re_level,content) "
				+ "values(review_seq.nextval,?,?,?,?,review_seq.currval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getPasswd());
			ps.setTimestamp(4, bb.getReg_date());
			ps.setInt(5, 0);
			ps.setInt(6, 0);
			ps.setString(7, bb.getContent());

			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public BoardBean getArticle(int num) {
		String sql = "select * from review where num = ?";
		String sql2 = "update review set readcount = readcount+1 where num = ?";
		BoardBean bb = null;
		
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bb;
	}
	
	public BoardBean getArticleByNum(int num) {
		String sql = "select * from review where num = ?";
		BoardBean bb = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bb;
	}
	
	public int deleteArticle(int num, String passwd) {
		int cnt = -1;
		String sql = "select passwd from review where num = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					sql = "delete from review where num = ?";
					
					ps = conn.prepareStatement(sql);
					ps.setInt(1, num);
					
					cnt = ps.executeUpdate();
				}else {
					cnt = 0;
				}
			}else {
				cnt = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int updateArticle(String writer, String subject, String content, int num, String passwd) {
		
		int cnt = -1;
		String sql = "select passwd from review where num = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					sql = "update review set writer = ?, subject = ?, content = ? where num = ?";
					
					ps = conn.prepareStatement(sql);
					ps.setString(1, writer);
					ps.setString(2, subject);
					ps.setString(3, content);
					ps.setInt(4, num);
					
					cnt = ps.executeUpdate();
				}else {
					cnt = 0;
				}
			}else {
				cnt = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int replyArticle(BoardBean bb) {
		int cnt = -1;
		String sql = "update review set re_step = re_step+1 where ref=? and re_step > ?";
		String sql2 ="insert into review(num,writer,subject,passwd,"
				+ "reg_date,ref,re_step,re_level,content) "
				+ "values(review_seq.nextval,?,?,?,?,?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			
			ps.executeUpdate();
			int re_step = bb.getRe_step()+1;
			int re_level = bb.getRe_level()+1;
			
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getPasswd());
			ps.setTimestamp(4, bb.getReg_date());
			ps.setInt(5, bb.getRef());
			ps.setInt(6, re_step);
			ps.setInt(7, re_level);
			ps.setString(8, bb.getContent());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
}