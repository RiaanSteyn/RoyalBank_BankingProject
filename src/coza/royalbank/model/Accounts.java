package coza.royalbank.model;

public class Accounts {

	int acc_id;
	String acc_name;
	int acc_min_age;
	int acc_max_age;
	double acc_min_salary;
	double acc_max_salary;
	long acc_new_number;
	double acc_monthly_fee;

	public Accounts() {
		this.acc_id = 0;
	}

	public Accounts(String acc_name, int acc_min_age, int acc_max_age, double acc_min_salary, double acc_max_salary, long acc_new_number, double acc_monthly_fee) {
		this.acc_name = acc_name;
		this.acc_min_age = acc_min_age;
		this.acc_max_age = acc_max_age;
		this.acc_min_salary = acc_min_salary;
		this.acc_max_salary = acc_max_salary;
		this.acc_new_number = acc_new_number;
		this.acc_monthly_fee = acc_new_number;
	}

	public int getAcc_id() {
		return acc_id;
	}

	public void setAcc_id(int acc_id) {
		this.acc_id = acc_id;
	}

	public String getAcc_name() {
		return acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public int getAcc_min_age() {
		return acc_min_age;
	}

	public void setAcc_min_age(int acc_min_age) {
		this.acc_min_age = acc_min_age;
	}

	public int getAcc_max_age() {
		return acc_max_age;
	}

	public void setAcc_max_age(int acc_max_age) {
		this.acc_max_age = acc_max_age;
	}

	public double getAcc_min_salary() {
		return acc_min_salary;
	}

	public void setAcc_min_salary(double acc_min_salary) {
		this.acc_min_salary = acc_min_salary;
	}

	public double getAcc_max_salary() {
		return acc_max_salary;
	}

	public void setAcc_max_salary(double acc_max_salary) {
		this.acc_max_salary = acc_max_salary;
	}

	public long getAcc_new_number() {
		return acc_new_number;
	}

	public void setAcc_new_number(long acc_new_number) {
		this.acc_new_number = acc_new_number;
	}

	public double getAcc_monthly_fee() {
		return acc_monthly_fee;
	}

	public void setAcc_monthly_fee(double acc_monthly_fee) {
		this.acc_monthly_fee = acc_monthly_fee;
	}

	@Override
	public String toString() {
		return "Accounts [acc_id=" + acc_id + ", acc_name=" + acc_name + ", acc_min_age=" + acc_min_age
				+ ", acc_max_age=" + acc_max_age + ", acc_min_salary=" + acc_min_salary + ", acc_max_salary="
				+ acc_max_salary + ", acc_new_number=" + acc_new_number + ", acc_monthly_fee=" + acc_monthly_fee + "]";
	}

}
