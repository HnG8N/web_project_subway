package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.IngredientDto;

public class IngredientDao {
	// Field
	DataSource dataSource;
	
	// Constructor
	public IngredientDao() {
		try{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/subway"); 	//[java:comp/env]는 context.xml의 위치. [jdbc/mvc]	는 이름. 		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Method
	// 카테고리별 재료 가져오기
	public ArrayList<IngredientDto> getIngredient(String ctg) {
		
		ArrayList<IngredientDto> dtos = new ArrayList<IngredientDto>();
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
		try {
			
			connection = dataSource.getConnection();	
			String query ="SELECT icode, ictg, iname, iengname, iinfo, iimg "
					+ " FROM ingregients "
					+ " WHERE ictg = '" + ctg + "'";			
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
//			System.out.println(query);
			while (resultset.next()) {
				
				int icode = resultset.getInt("icode"); 
				String ictg = resultset.getString("ictg");
				String iname = resultset.getString("iname");
				String iengname = resultset.getString("iengname");
				String iinfo = resultset.getString("iinfo");
				String iimg = resultset.getString("iimg");
				
				IngredientDto dto = new IngredientDto(icode, ictg, iname, iengname, iinfo, iimg);
				
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
	}
}
