package coza.royalbank.model;

import java.util.Date;

public class Transactions {

	private int trans_id;
	private Customers customer;
	private CustToAcc cust_to_acc;
	private String trans_payee_name;
	private Date trans_date;
	private String trans_description;
	private boolean trans_debit;
	private boolean trans_credit;
	private double trans_amount;
	private double trans_service_fee;
	private double trans_balance;

	public Transactions() {
		trans_id = 0;
	}

	public Transactions(Customers customer, CustToAcc cust_to_acc, String trans_payee_name, Date trans_date, String trans_description, boolean trans_debit, boolean trans_credit, double trans_amount, double trans_service_fee, double trans_balance) {
		super();
		this.customer = customer;
		this.cust_to_acc = cust_to_acc;
		this.trans_payee_name = trans_payee_name;
		this.trans_date = trans_date;
		this.trans_description = trans_description;
		this.trans_debit = trans_debit;
		this.trans_credit = trans_credit;
		this.trans_amount = trans_amount;
		this.trans_service_fee = trans_service_fee;
		this.trans_balance = trans_balance;
	}

	public int getTrans_id() {
		return trans_id;
	}

	public void setTrans_id(int trans_id) {
		this.trans_id = trans_id;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public CustToAcc getCust_to_acc() {
		return cust_to_acc;
	}

	public void setCust_to_acc(CustToAcc cust_to_acc) {
		this.cust_to_acc = cust_to_acc;
	}

	public String getTrans_payee_name() {
		return trans_payee_name;
	}

	public void setTrans_payee_name(String trans_payee_name) {
		this.trans_payee_name = trans_payee_name;
	}

	public Date getTrans_date() {
		return trans_date;
	}

	public void setTrans_date(Date trans_date) {
		this.trans_date = trans_date;
	}

	public String getTrans_description() {
		return trans_description;
	}

	public void setTrans_description(String trans_description) {
		this.trans_description = trans_description;
	}

	public boolean getTrans_debit() {
		return trans_debit;
	}

	public void setTrans_debit(boolean trans_debit) {
		this.trans_debit = trans_debit;
	}

	public boolean getTrans_credit() {
		return trans_credit;
	}

	public void setTrans_credit(boolean trans_credit) {
		this.trans_credit = trans_credit;
	}

	public double getTrans_amount() {
		return trans_amount;
	}

	public void setTrans_amount(double trans_amount) {
		this.trans_amount = trans_amount;
	}

	public double getTrans_service_fee() {
		return trans_service_fee;
	}

	public void setTrans_service_fee(double trans_service_fee) {
		this.trans_service_fee = trans_service_fee;
	}

	public double getTrans_balance() {
		return trans_balance;
	}

	public void setTrans_balance(double trans_balance) {
		this.trans_balance = trans_balance;
	}

	@Override
	public String toString() {
		return "Transactions [trans_id=" + trans_id + ", customer=" + customer + ", cust_to_acc=" + cust_to_acc
				+ ", trans_payee_name=" + trans_payee_name + ", trans_date=" + trans_date + ", trans_description="
				+ trans_description + ", trans_debit=" + trans_debit + ", trans_credit=" + trans_credit
				+ ", trans_amount=" + trans_amount + ", trans_service_fee=" + trans_service_fee + ", trans_balance="
				+ trans_balance + "]";
	}

}
