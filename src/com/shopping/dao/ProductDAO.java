package com.shopping.dao;

import java.util.Date;
import java.util.List;

import com.shopping.util.Product;

public interface ProductDAO {
	public  List<Product> getProduct();
	public  List<Product> getProduct(int pageNum,int pageSize);
	
	public List<Product> findProduct(int[] categoryId,
			 String keyword,
			 double lowNormalPrice,
			 double highNormalPrice,
			 double lowMemberPrice,
			 double highMemberPrice,
			 Date startDate,
			 Date endDate,
			 int pageNum,
			 int pageSize);
	
	public int findProduct(List<Product> products,int[] categoryId,
			 String keyword,
			 double lowNormalPrice,
			 double highNormalPrice,
			 double lowMemberPrice,
			 double highMemberPrice,
			 Date startDate,
			 Date endDate,
			 int pageNum,
			 int pageSize);
	
	public boolean deleteProductByCategoryId(int categoryId);
	
	public boolean deleteProductById(int[] idArray);
	
	public boolean  updateProduct(Product p);
	public boolean addProduct(Product c);
	public int getProduct(List<Product> products, int pageNum, int pageSize);
	public Product loadById(int id);
	public  List<Product>  latestProduct(int num);
	
}
