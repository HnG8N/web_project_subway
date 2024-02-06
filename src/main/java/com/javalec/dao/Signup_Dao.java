package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Signup_Dao {

	// Field
	DataSource dataSource;

	// Constructor
	public Signup_Dao() {
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
	public void signUpMember(String mid, String mpw, String mname, String maddress, String mtel, String mbirth) {

		// connection, preparedstatement, resultset 에 값을 미리 넣어두면 해킹당할 위험이 높음
		// Connection 인터페이스는 데이터베이스와의 연결
		// PreparedStatement 인터페이스는 SQL 쿼리를 실행하기 위한 객체
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "insert into member(mid, mpw, mname, maddress, mtel, mbirth, mregdate) values(?,?,?,?,?,?,now())";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// ?에 값 넣어주기
			preparedStatement.setString(1, mid);
			preparedStatement.setString(2, mpw);
			preparedStatement.setString(3, mname);
			preparedStatement.setString(4, maddress);
			preparedStatement.setString(5, mtel);
			preparedStatement.setString(6, mbirth);

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
	}
}