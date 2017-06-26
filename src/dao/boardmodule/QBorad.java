package dao.boardmodule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.DBConnectionMgr;
import dto.U_Quiz;

public class QBorad {
	DBConnectionMgr dbm = null;
	Connection con = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String confrim = null;

	public QBorad() {
		try {
			dbm = DBConnectionMgr.getInstance();
			con = dbm.getConnection();
		} catch (Exception e) {
			System.out.println("���� ���� " + e);
		}
	}

	// ������ �Խ��ǿ� id�� �ش��ϴ� �� �ִ��� üũ
	public String checkBoard(String id) {
		try {
			String check = "select u_id from U_QREG where u_id =?";
			psmt = con.prepareStatement(check);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next() == true) {
				confrim = "����";
			} else {
				confrim = "����";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return confrim;
	}

	//�Խ��� Ŭ���� �󼼳����� �ҷ����� �޼���
	public U_Quiz getU_Quzi(String id){
		U_Quiz uqinform = new U_Quiz();
		String sql = "select * from U_QREG where UQ_NUM=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()){
				uqinform.setQ_type(rs.getString("Q_TYPE"));
				uqinform.setU_id(rs.getString("UQ_NUM"));
				uqinform.setUq_adopt(rs.getString("UQ_ADOPT"));
				uqinform.setUq_answer(rs.getString("UQ_ANSWER"));
				uqinform.setUq_num(rs.getString("UQ_NUM"));
				uqinform.setUq_question(rs.getString("UQ_QUESTION"));
				uqinform.setUq_regdate(rs.getString("UQ_REGDATE"));
				uqinform.setUq_wa_a(rs.getString("UQ_WA_A"));
				uqinform.setUq_wa_b(rs.getString("UQ_WA_B"));
				uqinform.setUq_wa_c(rs.getString("UQ_WA_C"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return uqinform;
	}
	
	
	// ��ü ����Ʈ�� �������� �޼���
		public ArrayList getQBoard(String id) {
			// sql 2�� ; �ϳ��� ������ ����������, �ϳ��� �����Ͱ� ����������
			// �����Ͱ� ���������� �� ������ ���, ������ �������� �� �� ������ �ش��ϴ�

			ArrayList qlist = new ArrayList<>();
			U_Quiz uq = null;
			String sql;
			String check = "�׽�Ʈ";
			if (!id.equals("master"))
				check = checkBoard(id);
			try {
				if (id.equals("master")) {
					//�������϶�
					sql = "select * from u_qreg order by uq_adopt";
					psmt = con.prepareStatement(sql);
					rs = psmt.executeQuery();
				} else if (check != null) {
					//�����̰� ����� ��� ��������
					sql = "select * from u_qreg where u_id = ? order by uq_adopt";
					psmt = con.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					while (rs.next()) {
						uq = new U_Quiz();
						uq.setQ_type(rs.getString("Q_TYPE"));
						uq.setU_id(rs.getString("U_ID"));
						uq.setUq_adopt(rs.getString("UQ_ADOPT"));
						uq.setUq_answer(rs.getString("UQ_ANSWER"));
						uq.setUq_num(rs.getString("UQ_NUM"));
						uq.setUq_question(rs.getString("UQ_QUESTION"));
						uq.setUq_regdate(rs.getString("UQ_REGDATE"));
						uq.setUq_wa_a(rs.getString("UQ_WA_A"));
						uq.setUq_wa_b(rs.getString("UQ_WA_B"));
						uq.setUq_wa_c(rs.getString("UQ_WA_C"));
						qlist.add(uq);
					}
				} else if(check==null){
					//���������� ��� � �������
					qlist = null;
				}
			} catch (SQLException e) {
				System.out.println("������ �Խ����� ���� ������ ���" + e);
				e.printStackTrace();
			} finally {

			}

			return qlist;

		}

}
