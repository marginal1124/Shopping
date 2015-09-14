package com.shopping.util;
import java.sql.SQLException;
import java.util.List;

import com.shopping.dao.*;
public class OrderManager {

	//单例
		private static OrderManager om=null;
		private OrderManager(){}
		
		public static  OrderManager getManager(){
			if(om==null){
				om = new OrderManager();
				om.setDao(new OrderMysqlDAO());
				return om;
			}else 
				return om;
		}
		
	    OrderMysqlDAO dao = null;
		public OrderMysqlDAO getDao() {
			return dao;
		}

		public void setDao(OrderMysqlDAO dao) {
			this.dao = dao;
		}
	public  void  saveOrder(SalesOrder  so) throws SQLException{
		dao.saveOrder(so);
	}
	public  int getOrders(List<SalesOrder> orders,int pageNum,int PAGE_SIZE){
		return dao.getOrders(orders,pageNum,PAGE_SIZE);
	}
	public SalesOrder  loadById(int id){
		return dao.loadById(id);
	}

	public List<SalesItem> getSalesItems(SalesOrder order) {
		return  dao.getSalesItems(order);
	}
	public void updateStatus(SalesOrder order){
		dao.updateStatus(order);
	}
}
