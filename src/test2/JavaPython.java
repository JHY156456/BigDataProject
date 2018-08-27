/* 실시간 동적 데이터 처리
 * 
 * 1. 적용 기술
 * 		- 분석 : python
 * 		- client와 실시간 서비스하게 되는 기술은 : web
 * 			web
 * 				html/javascript/css : 분석된 결과 받고 보기 좋게 출력 
 * 
 * 				servlet/jsp + java : 분석된 결과치를 client 브라우저에 응답
 * 
 * 2. 처리 process
 * 		- client -> html -> servlet -> python 실행 
 * 		-> 분석 결과를 csv 파일로 생성 -> 생성된 csv servlet등을 활용해서 read
 * 		-> read한 결과를 jsp를 통해서 응답 
 */
package test2;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jp")
public class JavaPython extends HttpServlet {
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

	        resp.setContentType("text/html;charset=utf-8"); 
	        PrintWriter out = resp.getWriter();
	        try {
	            Process p = Runtime.getRuntime().exec("python C:\\Users\\JHY\\Desktop\\ITStudy\\4.python\\price.py");
	            p.waitFor();
	            
	            /* 서버 시스템 내에 존재하는 일반 파일을 read해서 client에게 응답
	             * 단, 여러분들은 requeest.setAtrribute("data", 크롤링한데이터)
	             * priceView.jsp 통해서 응답 
	             * 
	             * 서버 시스템 내에 존재하는 일반 파일에 한글이 보유될 가능성이 있다면
	             * 한글은 2byte 단위의 언어
	             * 따라서 2byte로 read 할수 있는 API를활용
	             *  
	             *  1. FileReader 
	             *  	- 존재하는 file로 부터 2byte씩 read 가능
	             *     - 단순 read만 가능하고, performance는 미 고려
	             *  	- 한 음절씩만 read 가능
	             *  		int read()
	             *  		- read한 데이터가 있다 : int
	             *  		- read할 데이터가 없다 : -1
	             *  
	             *  2. BufferedReader
	             *  	- 입력 필터
	             *  	- 입력하는 속도 향상을 하는 API
	             *  	- 2byte 로 read
	             *  	- line단위로 read하는 메소드도 있음
	             *  		String readLine()
	             *  		- read한 데이터가 있다 : String 객체
	             *  		- read할 데이터가 없다 : null
	             * 
	             */
	            BufferedReader in 
	            = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\ITStudy\\4.python\\price.csv"));
	            /*
	             * 파이썬에 의해 생성된 데이터를 file로 부터 read
	             * 요청 객체에 저장 -> priceView.jsp
	             */
	            
	            //다수의 데이터가 존재할 경우 모든 read한 데이터를 적재하는 문자열 객체
	            StringBuffer buf = new StringBuffer("");
	            String line = null;
	            while ((line = in.readLine()) != null) {
	               // System.out.println(line);
	                buf.append(line);
	            }
	            //out.println(buf);
                req.setAttribute("datas", buf);
                req.getRequestDispatcher("NewFile.jsp").forward(req,resp);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}