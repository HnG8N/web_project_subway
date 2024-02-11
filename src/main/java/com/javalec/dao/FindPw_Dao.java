package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FindPw_Dao {

	// Field
	DataSource dataSource;

	// Constructor
	public FindPw_Dao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/subway");
			// lookup은 데이터를 찾는 api
			// java:com/env = Context.xml
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int checkInfo(String id ,String name, String date, String email) {

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
			String query = "SELECT COUNT(mregdate) AS count "
					+"FROM member AS m "
					+"WHERE mid='"+ id +"' AND mname='"+ name +"' AND mbirth = '"+ date +"' AND memail='"+ email +"' "
					+"GROUP BY m.mid, mname, mbirth, memail";

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

	public String findPw(String id, String name, String date, String email) {

		// connection, preparedstatement, resultset 에 값을 미리 넣어두면 해킹당할 위험이 높음
		// Connection 인터페이스는 데이터베이스와의 연결
		// PreparedStatement 인터페이스는 SQL 쿼리를 실행하기 위한 객체
		// ResultSet 인터페이스는 데이터베이스에서 가져온 쿼리 결과
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		String mpw = "";
		try {
			// data 베이스 연결
			connection = dataSource.getConnection();
			// 쿼리 작성
			String query = "select mpw "
					+"FROM member AS m "
					+"WHERE mid='"+ id +"' AND mname='"+ name +"' AND mbirth = '"+ date +"' AND memail='"+ email +"' "
					+"GROUP BY m.mid, mname, mbirth, memail";

			// 작성한 쿼리를 데이터 connection을 사용하여 실행
			preparedStatement = connection.prepareStatement(query);

			// 실행한 쿼리문을 resultset에 삽입
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {
				mpw = resultset.getString("mpw");
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
		return mpw;
	}

}
