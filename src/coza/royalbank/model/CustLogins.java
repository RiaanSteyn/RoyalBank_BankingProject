package coza.royalbank.model;

import java.util.Date;

public class CustLogins {

	private int cust_login_id;
	private Customers customer;
	private Date cust_login_time;
	private String cust_login_ip;
	private String cust_login_user_agent;
	private String cust_login_security_key;

	public CustLogins() {
		this.cust_login_id = 0;
	}

	public CustLogins(Customers customer, Date cust_login_time, String cust_login_ip, String cust_login_user_agent, String cust_login_security_key) {
		super();
		this.customer = customer;
		this.cust_login_time = cust_login_time;
		this.cust_login_ip = cust_login_ip;
		this.cust_login_user_agent = cust_login_user_agent;
		this.cust_login_security_key = cust_login_security_key;
	}

	public int getCust_login_id() {
		return cust_login_id;
	}

	public void setCust_login_id(int cust_login_id) {
		this.cust_login_id = cust_login_id;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public Date getCust_login_time() {
		return cust_login_time;
	}

	public void setCust_login_time(Date cust_login_time) {
		this.cust_login_time = cust_login_time;
	}

	public String getCust_login_ip() {
		return cust_login_ip;
	}

	public void setCust_login_ip(String cust_login_ip) {
		this.cust_login_ip = cust_login_ip;
	}

	public String getCust_login_user_agent() {
		return cust_login_user_agent;
	}

	public void setCust_login_user_agent(String cust_login_user_agent) {
		this.cust_login_user_agent = cust_login_user_agent;
	}

	public String getCust_login_security_key() {
		return cust_login_security_key;
	}

	public void setCust_login_security_key(String cust_login_security_key) {
		this.cust_login_security_key = cust_login_security_key;
	}

	@Override
	public String toString() {
		return "CustLogins [cust_login_id=" + cust_login_id + ", customer=" + customer + ", cust_login_time="
				+ cust_login_time + ", cust_login_ip=" + cust_login_ip + ", cust_login_user_agent="
				+ cust_login_user_agent + ", cust_login_security_key=" + cust_login_security_key + "]";
	}

}
