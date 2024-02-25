package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.CartDto;
import com.javalec.dto.OrderDto;

public class OrderDao {
	// Field
	DataSource dataSource;

	// Constructor
	public OrderDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/subway");
			// lookup은 데이터를 찾는 api
			// java:com/env = Context.xml
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	// Method
	public int addOrder(int cseq, String cmid) {
		int execnt = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "INSERT INTO orderpurchase (omid, omncode, omnname, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, oqty, odate) \n"
					+ " 						SELECT cmid, cmncode, mn.mnname, clength, cbread, ctoast, ccheese, cvegetables, csauce, cprice, cqty, NOW() \n"
					+ "							  FROM cart c, menu mn \n"
					+ "							 WHERE c.cmncode = mn.mncode \n"
					+ "							   AND cmid = '"+cmid+"' AND cseq = " + cseq;

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);
//			System.out.println(query);
			// 실행
			execnt = preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 데이터 정리하는 용도로 쓰임 (만든 순서 거꾸로 정리해야함)
			try {

				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e) {

			}
		}
		return execnt;
	}//addOrder
	//deleteCartItem
	public int deleteCartItem(int cseq, String cmid) {
		int execnt = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "DELETE FROM cart "
						+ " WHERE cseq = ? AND cmid = ? ";
			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);
			
			// ?에 값 넣어주기
			preparedStatement.setInt(1, cseq);
			preparedStatement.setString(2, cmid);
			
			// 실행
			execnt = preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 데이터 정리하는 용도로 쓰임 (만든 순서 거꾸로 정리해야함)
			try {
				
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (Exception e) {
				
			}
		}
		return execnt;
	}// end
	//getOrderNumber()
	public String getOrderNumber() {
		String orderNo = "";
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
			try {
				
				connection = dataSource.getConnection();	
				String query ="SELECT CONCAT(DATE_FORMAT(NOW(), '%y%m%d'), LPAD(IFNULL(MAX(SUBSTR(SEQ, -5)), 1), 5, '0')) AS orderMaxNo "
						+ "		FROM ("
						+ "			SELECT MAX(CAST(oseq AS SIGNED))+1 AS SEQ FROM orderpurchase "
						+ "		) AA "
						+ "		WHERE AA.SEQ LIKE CONCAT(DATE_FORMAT(NOW(), '%y%m%d'), '%'); ";

				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
//				System.out.println(query);
				while (resultset.next()) {
					orderNo = resultset.getString("orderMaxNo"); 
				}	
	                      
			} catch (Exception e) {
				e.printStackTrace();
			} finally { 
				try {
					if (resultset != null) {
						resultset.close();
					}
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (Exception e) {

				}
			}
			return orderNo;
		
	}// end.
		
	// getMyOrder
	public ArrayList<OrderDto> getMyOrder(String mid) {
		ArrayList<OrderDto> dtos = new ArrayList<OrderDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
			try {
				
				connection = dataSource.getConnection();
				
				String query ="SELECT oseq, omid, omncode, omnname, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, oqty, odate \n"
						+ "FROM orderpurchase \n"
						+ " WHERE omid ='"+mid+"' AND odate>curdate()";

				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
//					System.out.println(query);
				while (resultset.next()) {
					
					int oseq = resultset.getInt("oseq"); 
					String omid = resultset.getString("omid");
					int omncode = resultset.getInt("omncode"); 
					String omnname = resultset.getString("omnname"); 
					int olength = resultset.getInt("olength"); 
					String obread = resultset.getString("obread");
					String otoast = resultset.getString("otoast");
					String ocheese = resultset.getString("ocheese");
					String ovegetables = resultset.getString("ovegetables");
					String osauce = resultset.getString("osauce");
					int oprice = resultset.getInt("oprice"); 
					int oqty = resultset.getInt("oqty"); 
					
					OrderDto dto = new OrderDto(oseq, omid, omncode, omnname, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, oqty);
					
					dtos.add(dto);
				}	
	                      
			} catch (Exception e) {
				e.printStackTrace();
			} finally { 
				try {
					if (resultset != null) {
						resultset.close();
					}
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (Exception e) {

				}
			}
			return dtos;
		
	}//getMyCart
	// 로그인한 사용자의 전화번호 가져오기.
		public String getTelNo(String mid) {
			String telno = "";
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			ResultSet resultset = null;
			 
			try {
				
				connection = dataSource.getConnection();
				
				String query ="SELECT mtel \n"
						+ " FROM member \n"
						+ " WHERE mid ='"+mid+"'";

				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
//							System.out.println(query);
				while (resultset.next()) {
					
					telno = resultset.getString("mtel");
					
				}	
	                      
			} catch (Exception e) {
				e.printStackTrace();
			} finally { 
				try {
					if (resultset != null) {
						resultset.close();
					}
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (Exception e) {

				}
			}
			return telno;
		}
}
