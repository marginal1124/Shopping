package com.shopping.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class User {

	private int id;

	private String username;

	private String password;

	private String phone;

	private String addr;

	private Date rdate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	} 
	
	
	public void save(){
		Connection conn = DB.getConn(); 
		String sql = "insert into user values(null,?,?,?,?,?)";
		PreparedStatement pStmt = DB.getpStmt(conn, sql);
		
		try {
			pStmt.setString(1, username);
		
			pStmt.setString(2, password);
			pStmt.setString(3, phone);
			pStmt.setString(4, addr);
			pStmt.setTimestamp(5, new Timestamp(rdate.getTime()));
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static  List<User> getUser(){
		
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs =null;
		conn = DB.getConn();
		String sql = "select * from user";
		rs = DB.executeQuery(conn, sql);
		try {
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
				
		return list;
	}
}



