package com.shopping.util;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement ;

public class DB {

	private static DB  db;
	static{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private DB(){}
	
	public static Connection getConn(){
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static  void closeConn(Connection conn){
		if(conn !=null){
			try {
				conn.close();
				conn = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public static Statement getStmt(Connection conn){
		Statement stmt =null;
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
				
	}
	
	public static void closeStmt(Statement stmt){
		if(stmt!=null){
			try {
				stmt.close();
				stmt = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static PreparedStatement getpStmt(Connection conn,String sql){
		PreparedStatement pstmt =null;
		try {
			pstmt =  conn.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
				
	}
	public static PreparedStatement getpStmt(Connection conn,String sql,boolean generatedKey){
		PreparedStatement pstmt =null;
		try {
			pstmt =  conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
				
	}
	
    public static ResultSet executeQuery(Statement stmt,String sql){
	
    	ResultSet  rs =null;
    	try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return rs;
    }
    
    public static ResultSet executeQuery(Connection conn,String sql){
    	ResultSet  rs =null;
    	try {
			rs = conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return rs;
    }
    
    public static void closeResultSet(ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
				rs = null;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void executeUpdate(Connection conn, String sql) {
		Statement stmt;
		try {
			stmt = conn.createStatement();
			if(stmt != null) {
				stmt.executeUpdate(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
