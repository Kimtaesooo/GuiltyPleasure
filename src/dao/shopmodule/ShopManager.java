package dao.shopmodule;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbcp.DBConnectionMgr;
import dto.Shop;
import dto.UserInfo;
import dto.UserInfoDTO;

public class ShopManager {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DBConnectionMgr pool;

	public ShopManager() {
		try {
			pool = DBConnectionMgr.getInstance();

		} catch (Exception err) {
			System.out.println("DBCP �ν��Ͻ� ���� ����:" + err);
		} finally {

		}
	}

	private static ShopManager instance = new ShopManager();

	public static ShopManager getInstance() {
		return instance;
	}

	// ������ ����
	public void updateItem(Shop dto) {
		try {
			String sql = "update shop set s_itemname=?,s_price=?, s_deadline=?,s_limit_num=?,s_content=? where s_itemcode=?";

			con = pool.getConnection();

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getS_itemname());
			pstmt.setInt(2, dto.getS_price());
			pstmt.setInt(3, dto.getS_deadline());
			pstmt.setInt(4, dto.getS_limit_num());
			pstmt.setString(5, dto.getS_content());
			pstmt.setString(6, dto.getS_itemcode());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("updateItem()���� ����");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ������ �߰�
	public void addItem(Shop dto) {
		try {
			String sql = "Insert into shop (s_itemcode, s_itemname,s_price,s_deadline,s_limit_num,s_limit_pow,s_content) values('SIC'||LPAD((seq_s_itemcode.NEXTVAL),4,'0'),?,?,?,?,'',?)";

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getS_itemname());
			pstmt.setInt(2, dto.getS_price());
			pstmt.setInt(3, dto.getS_deadline());
			pstmt.setInt(4, dto.getS_limit_num());
			pstmt.setString(5, dto.getS_content());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("addItem():" + err);
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// �����ۼ���
	public Shop selectOneItemByCode(String s_itemcode) {
		String sql = "select * from shop WHERE s_itemcode=?";
		Shop dto = null;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_itemcode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new Shop();
				dto.setS_itemcode(rs.getString("s_itemcode"));
				dto.setS_itemname(rs.getString("s_itemname"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_deadline(rs.getInt("s_deadline"));
				dto.setS_limit_num(rs.getInt("s_limit_num"));
				dto.setS_limit_pow(rs.getInt("s_limit_pow"));
				dto.setS_content(rs.getString("s_content"));
			}
			System.out.println(dto.getS_deadline());
		} catch (Exception err) {
			System.out.println("getItemList()��������");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}

	// ������ ���ű�� 1 �����۱����ĳ�������Ʈ�� ������������
	public void setUserPoint(String u_id, int u_point) {

		String sql = "update userinfo set u_point=? where u_id = ?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u_point);
			pstmt.setString(2, u_id);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("setUserPoint���� ����");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

	}

	// ������ ���ű��2 ������ ���� -1
	public void minusOneItem(String s_itemcode, int s_limit_num) {
		String sql = "update shop set s_limit_num=? where s_itemcode=?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, s_limit_num - 1);
			pstmt.setString(2, s_itemcode);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("minusOneByCode()��������");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ������ ���ű��3 ���ų�������Ʈ�� �߰�
	public void addPurchaseList(String u_id, Shop dto) {
		try {
			String sql = "insert into purchase values('P'||LPAD((seq_p_buy_code.NEXTVAL),4,'0'),?,?,?,sysdate,sysdate+?,?)";

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, dto.getS_itemcode());
			pstmt.setString(3, dto.getS_itemname());
			pstmt.setInt(4, dto.getS_deadline());
			System.out.println(dto.getS_deadline() + "�������");
			pstmt.setInt(5, dto.getS_price());
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("addItem():" + err);
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ������ ���ű��4 ������ ������ ��� �߰�
	public void addItemFunction(String u_id, Shop dto) {
		String sql = "";
		try {
			if (dto.getS_itemcode().equals("SIC0001")) {
				sql = "update u_battle set ub_lose=ub_lose-10 where u_id = ?";
			} else if (dto.getS_itemcode().equals("SIC0002")) {
				sql = "update u_battle set ub_win=ub_win+10 where u_id = ?";
			} else if (dto.getS_itemcode().equals("SIC0003")) {
				sql = "update u_poa set up_wa_cnt=up_wa_cnt-1 where u_id = ?";
			} else {
				return;
			}

			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("addItemFunction():" + err);
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ������ ���ű��(�г��Ӻ���)
	public void editNickname(String u_id, String nickname) {

		String sql = "update userinfo set u_nickname=? where u_id = ?";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, u_id);
			pstmt.executeUpdate();

		} catch (Exception err) {
			System.out.println("editNickname():" + err);
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ������ ����
	public void deleteItemByCode(String s_itemcode) {
		String sql = "delete shop WHERE s_itemcode=?";
		Shop dto = null;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_itemcode);
			pstmt.executeUpdate();
		} catch (Exception err) {
			System.out.println("getItemList()��������");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ��ü����Ʈ���
	public List getItemList() {
		ArrayList list = new ArrayList();
		String sql = "select * from shop order by s_itemcode";
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Shop dto = new Shop();
				dto.setS_itemcode(rs.getString("s_itemcode"));
				dto.setS_itemname(rs.getString("s_itemname"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_deadline(rs.getInt("s_deadline"));
				dto.setS_limit_num(rs.getInt("s_limit_num"));
				dto.setS_limit_pow(rs.getInt("s_limit_pow"));
				dto.setS_content(rs.getString("s_content"));
				list.add(dto);
			}
		} catch (Exception err) {
			System.out.println("getItemList()��������");
			err.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}

}
