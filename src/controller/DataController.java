package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.BoardDTO;
import model.LoginDAO;
import model.UserDTO;
import vo.PageInfo;

@WebServlet("/cont")
public class DataController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");

		if (command != null) {
			// ?
		}

		if (command.equals("citizen")) {
			citizen(request, response);
		} else if (command.equals("writeOK")) {
			writeOK(request, response);
		} else if (command.equals("login")) {
			login(request, response);
		} else if (command.equals("logout")) {
			logout(request, response);
		} else if (command.equals("newMember")) {
			newMember(request, response);
		} else if (command.equals("boardDetail")) {
			boardDetail(request, response);
		} else if (command.equals("search")) {
			search(request, response);
		} else if (command.equals("searchMore")) {
			searchMore(request, response);
		} else if (command.equals("duplicateIdCheck")) {
			duplicateIdCheck(request, response);
		} else if (command.equals("duplicateIdEmailCheck")) {
			duplicateIdEmailCheck(request, response);
		} else if (command.equals("articleDelete")) {
			articleDelete(request, response);
		} else if (command.equals("community")) {
			community(request, response);
		} else if (command.equals("searchMoreCommunity")) {
			searchMoreCommunity(request, response);
		} else if (command.equals("communityWriteOK")) {
			communityWriteOK(request, response);
		}
	}

	protected void communityWriteOK(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDTO newBoard = new BoardDTO(5, request.getParameter("qestnTitle"), request.getParameter("qestnContent"),
				"작성자", "등록일", 0, 0, 0, 0, request.getParameter("write_id"), 2);
		try {
			BoardDAO.insertBoard(newBoard);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		community(request, response);

	}

	protected void community(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;
		int limit = 10;
		int sort = 2;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<BoardDTO> data = null;
		String url = "error.jsp";
		try {
			int listCount = BoardDAO.getListCount(sort);

			data = BoardDAO.getAllCommunity(page, limit);
			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);

			if (data.size() != 0) {
				request.setAttribute("datas", data);
				url = "BoardList/community.jsp";
			} else {// 데이터 없을때
				request.setAttribute("datas", data);
				url = "BoardList/community.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void articleDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		int board_sort = Integer.parseInt(request.getParameter("board_sort"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));

		String url = "error.jsp";
		try {
			BoardDAO.articleDelete(board_num,board_sort);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (board_sort == 1) citizen(request,response);
		else community(request,response);
	}

	protected void duplicateIdEmailCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("USER_ID");
		String user_email = request.getParameter("USER_EMAIL");

		boolean isDuplicate; // 중복검사이기때문에 행이 1개 이상이면 true , 행이 한개도 없어서 중복된게 없다면 false를 전송하자.

		String url = "error.jsp";

		isDuplicate = LoginDAO.duplicateIdEmailCheck(user_id, user_email);
		if (isDuplicate) { // 중복일떄
			request.setAttribute("msg", "N");
			url = "RegisterStep/isDuplicate.jsp";
		} else { // 중복아닐때
			request.setAttribute("msg", "Y");
			url = "RegisterStep/isDuplicate.jsp";
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);

	}

	protected void duplicateIdCheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("USER_ID");

		boolean isDuplicate; // 중복검사이기때문에 행이 1개 이상이면 true , 행이 한개도 없어서 중복된게 없다면 false를 전송하자.

		String url = "error.jsp";

		isDuplicate = LoginDAO.duplicateIdCheck(user_id);
		if (isDuplicate) { // 중복일떄
			request.setAttribute("msg", "N");
			url = "RegisterStep/isDuplicate.jsp";
		} else { // 중복아닐때
			request.setAttribute("msg", "Y");
			url = "RegisterStep/isDuplicate.jsp";
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);

	}

	protected void searchMoreCommunity(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyWord = request.getParameter("keyWord");

		int page = 1;
		int limit = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<BoardDTO> data = null;
		String url = "error.jsp";
		try {
			int listCount = BoardDAO.searchAllCommunityCount(keyWord);

			data = BoardDAO.searchAllMoreCommunity(keyWord, page, limit);
			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);

			if (data.size() != 0) {
				request.setAttribute("datas", data);
				url = "BoardList/TotalMoreSearch.jsp";
			} else { // 검색데이터가 없을경우
				request.setAttribute("datas", data);
				url = "BoardList/TotalMoreSearch.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void searchMore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyWord = request.getParameter("keyWord");

		int page = 1;
		int limit = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<BoardDTO> data = null;
		String url = "error.jsp";
		try {
			int listCount = BoardDAO.searchAllCount(keyWord);
			data = BoardDAO.searchAllMore(keyWord, page, limit);
			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);

			if (data.size() != 0) {
				request.setAttribute("datas", data);
				url = "BoardList/TotalMoreSearch.jsp";
			} else { // 검색데이터가 없을경우
				request.setAttribute("datas", data);
				url = "BoardList/TotalMoreSearch.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void search(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String keyWord = request.getParameter("keyWord");

		String search_id = (String) request.getParameter("search_id");

		ArrayList<BoardDTO> data = null;
		ArrayList<BoardDTO> communityData = null;
		String url = "error.jsp";
		try {

			communityData = BoardDAO.searchCommunityAll(keyWord, search_id);
			int searchCommunityAllCount = BoardDAO.searchAllCommunityCount(keyWord);

			data = BoardDAO.searchAll(keyWord, search_id);
			int searchAllCount = BoardDAO.searchAllCount(keyWord);

			if (data.size() != 0) {
				request.setAttribute("datas", data);
				request.setAttribute("key", keyWord);
				request.setAttribute("searchAllCount", searchAllCount);

				request.setAttribute("community_datas", communityData);
				request.setAttribute("searchCommunityAllCount", searchCommunityAllCount);
				url = "BoardList/TotalSearch.jsp";
			} else { // 검색결과 없을때
				request.setAttribute("datas", data);
				request.setAttribute("key", keyWord);
				request.setAttribute("searchAllCount", searchAllCount);

				request.setAttribute("community_datas", communityData);
				request.setAttribute("searchCommunityAllCount", searchCommunityAllCount);
				url = "BoardList/TotalSearch.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void boardDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "error.jsp";
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDTO article = null;
		int sort = Integer.parseInt(request.getParameter("sort"));
		System.out.println("sort : " + sort);
		try {
			article = BoardDAO.getArticle(board_num);
			if (article != null) {
				request.setAttribute("article", article);
				url = "BoardList/article.jsp";
				if (sort == 2)
					url = "BoardList/communityArticle.jsp";
			} else {
				request.setAttribute("message", "요청한 데이터는 없습니다.");
				url = "msg.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리
		request.getRequestDispatcher(url).forward(request, response);
	}

	protected void newMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO bean = new UserDTO();
		bean.setId(request.getParameter("userID"));
		bean.setPasswd(request.getParameter("pwd1"));
		bean.setEmail(request.getParameter("email"));
		// bean.setName(request.getParameter("name"));
		String hp1 = request.getParameter("hp1");
		String hp2 = request.getParameter("hp2");
		String hp3 = request.getParameter("hp3");
		String hp = hp1 + "-" + hp2 + "-" + hp3;
		// bean.setHp(hp);
		bean.setAddr(request.getParameter("address"));

		// 데이터베이스 객체 선언 후 저장
		// 데이터베이스 객체 생성
		LoginDAO mdao = new LoginDAO();
		mdao.insertMember(bean); // 실제 데이터를 가지고있는 bean을 넘겨준다.
		RequestDispatcher dis = request.getRequestDispatcher("RegisterStep/RegisterOK.jsp");
		dis.forward(request, response);

	}

	protected void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDTO bean = new UserDTO();
		bean.setId(request.getParameter("id"));
		bean.setPasswd(request.getParameter("password"));

		LoginDAO mdao = new LoginDAO();
		int result = mdao.loginCheck(bean);

		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("sid", bean.getId());
			if (bean.getId().equals("admin")) {

				request.getRequestDispatcher("index2.jsp").forward(request, response);
				return;
			} else {

				request.getRequestDispatcher("Main/main.jsp").forward(request, response);
				return;
			}
		} else // 로그인실패
			request.setAttribute("errorMsg", "로그인에 실패했습니다 다시 로그인하세요.");
		request.getRequestDispatcher("RegisterStep/loginFail.jsp").forward(request, response);
		// response.sendRedirect("RegisterStep/loginFail.jsp");
	}

	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		session = null;
		response.sendRedirect("Main/main.jsp");

	}

	protected void writeOK(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDTO newBoard = new BoardDTO(5, request.getParameter("qestnTitle"), request.getParameter("qestnContent"),
				"작성자", "등록일", 0, 0, 0, 0, request.getParameter("write_id"), 1);
		try {
			BoardDAO.insertBoard(newBoard);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		citizen(request, response);

	}

	protected void citizen(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;
		int limit = 10;
		int sort = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		ArrayList<BoardDTO> data = null;
		String url = "error.jsp";
		try {
			int listCount = BoardDAO.getListCount(sort);
			data = BoardDAO.getAll(page, limit);
			int maxPage = (int) ((double) listCount / limit + 0.95);
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;
			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			request.setAttribute("pageInfo", pageInfo);

			if (data.size() != 0) {
				request.setAttribute("datas", data);
				url = "BoardList/citizenOpinionList.jsp";
			} else {
				request.setAttribute("message", "요청한 데이터는 없습니다.");
				url = "msg.jsp";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "죄송합니다, 재 요청해주세요");
		}
		// request에 저장하고 forward로 jsp로 이동해서 응답처리

		request.getRequestDispatcher(url).forward(request, response);
	}

}
