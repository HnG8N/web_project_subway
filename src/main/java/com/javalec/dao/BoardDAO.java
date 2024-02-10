package com.javalec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.javalec.dto.BoardDTO;


public class BoardDAO {
	

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&charactorEncoding=utf8&useSSL=FALSE";
			String dbID = "root";
			String dbPassword ="qwer1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		public String getDate() {
			String SQL = "SELECT NOW()";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getString(1);
				}
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";//데이터베이스 오류
	}
		public int getNext() {
			String SQL = "SELECT bseq FROM board ORDER BY bseq DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; // 첫 번째 게시물인 경우
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
		public int write(String bmid, String btitle, String bcontent) {
			String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bmid);
				pstmt.setString(3, btitle);
				pstmt.setString(4, bcontent);
				pstmt.setString(5, getDate());
				pstmt.setInt(6, 1);							
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류	
		}
		
		public ArrayList<BoardDTO> getList(int pageNumber){
			
			String SQL = "SELECT * FROM board WHERE bseq < ? AND bavailable = 1 ORDER BY bseq DESC LIMIT 10";
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber - 1)* 10);				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardDTO bbs = new BoardDTO();					
					bbs.setBseq(rs.getInt(1));
					bbs.setBmid(rs.getString(2));
					bbs.setBtitle(rs.getString(3));
					bbs.setBcontent(rs.getString(4));
					bbs.setBdate(rs.getString(5));
					bbs.setBavailable(rs.getString(6));
					list.add(bbs);										
				}						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
			
	}
		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM board WHERE bseq < ? AND bavailable = 1";		
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber - 1)* 10);				
				rs = pstmt.executeQuery();
				if (rs.next())	{
					return true;
				}						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;	
		}
		
		public BoardDTO getBbs(int bseq) {
			String SQL = "SELECT * FROM board WHERE bseq = ?";		
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, bseq);				
				rs = pstmt.executeQuery();
				if (rs.next())	{
					BoardDTO bbs = new BoardDTO();
					bbs.setBseq(rs.getInt(1));
					bbs.setBmid(rs.getString(2));
					bbs.setBtitle(rs.getString(3));
					bbs.setBcontent(rs.getString(4));
					bbs.setBdate(rs.getString(5));
					bbs.setBavailable(rs.getString(6));
					return bbs;	
				}						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;	
		}
		
		public int update(int bseq, String btitle, String bcontent) {
			String SQL = "UPDATE board SET btitle = ?, bcontent = ? WHERE bseq = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, btitle);			
				pstmt.setString(2, bcontent);
				pstmt.setInt(3, bseq);							
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
		}
		
		public int delete(int bseq) {
			
			String SQL = "UPDATE board SET bavailable = 0 WHERE bseq = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, bseq);										
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
					
		}
		
	    // (페이지) 전체 페이지 수를 얻어오는 메서드 
	    public int getTotalPages() {
	        int totalPages = 0;
	        
	            String SQL = "SELECT MAX(bseq) FROM board";
	            try(
	            	PreparedStatement pstmt = conn.prepareStatement(SQL);
	              	ResultSet resultSet = pstmt.executeQuery()){
	            	 if (resultSet.next()) {
	                     totalPages = resultSet.getInt(1);
	                 }          
	                	                	            
	            } catch (Exception e) {
	            e.printStackTrace(); // 실제로는 예외 처리를 더 구체적으로 수행해야 합니다.
	        }
	        return totalPages;
	    }
	    	    
	   
	    // 제목 검색 기능 AJAX 이용
	    public ArrayList<BoardDTO> search(String btitle){
			String SQL = "SELECT * FROM board WHERE btitle LIKE ?";			
			ArrayList<BoardDTO> titleList = new ArrayList<BoardDTO>();			
			try {				
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, "%" + btitle + "%");			
				rs = pstmt.executeQuery();				
				while (rs.next()) {
					BoardDTO newBbs = new BoardDTO();
					newBbs.setBseq(rs.getInt(1));
					newBbs.setBmid(rs.getString(2));
					newBbs.setBtitle(rs.getString(3));
					newBbs.setBcontent(rs.getString(4));
					newBbs.setBdate(rs.getString(5));
					newBbs.setBavailable(rs.getString(6));				
					titleList.add(newBbs);					
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return titleList;				
	}  
	    			

}// End
