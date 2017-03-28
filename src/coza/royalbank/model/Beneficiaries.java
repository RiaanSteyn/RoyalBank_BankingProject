package coza.royalbank.model;

import java.util.Date;

public class Beneficiaries {

	private int ben_id;
	private Customers customer;
	private Accounts account;
	private String ben_payment_name;
	private long ben_acc_number;
	private String ben_to_reference;
	private String ben_from_reference;
	private String ben_pop_type;
	private String ben_email;
	private String ben_mobile;
	private boolean ben_deleted;
	private Date ben_deleted_date;

	public Beneficiaries() {
		this.ben_id = 0;
		this.ben_deleted = false;
	}

	public Beneficiaries(Customers customer, Accounts account, String ben_payment_name, long ben_acc_number, String ben_to_reference, String ben_from_reference, String ben_pop_type, String ben_mobile, String ben_email) {
		super();
		this.customer = customer;
		this.account = account;
		this.ben_payment_name = ben_payment_name;
		this.ben_acc_number = ben_acc_number;
		this.ben_to_reference = ben_to_reference;
		this.ben_from_reference = ben_from_reference;
		this.ben_pop_type = ben_pop_type;
		this.ben_mobile = ben_mobile;
		this.ben_email = ben_email;
	}

	public int getBen_id() {
		return ben_id;
	}

	public void setBen_id(int ben_id) {
		this.ben_id = ben_id;
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

	public String getBen_payment_name() {
		return ben_payment_name;
	}

	public void setBen_payment_name(String ben_payment_name) {
		this.ben_payment_name = ben_payment_name;
	}

	public long getBen_acc_number() {
		return ben_acc_number;
	}

	public void setBen_acc_number(long ben_acc_number) {
		this.ben_acc_number = ben_acc_number;
	}

	public String getBen_to_reference() {
		return ben_to_reference;
	}

	public void setBen_to_reference(String ben_to_reference) {
		this.ben_to_reference = ben_to_reference;
	}

	public String getBen_from_reference() {
		return ben_from_reference;
	}

	public void setBen_from_reference(String ben_from_reference) {
		this.ben_from_reference = ben_from_reference;
	}

	public String getBen_pop_type() {
		return ben_pop_type;
	}

	public void setBen_pop_type(String ben_pop_type) {
		this.ben_pop_type = ben_pop_type;
	}

	public String getBen_email() {
		return ben_email;
	}

	public void setBen_email(String ben_email) {
		this.ben_email = ben_email;
	}

	public String getBen_mobile() {
		return ben_mobile;
	}

	public void setBen_mobile(String ben_mobile) {
		this.ben_mobile = ben_mobile;
	}

	public boolean getBen_deleted() {
		return ben_deleted;
	}

	public void setBen_deleted(boolean ben_deleted) {
		this.ben_deleted = ben_deleted;
	}

	public Date getBen_deleted_date() {
		return ben_deleted_date;
	}

	public void setBen_deleted_date(Date ben_deleted_date) {
		this.ben_deleted_date = ben_deleted_date;
	}

	@Override
	public String toString() {
		return "Beneficiaries [ben_id=" + ben_id + ", customer=" + customer + ", account=" + account
				+ ", ben_payment_name=" + ben_payment_name + ", ben_acc_number=" + ben_acc_number
				+ ", ben_to_reference=" + ben_to_reference + ", ben_from_reference=" + ben_from_reference
				+ ", ben_pop_type=" + ben_pop_type + ", ben_email=" + ben_email + ", ben_mobile=" + ben_mobile
				+ ", ben_deleted=" + ben_deleted + ", ben_deleted_date=" + ben_deleted_date + "]";
	}

}
