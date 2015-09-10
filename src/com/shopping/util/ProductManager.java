package com.shopping.util;

import java.util.Date;
import java.util.List;

import  com.shopping.dao.*;

public class ProductManager {
	//单例
	private static ProductManager manager=null;
	private ProductManager(){}
	
	public static  ProductManager getManager(){
		if(manager==null){
			manager = new ProductManager();
			manager.setDao(new ProductMysqlDAO());
			return manager;
		}else 
			return manager;
	}
	

/*	private ProductManager(){}
	
	private static class singlePM{		
		private static ProductManager  pm = new ProductManager();	
	}
	
	public ProductManager getProductManager(){
		return singlePM.pm;
	}*/
	
	ProductDAO dao = null;
	
	public boolean addProduct(Product c){
		return dao.addProduct(c);
	}
	
	//列表显示
	public  List<Product> getProduct(){
		return dao.getProduct();
	}
	
	public  List<Product> getProduct(int pageNum,int pageSize){
		return dao.getProduct(pageNum,pageSize);
	}
	public int getProduct(List<Product> products,int pageNum, int pageSize){
		return dao.getProduct(products,pageNum,pageSize);
	}
	
	//搜索：categoryID，名字，描述，价格区间来查询
	
	//一个很复杂的查询方法
	public int findProduct(List<Product> products,
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
		System.out.println("managerFunction");
		if(lowNormalPrice>highNormalPrice)
			highNormalPrice = lowNormalPrice;
		return dao.findProduct(products,categoryId, keyword, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNum, pageSize);
	}
	
	//只根据名称来查询
	public List<Product> findProduct(String name){
		return null;
	}
	
	public boolean deleteProductByCategoryId(int categoryId){
		return false;
	}
	//前台选中很多统一删除
	public boolean deleteProductById(int[] idArray){
		return false;
	}
	//更新
	public boolean  updateProduct(Product p){
		return dao.updateProduct(p);
	}
	
	public List<Product> latestProduct(int num){
		return dao.latestProduct(num);
	}
  	
	public Product  loadById(int id){
		return dao.loadById(id);
	}

	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}
}
