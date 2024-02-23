package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	public void addCart(String omid, int omncode, int olength, String obread, String otoast,String ocheese, String ovegetables,String osauce, int oprice) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "INSERT INTO orderpurchase (omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, odate) VALUES (?,?,?,?,?,?,?,?,?,now())";
			
			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);
			
			// ?에 값 넣어주기
			preparedStatement.setString(1, omid);
			preparedStatement.setInt(2, omncode);
			preparedStatement.setInt(3, olength);
			preparedStatement.setString(4, obread);
			preparedStatement.setString(5, otoast);
			preparedStatement.setString(6, ocheese);
			preparedStatement.setString(7, ovegetables);
			preparedStatement.setString(8, osauce);
			preparedStatement.setInt(9, oprice);
			
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
	}//addOrder
	public void addOrder(String omid, int omncode, int olength, String obread, String otoast,String ocheese, String ovegetables,String osauce, int oprice) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "INSERT INTO orderpurchase (omid, omncode, olength, obread, otoast, ocheese, ovegetables, osauce, oprice, odate) VALUES (?,?,?,?,?,?,?,?,?,now())";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// ?에 값 넣어주기
			preparedStatement.setString(1, omid);
			preparedStatement.setInt(2, omncode);
			preparedStatement.setInt(3, olength);
			preparedStatement.setString(4, obread);
			preparedStatement.setString(5, otoast);
			preparedStatement.setString(6, ocheese);
			preparedStatement.setString(7, ovegetables);
			preparedStatement.setString(8, osauce);
			preparedStatement.setInt(9, oprice);

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
	}//addOrder
}
