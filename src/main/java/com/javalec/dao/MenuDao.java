package com.javalec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.dto.MenuDto;

/* ----------------------------------------
 *  Description : MenuDto
 *  Date        : 2024.02.06(Tue)
 *  Author      : sujin
 * ---------------------------------------- */

public class MenuDao {
	// field
	DataSource dataSource;
	
	// Constructor
	public MenuDao() {
		try{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/subway"); 	//[java:comp/env]는 context.xml의 위치. [jdbc/mvc]	는 이름. 		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// Method
	public ArrayList<MenuDto> getMenuList(String mnctg) {
		
		ArrayList<MenuDto> dtos = new ArrayList<MenuDto>();
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultset = null;
	 
		try {
			
			connection = dataSource.getConnection();	
			String query ="SELECT mncode, mnname, mnengname, mninfo, mnimg, mnprice "
					+ "FROM menu " 
					+ "WHERE mnctg ='"+mnctg+"'";			
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
//			System.out.println(query);
			while (resultset.next()) {
				
				int mncode = resultset.getInt("mncode"); 
				String mnname = resultset.getString("mnname");
				String mnengname = resultset.getString("mnengname");
				String mninfo = resultset.getString("mninfo");
				String mnimg = resultset.getString("mnimg");
				int mnprice = resultset.getInt("mnprice"); 
				
				MenuDto dto = new MenuDto(mncode, mnctg, mnname, mnengname, mninfo, mnimg, mnprice);

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
	// 메뉴 상세페이지
	public MenuDto getMenuDetail(int mncode) {
		
		MenuDto dto = null;
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		 
		try {
			
			connection = dataSource.getConnection();	
			String query ="SELECT m.mncode, m.mnctg, m.mnname, m.mnengname, m.mninfo, m.mnimg, m.mnprice, s.mngram, s.mnkcal, s.mnprotein, s.mnfat, s.mnsugar, s.mnnatrum "
					+ " FROM menu m, menuspec s "
					+ " WHERE m.mncode = s.mncode "
					+ " AND m.mncode = " + mncode;			
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
//			System.out.println(query);
			while (resultset.next()) {
				
				String mnctg = resultset.getString("mnctg");
				String mnname = resultset.getString("mnname");
				String mnengname = resultset.getString("mnengname");
				String mninfo = resultset.getString("mninfo");
				String mnimg = resultset.getString("mnimg");
				int mnprice = resultset.getInt("mnprice"); 
				double mngram = resultset.getDouble("mngram");
				double mnkcal = resultset.getDouble("mnkcal");
				double mnprotein = resultset.getDouble("mnprotein");
				double mnfat = resultset.getDouble("mnfat");
				double mnsugar = resultset.getDouble("mnsugar");
				double mnnatrum = resultset.getDouble("mnnatrum");
				
				dto = new MenuDto(mncode, mnctg, mnname, mnengname, mninfo, mnimg, mnprice, mngram, mnkcal, mnprotein, mnfat, mnsugar, mnnatrum);

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
		return dto;
	}
}
