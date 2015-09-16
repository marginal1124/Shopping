package com.shopping.util;

import java.sql.*;
import java.util.List;

import com.shopping.util.*;

public class CategoryDAO {

	public  static void save(Category c){
		Connection conn = DB.getConn();
		//System.out.println("dao");
		String sql=null;
		if(c.getId()==-1){
			sql = "insert into category values(null,?,?,?,?,?)";
		}else {
			sql = "insert into category values("+c.getId()+",?,?,?,?,?)";
		}
		
		//System.out.println("insert");
		PreparedStatement pStmt = DB.getpStmt(conn, sql);
		
		try {
			//pStmt.setInt(1, c.getId());	
			pStmt.setInt(1, c.getPid());
			pStmt.setString(2,c.getName());
			pStmt.setString(3, c.getDescr());
			
			pStmt.setInt(4, c.isIsleaf()?0:1);
			pStmt.setInt(5,c.getGrade());
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeStmt(pStmt);
			DB.closeConn(conn);
		}
	}
	public static void getCategories(List<Category> list,int id){
		Connection conn = null;	
	
		try {
			conn = DB.getConn();	
			getCategories(conn, list, id);
		}finally{		
			DB.closeConn(conn);
		}
	}
	
	private static void getCategories(Connection conn,List<Category> list,int id){
		
		String sql= null;			
		ResultSet rs = null;
		
		try {
			
			sql = "select *  from category where pid="+id;
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Category  c = new Category();
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setIsleaf(rs.getInt("isleaf")==0?true:false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);
				if(!c.isleaf){
					getCategories(conn,list, c.getId());
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			
		}
	}
	
	public static void addChildCategories(int pid,String name,String descr){
		Connection conn =null;		
		ResultSet rs = null;
		PreparedStatement pStmt = null;
		int grade=0;
		
		try {
			conn=DB.getConn();
			//想在一个事务里进行多个操作。就必然将setAutoCommit的参数设置成false，
			//在多个操作的最后调用conn.commit()方法，进行手动提交
			conn.setAutoCommit(false);
			rs =DB.executeQuery(conn, "select *  from category where id ="+pid);;
			rs.next();			
			grade = rs.getInt("grade");

		    String sql = "insert into category values(null,?,?,?,?,?)";
		    pStmt = DB.getpStmt(conn, sql);				
			pStmt.setInt(1, pid);
			pStmt.setString(2,name);
			pStmt.setString(3, descr);
			
			pStmt.setInt(4, 0);
			pStmt.setInt(5,grade+1);
			pStmt.executeUpdate();
			
			//更新父节点为非叶子结点
			DB.executeUpdate(conn, "update category set isleaf=1 where id ="+pid);
			
			conn.commit();
		} catch (SQLException e) {
			
			try {
				//如果多个操作中有失败的，进入catch 事物会回滚，之前的操作不会插入数据库
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DB.closeStmt(pStmt);
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
	}
	public static String findName(int id) {
		Connection conn = null;	
		String sql= null;	
		
		ResultSet rs = null;
		Category  c =null;
		try {
			conn = DB.getConn();	
			sql = "select *  from category where id="+id;
			rs = DB.executeQuery(conn, sql);
			
			rs.next();
				c = new Category();
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setIsleaf(rs.getInt("isleaf")==0?true:false);
				c.setGrade(rs.getInt("grade"));


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		return c.getName();
	}
	
	public static Category  loadById(int id){
		Category c = null;
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select *  from category  where id ="+id;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			rs.next();
			c = new Category();
			c.setDescr(rs.getString("descr"));
			c.setGrade(rs.getInt("grade"));
			c.setId(rs.getInt("id"));
			c.setIsleaf(rs.getInt("isleaf")==1?false:true);
			c.setName(rs.getString("name"));
			c.setPid(rs.getInt("pid"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}	
		
		return c;
		
	}
	public static void getChildCategories(List<Category> childs, int id) {
		Connection conn = null;	
		
		try {
			conn = DB.getConn();	
			getChiladCategories(conn, childs, id);
		}finally{		
			DB.closeConn(conn);
		}
		
	}
	
	private static void getChiladCategories(Connection conn,List<Category> list,int id){
		
		String sql= null;			
		ResultSet rs = null;
		
		try {
			
			sql = "select *  from category where pid="+id;
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Category  c = new Category();
				c.setId(rs.getInt("id"));
				c.setPid(rs.getInt("pid"));
				c.setName(rs.getString("name"));
				c.setDescr(rs.getString("descr"));
				c.setIsleaf(rs.getInt("isleaf")==0?true:false);
				c.setGrade(rs.getInt("grade"));
				list.add(c);				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			
		}
	}
	
}
