package dao.boardmodule;
/**
 * @author Ȳ����
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Board;
import dto.Reply;


public class FreeBoard {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	/**
	 * DB����
	 * 
	 * */
	public FreeBoard(){
		try{
			pool = DBConnectionMgr.getInstance();
			con = pool.getConnection();
		}
		catch(Exception err){
			System.out.println("DBCP �ν��Ͻ� ���� ���� " + err);
		}
	}
	
	/**
	 * �Խ��� �� ��� - BoardWrite.jsp 
	 * 
	 * @param u_id ���� ���̵�
	 * @param b_title �� ����
	 * @param b_content �� ����
	 * @return b_num �� ��ȣ
	 * */
	public String regBoard(String u_id, String b_title, String b_content){
		String u_nickname ="";
		String sql = "select u_nickname from userinfo where u_id=?";
		int result = -1;
		String b_num = "";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				u_nickname = rs.getString("u_nickname");				
			}
		}
			catch(Exception err){
			System.out.println("regBoard ù��° Ʈ���̿��� ���� "+ err);
				err.printStackTrace();
			}
		
		sql = "insert into board(b_num, b_title, u_id, u_nickname, b_content, b_regdate, b_count)"
				+ "values('B'||LPAD((seq_b_num.NEXTVAL),4,'0'),?,?,?,?,sysdate,0)";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_title);
			pstmt.setString(2, u_id);
			pstmt.setString(3, u_nickname);
			pstmt.setString(4, b_content);
			result = pstmt.executeUpdate();
			
			// �� ��� ��, ��ϵ� ���� BoardRead.jsp�� �����ֱ� ���� b_num �ޱ�
			if(result == 1){
				sql = "select b_num from board where u_id = ? order by b_regdate desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, u_id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					b_num = rs.getString("b_num");
				}
			}
		}
		catch(Exception err){
			System.out.println("regBoard() 2��°���� ���� "+ err);
			err.printStackTrace();
		}
		finally{
			pool.freeConnection(con, pstmt);
		}
		return b_num;
	}
	
	/**
	 * �Խ��� �� ����Ʈ �������� - BoardList.jsp
	 * 
	 * @param keyword
	 * @param keyfield
	 * @return list �Խ��� �� ����Ʈ 
	 */
	public List<Board> getBoardList(String keyword, String keyfield){
		ArrayList list = new ArrayList();
		String sql = "";
			
		//�˻����
		if(keyword==null || keyword.equals("null") || keyword==""){
			sql = "select * from board order by b_num desc";
		}
		else{
			sql = "select * from board where " + keyfield + " like '%" + keyword + "%' order by b_num desc";
		}
			
		try{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				Board board = new Board();
				board.setB_num(rs.getString("b_num"));
				board.setB_title(rs.getString("b_title"));
				board.setU_nickname(rs.getString("u_nickname"));
				board.setB_regdate(rs.getString("b_regdate"));
				board.setB_count(rs.getInt("b_count"));
		
				list.add(board);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList()���� ���� "+ err);
			err.printStackTrace();
		}
		finally{
			if(pool!=null){
				pool.freeConnection(con, pstmt, rs);
			}
		}
		return list;
	}
	
	/**
	 * �� �������� -  BoardList.jsp, BoardRead.jsp, BoardUpdate.jsp
	 * 
	 * @param b_num
	 * @param isRead
	 * @return
	 */
	public Board getBoard(String b_num, boolean isRead){
		Board board = new Board();
		String sql = null;
		try{
			// ��ȸ�� ����
			if(isRead){
				sql = "update board set b_count = b_count+1 where b_num =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_num);
				pstmt.executeUpdate();
			}
	
			// �� ��  ��ȸ
			sql = "select * from board where b_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
	        rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	        	 board.setB_num(rs.getString("b_num").replace("\n", "<br>"));
	        	 board.setU_id(rs.getString("u_id"));
	        	 board.setB_count(rs.getInt("b_count"));
	        	 board.setU_nickname(rs.getString("u_nickname"));
	        	 board.setB_regdate(rs.getString("b_regdate"));
	        	 board.setB_title(rs.getString("b_title"));
	        	 board.setB_content(rs.getString("b_content"));
	         }
	         
	         // ���� ��, ���� ��
	         sql = "select b_num as prevnum, b_title as prevtitle from board where b_num = (select min(b_num) from board where b_num>?)";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, b_num);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	        	board.setPrevnum(rs.getString("prevnum"));
	         	board.setPrevtitle(rs.getString("prevtitle"));
	         }
	         sql = "select b_num as nextnum, b_title as nexttitle from board where b_num = (select max(b_num) from board where b_num<?)";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, b_num);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()){
	        	 board.setNextnum(rs.getString("nextnum"));
	        	 board.setNexttitle(rs.getString("nexttitle"));
	         }
		}
		catch(Exception err){
            System.out.println("getBoard():read���� ���� "+ err);
         }
         finally{
            pool.freeConnection(con, pstmt, rs);
         }
         return board;
	}
	
	/**
	 * �ۼ��� �ڽ��� �� ��ȸ�� ��ȸ�� ����
	 * 
	 * @param b_num �� ��ȣ
	 */
	public void minusCount(String b_num){
		String sql = "update board set b_count = b_count-1 where b_num =?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("minusCount()���� ���� "+ err);
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * �� ���� ó��
	 * 
	 * @param b_num �� ��ȣ
	 */
	public void deleteBoard(String b_num){
		String sql = "";
		
		sql = "delete from reply where b_num=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("ù��° deleteBoard()���� ���� "+ err);
	       err.printStackTrace();
	    }		
		
		sql = "delete from board where b_num=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("�ι�° deleteBoard()���� ����"+ err);
	       err.printStackTrace();
	    }
	    finally{
	      pool.freeConnection(con,pstmt);
	    }
	}
	
	/**
	 * �Խ��� ������Ʈ ó��
	 * 
	 * @param board �Խ��� dto
	 */
	public void updateBoard(Board board){
		String sql = "update board set b_title=?, b_content=? where b_num=?";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_num());
			pstmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("updateBoard()���� ����"+ err);
	        err.printStackTrace();
		}
		finally{
			pool.freeConnection(con,pstmt);
		}
	}
	
	/**
	 * ��۸�� ��������
	 * 
	 * @param b_num �� ��ȣ
	 * @return rep_list ��۸��
	 */
	public ArrayList<Reply> getReplyList(String b_num){
		ArrayList<Reply> rep_list = new ArrayList<Reply>();
		String sql = "select * from reply where b_num= ? order by r_reply";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Reply reply = new Reply();
				reply.setR_reply(rs.getString("r_reply"));
				reply.setB_num(rs.getString("b_num"));
				reply.setU_id(rs.getString("u_id"));
				reply.setR_content(rs.getString("r_content"));
				reply.setR_regdate(rs.getString("r_regdate"));
				
				rep_list.add(reply);
			}
		}
		catch(Exception err){
			System.out.println("getReplyList()���� ����"+ err);
			err.printStackTrace();
		}
		finally{
			 pool.freeConnection(con, pstmt, rs);
		}
		return rep_list;
	}
	
	/**
	 * ��� �Է�
	 * 
	 * @param reply ��� dto
	 */
	public void replyBoard(Reply reply){
		String sql = "insert into reply(r_reply, b_num, u_id, r_content, r_regdate) "
				+ "values('R'||LPAD((seq_r_reply.NEXTVAL),4,'0'),?,?,?,sysdate)";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getB_num());
			pstmt.setString(2, reply.getU_id());
			pstmt.setString(3, reply.getR_content());
			pstmt.executeUpdate();
		}
		catch(Exception err){
		      System.out.println("replyBoard()���� ���� : " + err);
		      err.printStackTrace();
		   }
		   finally{
		      pool.freeConnection(con, pstmt);
		   }
	}
	
	/**
	 * ��� ����
	 * 
	 * @param r_reply ��� ��ȣ
	 */
	public void deleteReply(String r_reply){
		String sql = "delete from reply where r_reply= ? ";
		
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_reply);
	        pstmt.executeUpdate();
		}
		catch(Exception err){
	       System.out.println("deleteReply()���� ����"+ err);
	       err.printStackTrace();
	    }
	    finally{
	       pool.freeConnection(con,pstmt);
	   }
	}
}
