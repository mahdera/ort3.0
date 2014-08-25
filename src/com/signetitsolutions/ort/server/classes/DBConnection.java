/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.signetitsolutions.ort.server.classes;

import java.sql.*;

/**
 * 
 * @author mahder
 */
public class DBConnection {

	private static Connection con;
	private static Statement stmt;
	private static ResultSet rSet;
	private static final String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/db_ort?useUnicode=true&characterEncoding=UTF-8";
	private static boolean connected;

	public DBConnection() {

	}

	private static void connect() throws Exception {
		Class.forName(DATABASE_DRIVER).newInstance();
		con = DriverManager.getConnection(DATABASE_URL, "root", "");
		stmt = con.createStatement();
		connected = true;
	}

	public static Connection getDatabaseConnection() throws Exception {
		connect();
		Connection connection = getCon();
		return connection;
	}

	public static void disconnectDatabase() {
		try {
			stmt.close();
			con.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	}

	public static ResultSet readFromDatabase(String query) {
		try {
			connect();
			rSet = stmt.executeQuery(query);
		} catch (Exception sqle) {
			sqle.printStackTrace();
		}
		return rSet;
	}

	public static boolean isConnected() {
		return connected;
	}

	public static void writeToDatabase(String command) {
		try {
			connect();
			stmt.executeUpdate(command);
		} catch (Exception sqle) {
			sqle.printStackTrace();
		}
	}

	public static Connection getCon() {
		return con;
	}

	public static void setCon(Connection con) {
		DBConnection.con = con;
	}
	
	public static void writeToDatabase(PreparedStatement preparedStatement){
		try{
			preparedStatement.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static ResultSet readFromDatabase(PreparedStatement pStmt){
		ResultSet rSet = null;
		try{
			rSet = pStmt.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		return rSet;
	}
	
	public static PreparedStatement getPreparedStatement(String sqlString){
			PreparedStatement preparedStatement = null;
			try{
				connect();
				preparedStatement = getCon().prepareStatement(sqlString);
			}catch(Exception e){
				e.printStackTrace();
			}
			return preparedStatement;
	}

}// end class

