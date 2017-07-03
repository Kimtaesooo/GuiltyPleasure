package dao.quizmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DBConnectionMgr;
/**
 * ����Ʈ�� �����ϱ����� db�� �����Ǵ� Ŭ����
 * */
public class GetPoint {
	DBConnectionMgr db;
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	/**
	 * db�� �����ϴ� Ŭ����
	 * */
	public GetPoint() {
		try {
			db = DBConnectionMgr.getInstance();
			con = db.getConnection();
		} catch (Exception e) {
			System.out.println("����Ʈ������ ���� ��񿬰� ����");
		}
	}
	
	/**
	 * @param String id�� �Ű������� ����
	 * 
	 * */
	public int SavePoint(String id){
		String sql = "update USERINFO set U_POINT = U_POINT + 10 where U_ID = ?";
		int  i = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.freeConnection(con, psmt, rs);
		}
		return i;
	}
	
	/**
	 * @param String  ���� id�� �Ű������� ����
	 * @param int �����Ŀ��� ���� point�� �Ű������� ����
	 * */
	public int SavePoint(String id, int point){
		String sql = "update USERINFO set U_POINT = U_POINT + ? where U_ID = ?";
		int  i = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, point);
			psmt.setString(2, id);
			i = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.freeConnection(con, psmt, rs);
		}
		return i;
	}
	
	
}
