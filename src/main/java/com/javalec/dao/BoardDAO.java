package com.javalec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.BoardDTO;


public class BoardDAO {
	
	// Field
	//DataSource dataSource;

	// Constructor

	 private Connection conn;
	 private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
			String dbID = "root";
			String dbPassword ="qwer1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		
		//	Context context = new InitialContext();
		//	dataSource = (DataSource) context.lookup("java:comp/env/jdbc/subway");
		//	conn = dataSource.getConnection();		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// BoardID 순서

		public int getNext() {
			String SQL = "SELECT boardID FROM board ORDER BY boardID DESC";
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
		// 글쓰기
		
		public int write(String boTitle, String bmID, String boContent) {		
			String SQL = "INSERT INTO BOARD (bmID, boardID, boTitle, boDate, boContent, boAvailable, boardHit, boardGroup, boardSeq, boardLevel)" +
				     "SELECT ?,IFNULL((SELECT MAX(boardID) + 1 FROM BOARD), 1), ?, NOW(), ?, 1, 0, IFNULL((SELECT MAX(boardGroup) + 1 FROM BOARD), 0), 0, 0";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);			
				pstmt.setString(1, bmID);
				pstmt.setString(2, boTitle);
				pstmt.setString(3, boContent);										
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류	
		}
		
		// 목록 불러오기
		public ArrayList<BoardDTO> getList(int pageNumber){			
			String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boAvailable = 1 ORDER BY boardGroup DESC, boardSeq ASC LIMIT 10";
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber - 1)* 10);				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardDTO board = new BoardDTO();
					board.setBmID(rs.getString(1));
					board.setBoardID(rs.getInt(2));				
					board.setBoTitle(rs.getString(3));
					board.setBoDate(rs.getString(4));
					board.setBoContent(rs.getString(5));					
					board.setBoAvailable(rs.getInt(6));
					board.setBoardHit(rs.getInt(7));
					board.setBoardGroup(rs.getInt(8));
					board.setBoardSeq(rs.getInt(9));
					board.setBoardLevel(rs.getInt(10));					
					list.add(board);
				}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;			
	}
		
		// 댓글 쿼리
		public ArrayList<BoardDTO> getList(String pageNumber) {
			ArrayList<BoardDTO> boardList = null;	
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "SELECT * FROM BOARD WHERE boardGroup > (SELECT MAX(boardGroup) FROM BOARD) - ? AND boardGroup <= (SELECT MAX(boardGroup) FROM BOARD) - ? ORDER BY boardGroup DESC, boardSeq ASC";
			try {
				String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
				String dbID = "root";
				String dbPassword ="qwer1234";
				Class.forName("com.mysql.cj.jdbc.Driver");
	    		conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			//	conn = dataSource.getConnection();
			//	pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, Integer.parseInt(pageNumber) * 10);
				pstmt.setInt(2, (Integer.parseInt(pageNumber) -1) * 10);
				rs = pstmt.executeQuery();			
				boardList = new ArrayList<BoardDTO>();
				while(rs.next()) {
					BoardDTO board = new BoardDTO();
					
					board.setBmID(rs.getString("BmID"));
					board.setBoardID(rs.getInt("boardID"));
					board.setBoTitle(rs.getString("boTitle").replaceAll(" ", "&nbs;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					board.setBoDate(rs.getString("boDate").substring(0,11));
					board.setBoContent(rs.getString("boContent").replaceAll(" ", "&nbs;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					board.setBoAvailable(rs.getInt("boAvailable"));
					board.setBoardHit(rs.getInt("boardHit"));				
					board.setBoardGroup(rs.getInt("boardGroup"));
					board.setBoardSeq(rs.getInt("boardSeq"));
					board.setBoardLevel(rs.getInt("boardLevel"));
					boardList.add(board);
					}				
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) rs.close();
						if(conn != null) rs.close();					
					} catch (Exception e) {
						e.printStackTrace();
					}	
				}
				return boardList;
			}
		
		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM board WHERE boardID < ? AND boAvailable = 1";		
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
		
		// view page
		public BoardDTO getBbs(int boardID) {
			String SQL = "SELECT * FROM board WHERE boardID = ?";		
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);				
				rs = pstmt.executeQuery();
				if (rs.next())	{
					BoardDTO board = new BoardDTO();
					board.setBmID(rs.getString(1));
					board.setBoardID(rs.getInt(2));
					board.setBoTitle(rs.getString(3));
					board.setBoDate(rs.getString(4));
					board.setBoContent(rs.getString(5));					
					board.setBoAvailable(rs.getInt(6));
					board.setBoardHit(rs.getInt(7));
					board.setBoardGroup(rs.getInt(8));
					board.setBoardSeq(rs.getInt(9));				
					board.setBoardLevel(rs.getInt(10));
					return board;
				}
					 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;	
		}
		
		// update
		public int update(int boardID, String boTitle, String boContent) {
			String SQL = "UPDATE board SET boTitle = ?, boContent = ? WHERE boardID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, boTitle);			
				pstmt.setString(2, boContent);
				pstmt.setInt(3, boardID);							
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
		}
		
		//삭제하기
		public int delete(int boardID) {
			
			String SQL = "UPDATE board SET boAvailable = 0 WHERE boardID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);										
				return pstmt.executeUpdate();								
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
					
		}
		
	    // (페이지) 전체 페이지 수를 얻어오는 메서드 
	    public int getTotalPages() {
	        int totalPages = 0;
	        
	            String SQL = "SELECT MAX(boardID) FROM board";
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
	    public ArrayList<BoardDTO> search(String boTitle){
			String SQL = "SELECT * FROM board WHERE boTitle LIKE ?";			
			ArrayList<BoardDTO> titleList = new ArrayList<BoardDTO>();			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, "%" + boTitle + "%");			
				rs = pstmt.executeQuery();				
				while (rs.next()) {
					BoardDTO newBbc = new BoardDTO();
					newBbc.setBmID(rs.getString(1));
					newBbc.setBoardID(rs.getInt(2));
					newBbc.setBoTitle(rs.getString(3));
					newBbc.setBoDate(rs.getString(4));
					newBbc.setBoContent(rs.getString(5));					
					newBbc.setBoAvailable(rs.getInt(6));
					newBbc.setBoardHit(rs.getInt(7));
					newBbc.setBoardGroup(rs.getInt(8));
					newBbc.setBoardSeq(rs.getInt(9));
					newBbc.setBoardLevel(rs.getInt(10));
					titleList.add(newBbc);				
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			return titleList;				
	}
		// 조회수
	    public int hit(String boardID) {
	    	Connection conn= null;
	    	PreparedStatement pstmt = null;		
	    	String SQL = "UPDATE BOARD SET boardHit = boardHit + 1 WHERE boardID = ?";
	    	try {
	    		String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
				String dbID = "root";
				String dbPassword ="qwer1234";
				Class.forName("com.mysql.cj.jdbc.Driver");			
	    		conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	    	
	    	//	conn = dataSource.getConnection();
	    		pstmt = conn.prepareStatement(SQL);    	
	    		pstmt.setString(1, boardID);
	    		return pstmt.executeUpdate();					
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	} finally {
	    		try {
	    			if(pstmt != null) pstmt.close();
	    			if(conn != null) conn.close();
	    		}	catch (Exception e) {
	    			e.printStackTrace();
	    		}
	    	}
	    	return -1;//데이터베이스 오류
	    }
	    
	    // 조회수
	    public BoardDTO getBoard(String boardID) {
			BoardDTO board = new BoardDTO();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String SQL = "SELECT * FROM BOARD WHERE boardID = ?";
			try {
	    		String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
				String dbID = "root";
				String dbPassword ="qwer1234";
				Class.forName("com.mysql.cj.jdbc.Driver");				
				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			//	conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, boardID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					board.setBmID(rs.getString("bmID"));
					board.setBoardID(rs.getInt("boardID"));
					board.setBoTitle(rs.getString("boTitle").replaceAll(" ", "&nbs;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					board.setBoDate(rs.getString("boDate").substring(0,11));
					board.setBoContent(rs.getString("boContent").replaceAll(" ", "&nbs;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
					board.setBoAvailable(rs.getInt("boAvailable"));
					board.setBoardHit(rs.getInt("boardHit"));			
					board.setBoardGroup(rs.getInt("boardGroup"));
					board.setBoardSeq(rs.getInt("boardSeq"));
					board.setBoardLevel(rs.getInt("boardLevel"));
					
					}				
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(rs != null) rs.close();
						if(pstmt != null) rs.close();
						if(conn != null) rs.close();					
					} catch (Exception e) {
						e.printStackTrace();
					}	
				}
				return board;
			}
	    
	    // 답변 작성
 		public int reply(String bmID, String boTitle, String boContent, BoardDTO parent) {
 			
 			Connection conn = null; 			
 			PreparedStatement pstmt = null;
 			String SQL ="INSERT INTO BOARD (bmID, boardID, boTitle, boDate, boContent, boAvailable, boardHit, boardGroup, boardSeq, boardLevel) " +
 	                 "SELECT ?, IFNULL((SELECT MAX(boardID) + 1 FROM BOARD), 1), ?, NOW(), ?, 1, 0, ?, ?, ?"; 				 			
 			try {
 				
 				String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 				String dbID = "root";
 				String dbPassword ="qwer1234";
 				Class.forName("com.mysql.cj.jdbc.Driver");
 				
 				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
 			
 			//	conn = dataSource.getConnection();
 				pstmt = conn.prepareStatement(SQL);
 				pstmt.setString(1, bmID); 				
 				pstmt.setString(2, boTitle);
 				pstmt.setString(3, boContent);
 				pstmt.setInt(4, parent.getBoardGroup());
 				pstmt.setInt(5, parent.getBoardSeq() + 1);
 				pstmt.setInt(6, parent.getBoardLevel() + 1); 				
 				return pstmt.executeUpdate();			
 			} catch(Exception e) {
 				e.printStackTrace();
 			} finally {
 				try {
 					if(pstmt != null) pstmt.close();			
 					if(conn != null) conn.close();					
 				} catch (Exception e) {
 					e.printStackTrace();
 				}	
 			}
 			return -1;//데이터베이스 오류
 		}
 		
		// 답변 업데이드 
		public int replyUpdate(BoardDTO parent) {
			Connection conn= null;
			PreparedStatement pstmt = null;		
			String SQL = "UPDATE BOARD SET boardSeq = boardSeq + 1 WHERE boardGroup = ? AND boardSeq > ?";
			try {
				
 				String dbURL = "jdbc:mysql://localhost/subway?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
				String dbID = "root";
 				String dbPassword ="qwer1234";
 				Class.forName("com.mysql.cj.jdbc.Driver");
 				
 				conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
			
			//	conn = dataSource.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, parent.getBoardGroup());
				pstmt.setInt(2, parent.getBoardSeq());			
				return pstmt.executeUpdate();			
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();			
					if(conn != null) conn.close();					
				} catch (Exception e) {
					e.printStackTrace();
				}	
			}
			return -1;//데이터베이스 오류
		}
	   
	    

}// End
