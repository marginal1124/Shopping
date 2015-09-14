package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.util.Cart;
import com.shopping.util.CartItem;
import com.shopping.util.DB;
import com.shopping.util.Product;
import com.shopping.util.SalesItem;
import com.shopping.util.SalesOrder;
import com.shopping.util.User;

public class OrderMysqlDAO {

	public void saveOrder(SalesOrder  so) throws SQLException {
		//将订单中的购物车 插入数据库
		Connection conn = null;
		String sql=null;
		sql = "insert into salesorder values(null,?,?,?,?)";
		
	
		PreparedStatement pStmt = null;
		ResultSet rsKey =null;
		try {
			conn=DB.getConn();
			conn.setAutoCommit(false);
			
			pStmt = DB.getpStmt(conn, sql,true);
		
			//pStmt.setInt(1, c.getId());
			pStmt.setInt(1,so.getUser().getId());
			pStmt.setString(2, so.getAdrr());
			
			pStmt.setTimestamp(3,so.getoDate());
			pStmt.setInt(4,so.getStatus());
			
			pStmt.executeUpdate();
			rsKey=pStmt.getGeneratedKeys();
			rsKey.next();
			int key = rsKey.getInt(1);
			
			//将购物车中每个 购买的东西插入数据库
			
			String  sqlItem = "insert into salesitem  values (null,?,?,?,?)";
			pStmt = DB.getpStmt(conn, sqlItem);
			
			Cart  cart = so.getCart(); 
			List<CartItem>  items = cart.getItem();
			
			for(int i=0;i<items.size();i++){
				CartItem  ci = items.get(i);
				pStmt.setInt(1,ci.getProductId());
				pStmt.setDouble(2, ci.getPrice());
				pStmt.setInt(3,ci.getCount());
				pStmt.setInt(4,key);
				pStmt.addBatch();
			}
			pStmt.executeBatch();
			
			conn.commit();
			conn.setAutoCommit(true);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			conn.setAutoCommit(true);
			conn.rollback();
			//return false;
		}finally{
			DB.closeStmt(pStmt);
			DB.closeResultSet(rsKey);
			DB.closeConn(conn);
		}
		//return true;
	}

	public int getOrders(List<SalesOrder> orders, int pageNum, int pageSize) {
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rsCount = null;
		int count =0;
		String sql =  "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
				+ " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder "
				+ " left join user on (salesorder.userid = user.id)"
				+ " limit " + (pageNum - 1) * pageSize + "," + pageSize;
		System.out.println(sql);
		String sqlCount ="select count(*) from salesorder";
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			rsCount = DB.executeQuery(conn, sqlCount);			
			
			rsCount.next();
			count = (rsCount.getInt(1)/pageSize)+1;
						
			while(rs.next()){
				System.out.println(rs.getInt("id"));
				SalesOrder so = new SalesOrder();
				so.setId(rs.getInt("id"));
				so.setAdrr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				//先将user 从数据库中取出  上面繁琐的 sql 语句
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));
				
				so.setUser(u);
				orders.add(so);
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

	public SalesOrder loadById(int id) {
		Connection conn = null;
		ResultSet rs = null;
		
		String sql =  "select salesorder.id, salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
				+ " user.id uid, user.username, user.password, user.addr uaddr, user.phone, user.rdate from salesorder "
				+ " left join user on (salesorder.userid = user.id) where salesorder.id = "+id;
		System.out.println(sql);
		SalesOrder so=null;
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
					
			if(rs.next()){
				
				so = new SalesOrder(); 
				so.setId(rs.getInt("id"));
				so.setAdrr(rs.getString("addr"));
				so.setoDate(rs.getTimestamp("odate"));
				so.setStatus(rs.getInt("status"));
				//先将user 从数据库中取出  上面繁琐的 sql 语句
				User u = new User();
				u.setId(rs.getInt("uid"));
				u.setAddr(rs.getString("uaddr"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setRdate(rs.getTimestamp("rdate"));
				u.setUsername(rs.getString("username"));
				
				so.setUser(u);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
			
			DB.closeConn(conn);
		
		}
		return so;
	}

	public List<SalesItem> getSalesItems(SalesOrder order) {
		List<SalesItem> items =new ArrayList<SalesItem>();
		
		Connection conn = null;
		ResultSet rs = null;
		
		String sql =  "select salesorder.id , salesorder.userid, salesorder.odate, salesorder.addr, salesorder.status , "
				+ " salesitem.id sid, salesitem.productid, salesitem.unitprice, salesitem.pcount,salesitem.orderid, "
				+ "product.id pid , product.name pname , product.normalprice , product.memberprice , product.pdate "				
				+ " from salesorder "
				+ " join salesitem on (salesorder.id = salesitem.orderid)"
				+ " join product on (salesitem.productid = product.id) where salesorder.id = "+order.getId();
		System.out.println(sql);
		
		try {
			conn = DB.getConn();
			rs = DB.executeQuery(conn, sql);
			
						
			while(rs.next()){
				SalesItem item = new SalesItem();
				item.setCount(rs.getInt("pcount"));
				item.setId(rs.getInt("sid"));
				item.setOrder(order);
				item.setOrderId(order.getId());
				item.setUnitprice(rs.getDouble("unitprice"));
				
				Product p = new Product();
				
				p.setId(rs.getInt("pid"));
				p.setMemberPrice(rs.getDouble("memberprice"));
				p.setName(rs.getString("pname"));
				p.setNormalPrice(rs.getDouble("normalprice"));
				p.setPdate(rs.getTimestamp("pdate"));
						
				item.setProduct(p);
				
				items.add(item);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DB.closeResultSet(rs);
		
			DB.closeConn(conn);
		
		}
		
		return  items;
	}

	public void updateStatus(SalesOrder order) {
		//将订单中的购物车 插入数据库
				Connection conn = null;
				String sql=null;
				sql = "update salesorder set status = " + order.getStatus()+" where id ="+order.getId();	
				
				try {
					conn=DB.getConn();
					DB.executeUpdate(conn, sql);
				}finally{
					
					DB.closeConn(conn);
				}
	}

}
