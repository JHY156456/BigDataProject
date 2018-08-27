package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class DistrictDAO {

	public static ArrayList<DistrictDTO> selectHDistrict(String district) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<DistrictDTO> all = null;
		
		try {
			
			con = DBUtil.getConnection();
			String sql = "select stationID, stationName,holdNum, boardNum from h_station where district='" + district + "'";
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<DistrictDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new DistrictDTO(rset.getString(1),rset.getString(2),0,0,rset.getInt(3),rset.getInt(4)));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
}
