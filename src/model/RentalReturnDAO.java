package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class RentalReturnDAO {

	public static ArrayList<RentalReturnDTO> selectRentalReturn() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<RentalReturnDTO> all = null;
		
		try {
			con = DBUtil.getConnection();
			String sql = "select st.latitude, st.longitude, sum(ren.rentNum),sum(ret.returnNum) from station st,rent ren,return ret where st.stationNo = ren.stationNo and st.stationNo = ret.stationNo group by st.stationNo, st.latitude, st.longitude";
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<RentalReturnDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new RentalReturnDTO(rset.getDouble(1), rset.getDouble(2), rset.getInt(3), rset.getInt(4)));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
}
