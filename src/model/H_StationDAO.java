package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;

public class H_StationDAO {

   public static ArrayList<H_StationDTO> selectStation() throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      //0�� ���� 1�� ����
      ArrayList<H_StationDTO> all = null;
      
      try {
         
         con = DBUtil.getConnection();
         String sql = "select * from h_station";
         
         pstmt = con.prepareStatement(sql);
         rset = pstmt.executeQuery();
         
         all = new ArrayList<H_StationDTO>(); //all = new ArrayList<>();
         
         while(rset.next()) {
            all.add(new H_StationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getInt(4), rset.getInt(5), rset.getDouble(6), rset.getDouble(7)));
         }
         
      }finally {
         DBUtil.close(con, pstmt, rset);
      }
      return all;
   }
   
   public static ArrayList<H_StationDTO> searchStation(String keyword) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      //0�� ���� 1�� ����
      ArrayList<H_StationDTO> all = null;
      
      try {
         
         con = DBUtil.getConnection();
         String sql = "select stationID, stationName from h_station where stationName LIKE ?";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, keyword + "%");
         rset = pstmt.executeQuery();
         
         all = new ArrayList<H_StationDTO>(); //all = new ArrayList<>();
         
         while(rset.next()) {
            all.add(new H_StationDTO(rset.getString(1), rset.getString(2), null,0,0,0,0));
         }
         
      }finally {
         DBUtil.close(con, pstmt, rset);
      }
      return all;
   }
   
   public static int insertKeyword(String ID, String name) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      int result = 0;
      
      try {
         
         con = DBUtil.getConnection();
         String sql = "insert into h_search values(?,?)";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, ID);
         pstmt.setString(2, name);
         rset = pstmt.executeQuery();
         result = 1;
         
      }finally {
         DBUtil.close(con, pstmt, rset);
      }
      
      return result;
   }
   
   public static ArrayList<H_StationDTO> selectStation(String ID) throws Exception {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      //0�� ���� 1�� ����
      ArrayList<H_StationDTO> all = null;
      
      try {
         
         con = DBUtil.getConnection();
         String sql = "select * from h_station where stationID = ?";
         
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, ID);
         rset = pstmt.executeQuery();
         
         all = new ArrayList<H_StationDTO>(); //all = new ArrayList<>();
         
         while(rset.next()) {
            all.add(new H_StationDTO(rset.getString(1), rset.getString(2), rset.getString(3), rset.getInt(4), rset.getInt(5), rset.getDouble(6), rset.getDouble(7)));
         }
         
      }finally {
         DBUtil.close(con, pstmt, rset);
      }
      return all;
   }
}