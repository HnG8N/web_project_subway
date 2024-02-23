package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.CartDto;

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
			String query = "INSERT INTO orderpurchase (omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, odate) "
					+ " 						SELECT cmid, cmncode, clength, cbread, ctoast, ccheese, cbegetables, csauce, ctotprice, NOW() \n"
					+ "							  FROM cart \n"
					+ "							 WHERE cmid = '"+cmid+" AND cseq = " + cseq;

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

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
	
	//getOrderNumber()
	public int getOrderNumber() {
		int orderNo = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
			try {
				
				connection = dataSource.getConnection();	
				String query ="SELECT MAX(oseq) AS maxNo "
						+ "FROM orderpurchase ";

				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
//					System.out.println(query);
				while (resultset.next()) {
					
					orderNo = resultset.getInt("maxNo"); 
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
		
	}//getMyCart
		
	// getMyOrder
	public int getMyOrder(String mid) {
		int orderNo = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
			try {
				
				connection = dataSource.getConnection();	
				String query ="SELECT MAX(oseq) AS maxNo "
						+ "FROM orderpurchase ";

				preparedStatement = connection.prepareStatement(query);
				resultset = preparedStatement.executeQuery();
//					System.out.println(query);
				while (resultset.next()) {
					
					orderNo = resultset.getInt("maxNo"); 
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
		
	}//getMyCart
}
