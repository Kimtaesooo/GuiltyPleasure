package dao.noticemodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Notice;
import dto.c_board;
import dto.u_battle;

/**
 * �������׿� ���� Ŭ�����Դϴ�.
 */
public class notice {
	/**
	 * @param String sql �������� �����ų �����Դϴ�.
	 */
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	//������ ���� ����
	private String sql = "";
	
	public notice(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DBCP �ν��Ͻ� ���� ���� : "+err);
		}
	}
	//���� �г��� �������� �޼���
	public String getUserNick (String u_id){
		/**
		 * �г��� ��ȯ �޼��� �Դϴ�.
		 * @param String nickname �г��� ���� �����Դϴ�.
		 * @return String nickname ������� �г����� ��ȯ�մϴ�.
		 */
		String nickname=null;
		sql = "select * from userinfo where U_ID='"+u_id+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				nickname = rs.getString("u_nickname");
			}
		}
		catch(Exception err){
			System.out.println("getUserNickn() ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return nickname;
	}
	//�� ���
	public void regN_board(Notice dto){
		/**
		 * �� ��� �޼��� �Դϴ�.
		 */
		sql = "INSERT INTO NOTICE (N_NUM, U_ID, U_NICKNAME, N_TITLE, N_CONTENT, N_REGDATE, N_COUNT, N_IMPORTANT)"+
		" VALUES (seq_n_num.NEXTVAL,"+
		" ?,?,?,?,sysdate,'0','0')";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getU_id());
			//�ۼ��ڴ� ������ ���
			pstmt.setString(2, "���");
			pstmt.setString(3, dto.getN_title());
			pstmt.setString(4, dto.getN_content());
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("regN_boadr() ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//�Խ��� �ѷ��ֱ�
	public List getBoardList(String id, String type, String key){
		/**
		 * �Խ��� ����� �������� �޼ҵ��Դϴ�.
		 * @return List list �Խ��� ����� ��ȯ�մϴ�.
		 */
		ArrayList list = new ArrayList();
		
		if (key.length() == 0 || key == null) {
			sql = "select * from notice order by n_regdate desc";
		} else {
			sql = "select * from notice where "+type+" like '%" + key
					+ "%' order by n_regdate desc";
		}
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				Notice dto = new Notice();
				dto.setN_num(rs.getString("n_num"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_regdate(rs.getString("n_regdate"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setN_count(rs.getInt("n_count"));
				list.add(dto);
				}
		}
		catch(Exception err){
			System.out.println("noticeList �������� ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return list;
	}
	//���б�
	public Notice getRead (String num){
		/**
		 * �� �б� �޼ҵ� �Դϴ�.
		 * @return Notice dto �������� dto �� ��ȯ�մϴ�.
		 */
		Notice dto = new Notice();
		
		sql = "select * from notice where n_num='"+num+"'";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_regdate(rs.getString("n_regdate"));
				dto.setU_id(rs.getString("u_id"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setN_count(rs.getInt("n_count"));
				}
		}
		catch(Exception err){
			System.out.println("getRead() ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return dto;
	}
	
	//��ȸ������
	public void N_Count_Update(String num){
		/**
		 * ��ȸ�� ���� �޼����Դϴ�.
		 */
		sql = "UPDATE NOTICE SET N_COUNT=N_COUNT+1 WHERE N_NUM='"+num+"'";
		try{
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		}
		catch(Exception err){
			System.out.println("N_Count_Update() ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
	}
	//���� ��й�ȣ ��������
	public String getUserPw (String u_id){
		/**
		 * ���� ��й�ȣ �������� �޼ҵ��Դϴ�.
		 * @param String as ��й�ȣ ���忡 ���� ���� �Դϴ�.
		 * @return String as ��й�ȣ�� ��ȯ�մϴ�.
		 */
		String as=null;
		sql = "select * from userinfo where U_ID='"+u_id+"'";
		try{	
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){		
				as = rs.getString("u_pw");
				}
		}
		catch(Exception err){
			System.out.println("getUserPw() ���� ���� : "+err);
		}
		finally{
			pool.freeConnection(con,pstmt, rs);
		}
		return as;
	}
	
	//�� �����
	public void deleteBoard(String n_num){
		/**
		 * �� ����� �޼ҵ��Դϴ�.
		 */
		String sql = "delete from NOTICE where n_num=?";
		try{
			
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n_num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("deleteBoard()���� ����");
	       err.printStackTrace();
	    }
	    finally{
	      pool.freeConnection(con,pstmt);
	    }
	}
}
