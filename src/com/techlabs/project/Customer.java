package com.techlabs.project;

public class Customer {
    private int customer_id;
    private String first_name;
    private String last_name;
    private String email_id;
	public int getCustomer_id() {
		return customer_id;
	}
	
	public String getFirst_name() {
		return first_name;
	}
	
	public String getLast_name() {
		return last_name;
	}

	public String getEmail_id() {
		return email_id;
	}
	
	public Customer(int customer_id, String first_name, String last_name, String email_id) {
		super();
		this.customer_id = customer_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email_id = email_id;
	}

}
