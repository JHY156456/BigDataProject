package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;

public class LoginDAO {

	public static boolean duplicateIdEmailCheck(String user_id, String user_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isDuplicate = true;
		try {
			con = DBUtil.getConnection();
			String sql = "select * from USERS where EMAIL = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				isDuplicate = true;
			} else {
				isDuplicate = false;
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return isDuplicate;
	}

	public static boolean duplicateIdCheck(String user_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		boolean isDuplicate = true;
		try {
			con = DBUtil.getConnection();
			String sql = "select * from USERS where ID = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				isDuplicate = true;
			} else {
				isDuplicate = false;
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return isDuplicate;
	}

	public void insertMember(UserDTO bean) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			con = DBUtil.getConnection();
			String sql = "insert into users values (?,?,?,?,?,?,?,?)";
			System.out.println("??" + bean.toString());
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getAddr());
			pstmt.setInt(4, bean.getAge());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getGender());
			pstmt.setString(7, bean.getName());
			pstmt.setString(8, bean.getNation());

			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(con, pstmt, rset);
		}
	}

	public int loginCheck(UserDTO bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select passwd from users where Id = ?";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				if (rset.getString(1).equals(bean.getPasswd()))
					return 1;
				else
					return 0;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;

	}
}
