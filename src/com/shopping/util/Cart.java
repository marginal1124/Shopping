package com.shopping.util;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartItem>  items = new ArrayList<CartItem>();

	public List<CartItem> getItem() {
		return items;
	}

	public void setItem(List<CartItem> items) {
		this.items = items;
	}
	
	public void addItem(CartItem item){
		for(int i = 0;i<items.size();i++){
			CartItem itemPro = items.get(i);
			if(itemPro.getProductId()==item.getProductId()){
				
				itemPro.setCount(itemPro.getCount()+1);
				return;
			}
		}
		
		items.add(item);
	}
	
   public double getTotalSum(){
	   double  sum =0;
	   for(int i = 0;i<items.size();i++){
			CartItem itemPro = items.get(i);
			sum+=itemPro.getTotalPrice();
			}
	   
	   return sum;
		}
	   
	   
   }
	

