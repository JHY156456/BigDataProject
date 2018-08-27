package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class WidgetDAO {
	
	public static int selectUserCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		int all = 0;
		
		try {
			
			con = DBUtil.getConnection();
			
			String sql = "select count(*) from users"; 
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				all = rset.getInt(1);
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	public static int selectRecordCount() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		int all = 0;
		try {
			
			con = DBUtil.getConnection();
			
			String sql = "select count(*) from h_kickboard"; 
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				all = rset.getInt(1);
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
}
