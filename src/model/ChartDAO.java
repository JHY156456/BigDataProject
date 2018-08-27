package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class ChartDAO {

	public static ArrayList<ChartDTO> selectMonthRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		try {
			
			con = DBUtil.getConnection();
			
			if(code == 0) {
				sql = "select rentalDate, sum(useCount) from monthrecord group by rentalDate order by rentaldate";
			}
			else {
				sql = "select rentalDate, sum(useCount) from h_rental group by rentalDate order by rentaldate";
			}
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(rset.getString(1),null,null,null,null,rset.getLong(2),0,0));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	public static ArrayList<ChartDTO> selectGenderRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		
		try {
			
			con = DBUtil.getConnection();
			if(code == 0) {
				sql = "select rentalDate, gender, sum(useCount) from monthrecord group by rentalDate, gender order by rentaldate";
			}
			else {
				sql = "select rentalDate, gender, sum(useCount) from h_rental group by rentalDate, gender order by rentaldate";
			}
			
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(rset.getString(1),null,null,rset.getString(2),null,rset.getLong(3),0,0));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	
	public static ArrayList<ChartDTO> selectRentalCodeRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		
		try {
			
			con = DBUtil.getConnection();
			if(code ==0) {
				sql = "select rentalCode, sum(useCount) from monthrecord group by rentalCode order by rentalCode";	
			}
			else {
				sql = "select rentalCode, sum(useCount) from h_rental group by rentalCode order by rentalCode";
			}
			
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(null,null,rset.getString(1),null,null,rset.getLong(2),0,0));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	public static ArrayList<ChartDTO> selectMomentumRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		
		try {
			
			con = DBUtil.getConnection();
			if(code ==0) {
				sql = "select rentalDate, sum(momentum) from monthrecord group by rentalDate order by rentalDate";
			}
			else {
				sql = "select rentalDate, sum(momentum) from h_rental group by rentalDate order by rentalDate";
			}
			
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(rset.getString(1),null,null,null,null,0,rset.getLong(2),0));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	
	public static ArrayList<ChartDTO> selectCarbonRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		
		try {
			
			con = DBUtil.getConnection();
			if(code == 0) {
				sql = "select rentalDate, sum(carbon) from monthrecord group by rentalDate order by rentalDate";
			}
			else {
				sql = "select rentalDate, sum(carbon) from h_rental group by rentalDate order by rentalDate";
			}
			
			
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(rset.getString(1),null,null,null,null,0,0,rset.getLong(2)));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	
	public static ArrayList<ChartDTO> selectAgeRecord(int code) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//0�� ���� 1�� ����
		ArrayList<ChartDTO> all = null;
		String sql = null;
		
		try {
			
			con = DBUtil.getConnection();
			if(code == 0) {
				sql = "select age, sum(useCount) from monthrecord group by age order by age";
			}
			else {
				sql = "select age, sum(useCount) from h_rental group by age order by age";
			}
			
			
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			all = new ArrayList<ChartDTO>(); //all = new ArrayList<>();
			
			while(rset.next()) {
				all.add(new ChartDTO(null,null,null,null,rset.getString(1),rset.getLong(2),0,0));
			}
			
		}finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
}
