package coza.royalbank.model;

import java.util.Date;

public class CustToAcc {

	private int cust_acc_id;
	private Customers customer;
	private Accounts account;
	private long cust_acc_number;
	private double cust_acc_daily_limit;
	private double cust_acc_monthly_limit;
	private String cust_acc_alerts;
	private double cust_acc_current_balance;
	private double cust_acc_available_balance;
	private boolean cust_acc_approved;
	private Admin adminApproved_by;
	private Date cust_acc_approved_date;
	private boolean cust_acc_declined;
	private Admin adminDeclined_by;
	private Date cust_acc_declined_date;
	private String cust_acc_declined_reason;
	private boolean cust_acc_closed;
	private Admin adminClosed_by;
	private Date cust_acc_closed_date;

	public CustToAcc() {
		this.cust_acc_id = 0;
		this.cust_acc_approved = false;
		this.cust_acc_declined = false;
		this.cust_acc_closed = false;
	}

	public CustToAcc(Customers customer, Accounts account, Date date, long cust_acc_number, double cust_acc_daily_limit, double cust_acc_monthly_limit, String cust_acc_alerts, double cust_acc_current_balance, double cust_acc_available_balance) {
		super();
		this.customer = customer;
		this.account = account;
		this.cust_acc_approved_date = date;
		this.cust_acc_number = cust_acc_number;
		this.cust_acc_daily_limit = cust_acc_daily_limit;
		this.cust_acc_monthly_limit = cust_acc_monthly_limit;
		this.cust_acc_alerts = cust_acc_alerts;
		this.cust_acc_current_balance = cust_acc_current_balance;
		this.cust_acc_available_balance = cust_acc_available_balance;
	}

	public CustToAcc(Customers customer, Accounts account, long cust_acc_number, double cust_acc_daily_limit, double cust_acc_monthly_limit, String cust_acc_alerts, double cust_acc_current_balance,
			double cust_acc_available_balance, boolean cust_acc_approved, Admin adminApproved_by, Date cust_acc_approved_date, boolean cust_acc_declined, Admin adminDeclined_by, Date cust_acc_declined_date, String cust_acc_declined_reason, boolean cust_acc_closed, Admin adminClosed_by, Date cust_acc_closed_date) {
		super();
		this.customer = customer;
		this.account = account;
		this.cust_acc_number = cust_acc_number;
		this.cust_acc_daily_limit = cust_acc_daily_limit;
		this.cust_acc_monthly_limit = cust_acc_monthly_limit;
		this.cust_acc_alerts = cust_acc_alerts;
		this.cust_acc_current_balance = cust_acc_current_balance;
		this.cust_acc_available_balance = cust_acc_available_balance;
		this.cust_acc_approved = cust_acc_approved;
		this.adminApproved_by = adminApproved_by;
		this.cust_acc_approved_date = cust_acc_approved_date;
		this.cust_acc_declined = cust_acc_declined;
		this.adminDeclined_by = adminDeclined_by;
		this.cust_acc_declined_date = cust_acc_declined_date;
		this.cust_acc_declined_reason = cust_acc_declined_reason;
		this.cust_acc_closed = cust_acc_closed;
		this.adminClosed_by = adminClosed_by;
		this.cust_acc_closed_date = cust_acc_closed_date;
	}

	public int getCust_acc_id() {
		return cust_acc_id;
	}

	public void setCust_acc_id(int cust_acc_id) {
		this.cust_acc_id = cust_acc_id;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public Accounts getAccount() {
		return account;
	}

	public void setAccount(Accounts account) {
		this.account = account;
	}

	public long getCust_acc_number() {
		return cust_acc_number;
	}

	public void setCust_acc_number(long cust_acc_number) {
		this.cust_acc_number = cust_acc_number;
	}

	public double getCust_acc_daily_limit() {
		return cust_acc_daily_limit;
	}

	public void setCust_acc_daily_limit(double cust_acc_daily_limit) {
		this.cust_acc_daily_limit = cust_acc_daily_limit;
	}

	public double getCust_acc_monthly_limit() {
		return cust_acc_monthly_limit;
	}

	public void setCust_acc_monthly_limit(double cust_acc_monthly_limit) {
		this.cust_acc_monthly_limit = cust_acc_monthly_limit;
	}

	public String getCust_acc_alerts() {
		return cust_acc_alerts;
	}

	public void setCust_acc_alerts(String cust_acc_alerts) {
		this.cust_acc_alerts = cust_acc_alerts;
	}

	public double getCust_acc_current_balance() {
		return cust_acc_current_balance;
	}

	public void setCust_acc_current_balance(double cust_acc_current_balance) {
		this.cust_acc_current_balance = cust_acc_current_balance;
	}

	public double getCust_acc_available_balance() {
		return cust_acc_available_balance;
	}

	public void setCust_acc_available_balance(double cust_acc_available_balance) {
		this.cust_acc_available_balance = cust_acc_available_balance;
	}

	public boolean getCust_acc_approved() {
		return cust_acc_approved;
	}

	public void setCust_acc_approved(boolean cust_acc_approved) {
		this.cust_acc_approved = cust_acc_approved;
	}

	public Admin getAdminApproved_by() {
		return adminApproved_by;
	}

	public void setAdminApproved_by(Admin adminApproved_by) {
		this.adminApproved_by = adminApproved_by;
	}

	public Date getCust_acc_approved_date() {
		return cust_acc_approved_date;
	}

	public void setCust_acc_approved_date(Date cust_acc_approved_date) {
		this.cust_acc_approved_date = cust_acc_approved_date;
	}

	public boolean getCust_acc_declined() {
		return cust_acc_declined;
	}

	public void setCust_acc_declined(boolean cust_acc_declined) {
		this.cust_acc_declined = cust_acc_declined;
	}

	public Admin getAdminDeclined_by() {
		return adminDeclined_by;
	}

	public void setAdminDeclined_by(Admin adminDeclined_by) {
		this.adminDeclined_by = adminDeclined_by;
	}

	public Date getCust_acc_declined_date() {
		return cust_acc_declined_date;
	}

	public void setCust_acc_declined_date(Date cust_acc_declined_date) {
		this.cust_acc_declined_date = cust_acc_declined_date;
	}

	public String getCust_acc_declined_reason() {
		return cust_acc_declined_reason;
	}

	public void setCust_acc_declined_reason(String cust_acc_declined_reason) {
		this.cust_acc_declined_reason = cust_acc_declined_reason;
	}

	public boolean getCust_acc_closed() {
		return cust_acc_closed;
	}

	public void setCust_acc_closed(boolean cust_acc_closed) {
		this.cust_acc_closed = cust_acc_closed;
	}

	public Admin getAdminClosed_by() {
		return adminClosed_by;
	}

	public void setAdminClosed_by(Admin adminClosed_by) {
		this.adminClosed_by = adminClosed_by;
	}

	public Date getCust_acc_closed_date() {
		return cust_acc_closed_date;
	}

	public void setCust_acc_closed_date(Date cust_acc_closed_date) {
		this.cust_acc_closed_date = cust_acc_closed_date;
	}

	@Override
	public String toString() {
		return "CustToAcc [cust_acc_id=" + cust_acc_id + ", customer=" + customer + ", account=" + account
				+ ", cust_acc_number=" + cust_acc_number + ", cust_acc_daily_limit=" + cust_acc_daily_limit
				+ ", cust_acc_monthly_limit=" + cust_acc_monthly_limit + ", cust_acc_alerts=" + cust_acc_alerts
				+ ", cust_acc_current_balance=" + cust_acc_current_balance + ", cust_acc_available_balance="
				+ cust_acc_available_balance + ", cust_acc_approved=" + cust_acc_approved + ", adminApproved_by="
				+ adminApproved_by + ", cust_acc_approved_date=" + cust_acc_approved_date + ", cust_acc_declined="
				+ cust_acc_declined + ", adminDeclined_by=" + adminDeclined_by + ", cust_acc_declined_date="
				+ cust_acc_declined_date + ", cust_acc_declined_reason=" + cust_acc_declined_reason
				+ ", cust_acc_closed=" + cust_acc_closed + ", adminClosed_by=" + adminClosed_by
				+ ", cust_acc_closed_date=" + cust_acc_closed_date + "]";
	}

}
