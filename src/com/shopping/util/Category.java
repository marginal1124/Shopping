package com.shopping.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Category {
	int  id;
	String name;
	String descr;
	int pid;
	boolean isleaf;
	int grade;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public boolean isIsleaf() {
		return isleaf;
	}
	public void setIsleaf(boolean isleaf) {
		this.isleaf = isleaf;
	}
	
	public static void add(Category c){
		CategoryDAO.save(c);
	}
	public  static void addTopCategory(String name,String descr){
		Category c = new Category();
		//System.out.println("category");
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setIsleaf(true);
		c.setGrade(0);
		add(c);
		
	}
	public static  List<Category> getCategories(){
		
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);
		return list;
	}
	public static void addChildCategory(String name, String descr,int pid){
		CategoryDAO.addChildCategories(pid,name,descr);
	}
	
	public boolean isLeaf(int isleaf){
		if(isleaf==0)
			return true;
		else return false;
	}
	

	
	public static void deleteCategory(int id){
		Connection conn = null;
		Statement stmt = null;
		try {
		conn = DB.getConn();
		stmt = DB.getStmt(conn);
		stmt.executeUpdate("delete from category where id="+id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(stmt);
			DB.closeConn(conn);
		}
	}
	
}
