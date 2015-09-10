package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shopping.util.DB;
import com.shopping.util.Product;

public class ProductMysqlDAO implements ProductDAO {

	public  List<Product> getProduct(){
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select *  from product";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				list.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		
		return list;
	}
	
	public List<Product> findProduct(int[] categoryId,
			 String keyword,
			 double lowNormalPrice,
			 double highNormalPrice,
			 double lowMemberPrice,
			 double highMemberPrice,
			 Date startDate,
			 Date endDate,
			 int pageNum,
			 int pageSize){
		
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		
		String sql = "select *  from product where 1=1 ";
		
		//String sql = "select *  from product";
		try {
			String strId ="";
			if(categoryId!=null&&categoryId.length!=0){
				int len = categoryId.length;
				strId+="(";
				for(int i=0;i<len;i++){
					if(i<len-1){
						strId+=categoryId[i]+",";
						}
					strId+= categoryId[i]+")";
				}
				sql += " and categoryid = "+strId;
			}
			
			if(keyword!=null&&!keyword.equals("")){
				sql+=" and name like %'"+ keyword +"' "+" or descr like '"+keyword+ "'";
			}
			
			if(lowNormalPrice>=0){
				sql += " and mormalprice < " + lowNormalPrice;
			}
			if(highNormalPrice>0){
				sql += " and mormalprice > "+ highNormalPrice;
			}
			if(lowMemberPrice>=0){
				sql += " and mormalprice < " + lowNormalPrice;
			}
			if(highMemberPrice>0){
				sql += " and mormalprice > "+ highNormalPrice;
			}
			if(startDate!=null){
				sql += " and pdate >= '"+ new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"'";
			}
			if(endDate!=null){
				sql += " and pdate <= '"+ new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"'";
			}
			
			sql+= " limit "+(pageNum-1)*pageSize + ","+ pageSize;
			
			System.out.println("sql"+sql);
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				list.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		
		return list;
	
	}
	
	
	public boolean deleteProductByCategoryId(int categoryId){
		return false;
	}
	
	public boolean deleteProductById(int[] idArray){
		return false;
	}
	
	public boolean  updateProduct(Product p){
		Connection conn = null;
		String sql=null;
		//sql = "insert into product values(null,?,?,?,?,?,?)";
		sql = "update product  set name=?,descr= ? ,normalprice= ?,memberprice =?,categoryid=?  where  id="+p.getId();
	
		
		PreparedStatement pStmt = null;
		
		try {
			conn=DB.getConn();
			pStmt = DB.getpStmt(conn, sql);	
			
			pStmt.setString(1,p.getName());
			
			pStmt.setString(2, p.getDescr());			
			pStmt.setDouble(3, p.getNormalPrice());
			pStmt.setDouble(4,p.getMemberPrice());				
			pStmt.setDouble(5,p.getCategoryId());
			
			System.out.println(sql);
			
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			DB.closeStmt(pStmt);
			DB.closeConn(conn);
		}
		return true;
		
	}

	@Override
	public boolean addProduct(Product c) {
		Connection conn = null;
		String sql=null;
		sql = "insert into product values(null,?,?,?,?,?,?)";
		
	
		PreparedStatement pStmt = null;
		
		try {
			conn=DB.getConn();
			pStmt = DB.getpStmt(conn, sql);
		
			//pStmt.setInt(1, c.getId());
			pStmt.setString(1,c.getName());
			pStmt.setString(2, c.getDescr());
			
			pStmt.setDouble(3, c.getNormalPrice());
			pStmt.setDouble(4,c.getMemberPrice());
			
			pStmt.setTimestamp(5,c.getPdate());
			pStmt.setDouble(6,c.getCategoryId());
			
			pStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			DB.closeStmt(pStmt);
			DB.closeConn(conn);
		}
		return true;
	}

	//可以返回页数的查询
	public  int findProduct(List<Product> products,
							int[] categoryId,
							String keyword,
							double lowNormalPrice,
							double highNormalPrice,
							double lowMemberPrice,
							double highMemberPrice,
							Date startDate,
							Date endDate,
							int pageNum,
							int pageSize){
		
		Connection conn = null;
		conn=DB.getConn();
		Statement  rsStmt = DB.getStmt(conn);
		Statement  rsCOuntStmt = DB.getStmt(conn);
		
		ResultSet rs = null;
		ResultSet rsCount = null;
		int sumSize = 1;
		
		String sql = "select *  from product where 1=1 ";
		//这里难道要把*  换成count（*） 然后全部重写吗？？
		//String sqlCount ="";
		//String sql = "select *  from product";
		try {
			String strId ="";
			if(categoryId!=null&&categoryId.length!=0){
				int len = categoryId.length;
				strId+="( ";
				for(int i=0;i<len;i++){
					if(i<len-1){
						strId+=categoryId[i]+",";
						}else
							strId+= categoryId[i]+" )";
				}
				/*
				 * 之前写的 select *  from product where 1=1  and categoryid = ( 2,3 ) 
				 * 提示 Operand should contain * column(s)
				 * 把等号改成  in 就没有了，不清除为什么
				 * */
				sql += " and categoryid in "+strId;
			}
			
			if(keyword!=null&&!keyword.equals("")){
				sql+=" and name like '"+ keyword +"' "+" or descr like %'"+keyword+ "'";
			}
			
			if(lowNormalPrice>=0){
				sql += " and normalprice > " + lowNormalPrice;
			}
			if(highNormalPrice>0){
				sql += " and normalprice < "+ highNormalPrice;
			}
			if(lowMemberPrice>=0){
				sql += " and memberprice > " + lowMemberPrice;
			}
			if(highMemberPrice>0){
				sql += " and memberprice < "+ highMemberPrice;
			}
			if(startDate!=null){
				sql += " and pdate >= '"+ new SimpleDateFormat("yyyy-MM-dd").format(startDate)+"'";
			}
			if(endDate!=null){
				sql += " and pdate <= '"+ new SimpleDateFormat("yyyy-MM-dd").format(endDate)+"'";
			}
			String sqlCount = sql.replaceFirst("select \\*", "select count(*)");
			
			sql+= " limit "+(pageNum-1)*pageSize + ","+ pageSize;
			
		
			
			System.out.println("sql"+sql);
			System.out.println("sqlCount"+sqlCount);
			//System.out.println("1--");
			//conn = DB.getConn();
			//System.out.println("2---");
			
			rs = rsStmt.executeQuery(sql);
			rsCount = rsCOuntStmt.executeQuery(sqlCount);
			
			/*rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, sqlCount);*/
			//rsCount.next();
			
			if(rsCount.next()){
				//System.out.println("3---");
				sumSize = rsCount.getInt(1)/pageSize +1;
			}
			
			
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				products.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeStmt(rsStmt);
			DB.closeResultSet(rsCount);
			
			DB.closeStmt(rsCOuntStmt);
			
			
			DB.closeConn(conn);
		}
		
		return sumSize;
	
	}
	
	@Override
	public List<Product> getProduct(int pageNum, int pageSize) {
		List<Product> list = new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select *  from product limit "+(pageNum-1)*pageSize+","+pageSize;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				list.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		
		return list;
	}
	
	public int getProduct(List<Product> products,int pageNum, int pageSize) {
	
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int count =0;
		String sql = "select *  from product limit "+(pageNum-1)*pageSize+","+pageSize;
		String sqlCount ="select count(*) from product";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, sqlCount);			
			
			rsCount.next();
			count = (rsCount.getInt(1)/pageSize)+1;
						
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				products.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeResultSet(rsCount);
			DB.closeConn(conn);
		
		}
		return count;
	}

	@Override
	public Product loadById(int id) {	
		Product  product = null	;			
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select *  from product  where id ="+id;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			rs.next();
			product = new Product();
				product.setId(rs.getInt("id"));
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));		
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}	
		return product;
	}

	@Override
	public List<Product> latestProduct(int num) {
		List<Product>  products =  new ArrayList<Product>();
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select *  from product order  by pdate desc limit 0,"+num;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
			while(rs.next()){
				Product product = new Product();
				product.setCategoryId(rs.getInt("categoryid"));
				product.setDescr(rs.getString("descr"));
				product.setId(rs.getInt("id"));
				product.setMemberPrice(rs.getDouble("memberprice"));
				product.setName(rs.getString("name"));
				product.setNormalPrice(rs.getDouble("normalprice"));
				product.setPdate(rs.getTimestamp("pdate"));
				
				products.add(product);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			DB.closeConn(conn);
		}
		
		return products;		
	}
}
