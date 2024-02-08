package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.Login_Dto;
import com.javalec.dto.Signup_Dto;

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
	public void signUpMember(String mid, String mpw, String mname, String maddress, String mtel, String mbirth, String memail) {

		// connection, preparedstatement, resultset 에 값을 미리 넣어두면 해킹당할 위험이 높음
		// Connection 인터페이스는 데이터베이스와의 연결
		// PreparedStatement 인터페이스는 SQL 쿼리를 실행하기 위한 객체
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "insert into member(mid, mpw, mname, maddress, mtel, mbirth, memail, mregdate) values(?,?,?,?,?,?,?,now())";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// ?에 값 넣어주기
			preparedStatement.setString(1, mid);
			preparedStatement.setString(2, mpw);
			preparedStatement.setString(3, mname);
			preparedStatement.setString(4, maddress);
			preparedStatement.setString(5, mtel);
			preparedStatement.setString(6, mbirth);
			preparedStatement.setString(7, memail);

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
	
	public int checkId(String mid) {

		// connection, preparedstatement, resultset 에 값을 미리 넣어두면 해킹당할 위험이 높음
		// Connection 인터페이스는 데이터베이스와의 연결
		// PreparedStatement 인터페이스는 SQL 쿼리를 실행하기 위한 객체
		// ResultSet 인터페이스는 데이터베이스에서 가져온 쿼리 결과
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		int count = 0;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			 String query = "select count(mid) as count from member where mid = '" + mid + "'";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// 실행한 쿼리문을 resultset에 삽입
			resultset = preparedStatement.executeQuery();

            while (resultset.next()) {
                count = resultset.getInt("count");
            }

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 데이터 정리하는 용도로 쓰임 (만든 순서 거꾸로 정리해야함)
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
		return count;
	}
	
	public int checkEmail(String memail) {

		// connection, preparedstatement, resultset 에 값을 미리 넣어두면 해킹당할 위험이 높음
		// Connection 인터페이스는 데이터베이스와의 연결
		// PreparedStatement 인터페이스는 SQL 쿼리를 실행하기 위한 객체
		// ResultSet 인터페이스는 데이터베이스에서 가져온 쿼리 결과
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		int count = 0;

		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			 String query = "select count(memail) as count from member where memail = '" + memail + "'";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// 실행한 쿼리문을 resultset에 삽입
			resultset = preparedStatement.executeQuery();

            while (resultset.next()) {
                count = resultset.getInt("count");
            }

		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 데이터 정리하는 용도로 쓰임 (만든 순서 거꾸로 정리해야함)
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
		return count;
	}


}
	
