package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;

public class BoardDAO {
	public BoardDAO() {

	}
public static void articleDelete(int board_num,int board_sort) throws SQLException {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String board_sql = "delete from board where board_num =? and board_sort=?";
	try {
		con = DBUtil.getConnection();

		pstmt = con.prepareStatement(board_sql);
		pstmt.setInt(1, board_num);
		pstmt.setInt(2, board_sort);
		rset = pstmt.executeQuery();

	

	} finally {
		DBUtil.close(con, pstmt, rset);
	}
}
	public static ArrayList<BoardDTO> searchCommunityAll(String keyWord, String search_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> searchAll = null;

		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM(SELECT ROWNUM AS RNUM, A.* FROM ( select * from board where BOARD_NAME LIKE ? AND BOARD_SORT=2 order by BOARD_NUM desc) A WHERE ROWNUM <= 5) WHERE RNUM > 0";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(board_sql);
			pstmt.setString(1, "%" + keyWord + "%");
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			searchAll = new ArrayList<>();
			while (rset.next()) {
				searchAll.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return searchAll;
	}
	public static ArrayList<BoardDTO> searchAllMoreCommunity(String keyWord, int page, int limit) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> all = null;
		int startrow = (page - 1) * 10;// 읽기 시작할 row번호
		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM ( select * from board WHERE BOARD_NAME LIKE ? AND BOARD_SORT=2 order by BOARD_NUM desc ) A WHERE ROWNUM <= ?) WHERE RNUM > ?";

		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(board_sql);
			pstmt.setString(1, "%" + keyWord + "%");
			pstmt.setInt(2, startrow + 10);
			pstmt.setInt(3, startrow);
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			all = new ArrayList<>();
			while (rset.next()) {
				all.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));

			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
	public static ArrayList<BoardDTO> searchAllMore(String keyWord, int page, int limit) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> all = null;
		int startrow = (page - 1) * 10;// 읽기 시작할 row번호
		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM ( select * from board WHERE BOARD_NAME LIKE ? order by BOARD_NUM desc ) A WHERE ROWNUM <= ?) WHERE RNUM > ?";

		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(board_sql);
			pstmt.setString(1, "%" + keyWord + "%");
			pstmt.setInt(2, startrow + 10);
			pstmt.setInt(3, startrow);
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			all = new ArrayList<>();
			while (rset.next()) {
				all.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));

			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}

	public static int searchAllCommunityCount(String keyWord) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int searchAllCount = 0;

		String board_search_count = "select count(*) from board where BOARD_NAME LIKE ? AND BOARD_SORT=2";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(board_search_count);
			pstmt.setString(1, "%" + keyWord + "%");
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성

			if (rset.next()) {
				searchAllCount = rset.getInt(1);
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return searchAllCount;

	}

	public static int searchAllCount(String keyWord) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int searchAllCount = 0;

		String board_search_count = "select count(*) from board where BOARD_NAME LIKE ? ";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(board_search_count);
			pstmt.setString(1, "%" + keyWord + "%");
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성

			if (rset.next()) {
				searchAllCount = rset.getInt(1);
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return searchAllCount;

	}

	public static ArrayList<BoardDTO> searchAll(String keyWord, String search_id) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> searchAll = null;

		String update_search = "insert into search values (?,?,sysdate)";
		try {
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement(update_search);
			pstmt.setString(1, keyWord);
			pstmt.setString(2, search_id);
			pstmt.executeQuery();
		}

		finally {
			DBUtil.close(con, pstmt, rset);
		}

		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM(SELECT ROWNUM AS RNUM, A.* FROM ( select * from board where BOARD_NAME LIKE ? order by BOARD_NUM desc) A WHERE ROWNUM <= 5) WHERE RNUM > 0";
		String board_search_count = "select count(*) from board where BOARD_NAME LIKE ? ";
		try {
			con = DBUtil.getConnection();

			pstmt = con.prepareStatement(board_sql);
			pstmt.setString(1, "%" + keyWord + "%");
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			searchAll = new ArrayList<>();
			while (rset.next()) {
				searchAll.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));
			}

		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return searchAll;
	}

	public static int getListCount(int sort) throws SQLException {
		int listCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		if (sort == 2) {
			try {

				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from board WHERE BOARD_SORT=2");
				rset = pstmt.executeQuery();
				if (rset.next()) {

					listCount = rset.getInt(1);
					
				}
			} finally {
				DBUtil.close(con, pstmt, rset);

			}
		} else {
			try {

				con = DBUtil.getConnection();
				pstmt = con.prepareStatement("select count(*) from board WHERE BOARD_SORT=1");
				rset = pstmt.executeQuery();
				if (rset.next()) {

					listCount = rset.getInt(1);
					
				}
			} finally {
				DBUtil.close(con, pstmt, rset);

			}
		}
		return listCount;

	}

	public static BoardDTO getArticle(int board_num) throws SQLException {
		BoardDTO boardBean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int upViewcnt = 0;

		try {

			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from board where BOARD_NUM = ?");
			pstmt.setInt(1, board_num);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				boardBean = new BoardDTO();
				boardBean.setBno(rset.getInt("BOARD_NUM"));
				boardBean.setTitle(rset.getString("BOARD_NAME"));
				boardBean.setContent(rset.getString("BOARD_CONTENT"));
				boardBean.setMember_id(rset.getString("BOARD_WRITE_ID"));
				boardBean.setViewcnt(rset.getInt("BOARD_VIEWCNT") + 1);
				boardBean.setRegdate(rset.getString("BOARD_DATE"));
				boardBean.setSort(rset.getInt("BOARD_SORT"));
				upViewcnt = rset.getInt("BOARD_VIEWCNT") + 1;
			}
			upViewcnt(upViewcnt, board_num);

		} finally {
			DBUtil.close(con, pstmt, rset);

		}

		return boardBean;
	}

	public static void upViewcnt(int upViewcnt, int board_num) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		try {

			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("update board set BOARD_VIEWCNT = ? WHERE BOARD_NUM =?");
			pstmt.setInt(1, upViewcnt);
			pstmt.setInt(2, board_num);
			rset = pstmt.executeQuery();
		}

		finally {
			DBUtil.close(con, pstmt, rset);

		}

	}

	public static void insertBoard(BoardDTO board) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int num = 0;
		try {
			con = DBUtil.getConnection();
			/*
			 * 글 번호 +1 pstmt = con.prepareStatement("select max(board_num) from board");
			 * 
			 * rset = pstmt.executeQuery(); //문제없이 검색된 직후 실질적인 ArrayList객체 생성
			 * 
			 * if(rset.next()) {
			 * 
			 * }
			 */
			pstmt = con.prepareStatement("select max(board_num) from board");
			rset = pstmt.executeQuery();
			if (rset.next()) {
				num = rset.getInt(1) + 1;
			} else
				num = 1;

			String sql = "insert into board(BOARD_NUM,BOARD_NAME,BOARD_CONTENT,BOARD_WRITER, BOARD_DATE, BOARD_VIEWCNT,BOARD_LIKE,BOARD_DISLIKE, BOARD_BLAME,BOARD_WRITE_ID,BOARD_SORT)"
					+ "VALUES (?,?,?,?,sysdate,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getWriter());

			pstmt.setInt(5, board.getViewcnt());
			pstmt.setInt(6, board.getLike());
			pstmt.setInt(7, board.getDislike());
			pstmt.setInt(8, board.getBlame());
			pstmt.setString(9, board.getMember_id());
			pstmt.setInt(10, board.getSort());

			pstmt.executeUpdate();

		} finally {
			DBUtil.close(con, pstmt, rset);
		}

	}

	public static ArrayList<BoardDTO> getAll(int page, int limit) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> all = null;
		int startrow = (page - 1) * 10;// 읽기 시작할 row번호
		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM(SELECT ROWNUM AS RNUM, A.* FROM ( select * from board WHERE BOARD_SORT=1 order by BOARD_DATE desc) A WHERE ROWNUM <= ?) WHERE RNUM > ?";

		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, startrow + 10);
			pstmt.setInt(2, startrow);
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			all = new ArrayList<>();
			while (rset.next()) {
				all.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));

			}
			
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}

	public static ArrayList<BoardDTO> getAllCommunity(int page, int limit) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardDTO> all = null;
		int startrow = (page - 1) * 10;// 읽기 시작할 row번호
		// String board_sql = "select * from board";
		String board_sql = "SELECT * FROM(SELECT ROWNUM AS RNUM, A.* FROM ( select * from board WHERE BOARD_SORT=2 order by BOARD_DATE desc) A WHERE ROWNUM <= ?) WHERE RNUM > ?";

		try {
			con = DBUtil.getConnection();
			
			pstmt = con.prepareStatement(board_sql);
			pstmt.setInt(1, startrow + 10);
			pstmt.setInt(2, startrow);
			rset = pstmt.executeQuery();
			// 문제없이 검색된 직후 실질적인 ArrayList객체 생성
			all = new ArrayList<>();
			while (rset.next()) {
				all.add(new BoardDTO(rset.getInt(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getInt(9), rset.getInt(10),
						rset.getString(11),rset.getInt(12)));

			}
			
		} finally {
			DBUtil.close(con, pstmt, rset);
		}
		return all;
	}
}
