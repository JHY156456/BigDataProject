package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ChartDAO;
import model.ChartDTO;
import model.DistrictDAO;
import model.DistrictDTO;
import model.H_StationDAO;
import model.H_StationDTO;
import model.RecordDAO;
import model.RecordDTO;
import model.RentalReturnDAO;
import model.RentalReturnDTO;
import model.WidgetDAO;

public class AllController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, 
         HttpServletResponse response) throws ServletException, IOException {
         request.setCharacterEncoding("utf-8");
         
         String command = request.getParameter("command");
         
         if(command.equals("circle")) {
            drawCircle(request, response);   
         }else if(command.equals("arrow")) {
            drawArrow(request, response);
         }else if(command.equals("s_chart1")){
            drawChart1(request,response,0);
         }else if(command.equals("s_chart2")){
            drawChart2(request,response,0);
         }else if(command.equals("s_chart3")){
            drawChart3(request,response,0);
         }else if(command.equals("s_chart4")){
            drawChart4(request,response,0);
         }else if(command.equals("s_chart5")){
            drawChart5(request,response,0);
         }else if(command.equals("s_chart6")){
            drawChart6(request,response,0);
         }else if(command.equals("h_chart1")) {
            drawChart1(request,response,1);
         }else if(command.equals("h_chart2")) {
            drawChart2(request,response,2);
         }else if(command.equals("h_chart3")) {
            drawChart3(request,response,1);
         }else if(command.equals("h_chart4")) {
            drawChart4(request,response,1);
         }else if(command.equals("h_chart5")) {
            drawChart5(request,response,1);
         }else if(command.equals("h_chart6")) {
            drawChart6(request,response,1);
         }else if(command.equals("stationMap")){
            drawMap(request,response);
         }else if(command.equals("district1")){
            drawDistrict1(request,response);
         }else if(command.equals("district2")){
            drawDistrict2(request,response);
         }else if(command.equals("district3")){
            drawDistrict3(request,response);
         }else if(command.equals("district4")){
            drawDistrict4(request,response);
         }else if(command.equals("district5")){
            drawDistrict5(request,response);
         }else if(command.equals("district6")){
            drawDistrict6(request,response);
         }else if(command.equals("district7")){
            drawDistrict7(request,response);
         }else if(command.equals("district8")){
            drawDistrict8(request,response);
         }else if(command.equals("district9")){
            drawDistrict9(request,response);
         }else if(command.equals("district10")){
            drawDistrict10(request,response);
         }else if(command.equals("userCount")){
            getUserCount(request,response);
         }else if(command.equals("recordCount")){
            getRecordCount(request,response);
         }else if(command.equals("searchStation")){
            searchStation(request,response);
         }else if(command.equals("insertKeyword")){
            insertKeyword(request,response);
         }else if(command.equals("zoomStation")){
            zoomStation(request,response);
         }else {
            request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
            request.getRequestDispatcher("errorView.jsp").forward(request, response);
         }

   }

   private void zoomStation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      
      try {
         
         String keyword = request.getParameter("keyword");
         System.out.println(keyword);
         String[] keys = keyword.split(",");
         
         if(keys.length == 2) {
            ArrayList<H_StationDTO> result = H_StationDAO.selectStation(keys[0]);
            if(result.size() != 0) {
               request.setAttribute("station", result);
               url = "jsp/drawMap.jsp";
               
            }else {
               
               request.setAttribute("msg", "검색된 데이터가 없습니다.");
               url = "jsp/msgView.jsp";
            }
         }
         
         else {

            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
            
         }
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void insertKeyword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      
      try {
         
         String keyword = request.getParameter("keyword");
         System.out.println(keyword);
         String[] keys = keyword.split(",");
         
         if(keys.length == 2) {
            int result = H_StationDAO.insertKeyword(keys[0],keys[1]);
            if(result != 0) {
               request.setAttribute("msg", "Success");
               url = "jsp/insert.jsp";
               
            }else {
               
               request.setAttribute("msg", "검색된 데이터가 없습니다.");
               url = "jsp/msgView.jsp";
            }
         }
         
         else {

            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
            
         }
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void searchStation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         String keyword = request.getParameter("keyword");
         ArrayList<H_StationDTO> record = H_StationDAO.searchStation(keyword);
            
         if(record.size() != 0) {
         
            request.setAttribute("search", record);
            url = "jsp/search.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }



   private void getRecordCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         int record = WidgetDAO.selectRecordCount();
            
         if(record != 0) {
         
            request.setAttribute("count", record);
            url = "jsp/count.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void getUserCount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         int record = WidgetDAO.selectUserCount();
         if(record != 0) {
         
            request.setAttribute("count", record);
            url = "jsp/count.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict10(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("광진구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict9(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("동대문구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict8(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("마포구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict7(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("성동구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict6(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("양천구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict5(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("영등포구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict4(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("용산구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("은평구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("종로구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                         System.out.println("1");
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawDistrict1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<DistrictDTO> record = DistrictDAO.selectHDistrict("중구");
            
         if(record.size() != 0) {
            
            BufferedReader in 
               = new BufferedReader(new FileReader("C:\\Users\\JHY\\Desktop\\WebProject\\WebContent\\station.csv"));

               String line = null;
               while ((line = in.readLine()) != null) {
                   String stationNo = line.split(",")[0];
                   
                   for(int i=0; i<record.size();i++) {
                      if(stationNo.equals(record.get(i).getStationNo())) {
                         record.get(i).setS_holdNum(Integer.parseInt(line.split(",")[1]));
                         record.get(i).setS_bikeNum(Integer.parseInt(line.split(",")[2]));
                         System.out.println("1");
                      }
                   }
               }
         
            request.setAttribute("district", record);
            url = "jsp/district.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawMap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<H_StationDTO> record = H_StationDAO.selectStation();
         
         if(record.size() != 0) {
            request.setAttribute("station", record);
            url = "jsp/drawMap.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawChart6(HttpServletRequest request, HttpServletResponse response,int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectAgeRecord(code);
         
         if(record.size() != 0) {
            request.setAttribute("chart6", record);
            url = "jsp/chart6.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawChart5(HttpServletRequest request, HttpServletResponse response, int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectCarbonRecord(code);
         
         if(record.size() != 0) {
            request.setAttribute("chart5", record);
            url = "jsp/chart5.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }


   private void drawChart4(HttpServletRequest request, HttpServletResponse response, int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectMomentumRecord(code);
         
         if(record.size() != 0) {
            request.setAttribute("chart4", record);
            url = "jsp/chart4.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }


   private void drawChart3(HttpServletRequest request, HttpServletResponse response, int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectRentalCodeRecord(code);
         
         if(record.size() != 0) {
            request.setAttribute("chart3", record);
            url = "jsp/chart3.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }


   private void drawChart2(HttpServletRequest request, HttpServletResponse response, int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectGenderRecord(code);
         
         if(record.size() != 0) {
            request.setAttribute("chart2", record);
            url = "jsp/chart2.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }



   private void drawChart1(HttpServletRequest request, HttpServletResponse response, int code) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<ChartDTO> record = ChartDAO.selectMonthRecord(code);
         if(record.size() != 0) {
            request.setAttribute("chart1", record);
            url = "jsp/chart1.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }


   private void drawArrow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<RecordDTO> record = RecordDAO.selectRecord();
         
         if(record.size() != 0) {
            request.setAttribute("record", record);
            url = "jsp/recordView.jsp";
            
         }else {
            
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
         
      }
      request.getRequestDispatcher(url).forward(request, response);
   }

   private void drawCircle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "jsp/errorView.jsp";
      try {
         
         ArrayList<RentalReturnDTO> record = RentalReturnDAO.selectRentalReturn();
         
         if(record.size() != 0) {
            request.setAttribute("record", record);
            url = "jsp/rentalReturnView.jsp";
            
         }else {
            request.setAttribute("msg", "검색된 데이터가 없습니다.");
            url = "jsp/msgView.jsp";
         }
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         request.setAttribute("errorMsg","검색 시 문제 발생 재 시도 하세요");
      }
      request.getRequestDispatcher(url).forward(request, response);
   }
}