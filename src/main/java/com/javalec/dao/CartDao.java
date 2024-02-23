package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.CartDto;
import com.javalec.dto.MenuDto;

public class CartDao {
	// Field
	DataSource dataSource;

	// Constructor
	public CartDao() {
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
	public void addCart(String cmid, int cmncode, int clength, String cbread, String ctoast, String ccheese,
			String cvegetables, String csauce, int ctotprice, int cqty) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "INSERT INTO cart (cmid, cmncode, clength, cbread, ctoast, ccheese, cvegetables, csauce, ctotprice, cqty) "
					+ "			 VALUES (?,?,?,?,?,?,?,?,?,IFNULL(?,0))";
			
			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);
			
			// ?에 값 넣어주기
			preparedStatement.setString(1, cmid);
			preparedStatement.setInt(2, cmncode);
			preparedStatement.setInt(3, clength);
			preparedStatement.setString(4, cbread);
			preparedStatement.setString(5, ctoast);
			preparedStatement.setString(6, ccheese);
			preparedStatement.setString(7, cvegetables);
			preparedStatement.setString(8, csauce);
			preparedStatement.setInt(9, ctotprice);
			preparedStatement.setInt(10, cqty);
			
			// 실행
			preparedStatement.executeUpdate();
			
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
	}//addCart
	
	//getMyCart(cmid)
	public ArrayList<CartDto> getMyCart(String cmid) {
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
			try {
				
				connection = dataSource.getConnection();	
				String query ="SELECT c.cseq, c.cmid, c.cmncode, m.mnctg, m.mnname, m.mnimg, m.mnprice, c.clength, c.cbread, c.ctoast, c.ccheese, c.cvegetables, c.csauce, c.ctotprice, c.cqty "
						+ "FROM cart c, menu m "
						+ "WHERE c.cmncode = m.mncode "
						+ " AND c.cmid = '" + cmid + "'";	
				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
				System.out.println(query);
				while (resultset.next()) {
					
					int cseq = resultset.getInt("cseq"); 
					int cmncode = resultset.getInt("cmncode"); 
					String mnctg = resultset.getString("mnctg");
					String mnname = resultset.getString("mnname");
					String mnimg = resultset.getString("mnimg");
					int mnprice = resultset.getInt("mnprice"); 
					int clength = resultset.getInt("clength");
					String cbread = resultset.getString("cbread");
					String ctoast = resultset.getString("ctoast");
					String cvegetables = resultset.getString("cvegetables");
					String ccheese = resultset.getString("ccheese");
					String csauce = resultset.getString("csauce");
					int ctotprice = resultset.getInt("ctotprice");
					int cqty = resultset.getInt("cqty");
					
					CartDto dto = new CartDto(cseq, cmid, cmncode, mnctg, mnname, mnimg, mnprice, clength, cbread, ctoast, ccheese, cvegetables, csauce, ctotprice, cqty);
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
	
	// chageQty
	// `subway`.`cart` SET `cqty` = '2' WHERE (`cseq` = '1') and (`cmid` = 'james') and (`cmncode` = '1');
	public int chageQty(int cqty, int cseq, String cmid) {
		int execnt = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "UPDATE cart SET cqty = ? "
						+ " WHERE cseq = ? AND cmid = ? ";
			
			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);
			
			// ?에 값 넣어주기
			preparedStatement.setInt(1, cqty);
			preparedStatement.setInt(2, cseq);
			preparedStatement.setString(3, cmid);
			
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
	}//
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
	}//
}
