package com.java.bean;

import javax.tools.JavaCompiler;

public class User implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	
	protected int id;
	protected String itemNo;
	protected String itemName;
	protected String purchaseDate;
	protected String quantity;

	public User(String itemNo, String itemName, String purchaseDate, String quantity) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.purchaseDate = purchaseDate;
		this.quantity = quantity;
	}

	public User(int id, String itemNo, String itemName, String purchaseDate, String quantity) {
		super();
		this.id = id;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.purchaseDate = purchaseDate;
		this.quantity = quantity;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}	
}
