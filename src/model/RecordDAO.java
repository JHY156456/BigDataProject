package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class RecordDAO {
	
	public static ArrayList<RecordDTO> selectRecord() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<RecordDTO> all = null;
		
		try {
			con = DBUtil.getConnection();
			String sql = "select sren.latitude, sren.longitude, sret.latitude, sret.longitude, count(*) from station sren, record r, station sret " + 
					"where r.rentalno = sren.stationNo and r.returnNo = sret.stationNo " + 
					"group by r.rentalNo, r.returnNo,sren.latitude, sren.longitude, sret.latitude, sret.longitude " + 
					"having count(*) >= 5000";
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<RecordDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new RecordDTO(rset.getDouble(1), rset.getDouble(2), rset.getDouble(3), rset.getDouble(4), rset.getInt(5)));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
}
