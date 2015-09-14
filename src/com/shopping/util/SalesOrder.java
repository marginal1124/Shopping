package com.shopping.util;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import  com.shopping.dao.*;

public class SalesOrder {

	int id;
	User  user;
	String adrr;
	Timestamp oDate;
	int status;
	Cart cart;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getAdrr() {
		return adrr;
	}
	public void setAdrr(String adrr) {
		this.adrr = adrr;
	}
	public Timestamp getoDate() {
		return oDate;
	}
	public void setoDate(Timestamp oDate) {
		this.oDate = oDate;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart c) {
		this.cart = c;
	}
	
	public void save() throws SQLException{
		OrderManager.getManager().saveOrder(this);
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<SalesItem> getItems(){
		return OrderManager.getManager().getSalesItems(this);
	}
	public void updateStatus(){
		OrderManager.getManager().updateStatus(this);
	}
}
