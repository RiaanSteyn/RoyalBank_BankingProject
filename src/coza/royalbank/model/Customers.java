package coza.royalbank.model;

//import java.text.SimpleDateFormat;
import java.util.Date;

public class Customers {

	private int cust_id;
	private String cust_title;
	private String cust_first_name;
	private String cust_last_name;
	private String cust_id_number;
	private String cust_username;
	private String cust_password;
	private String cust_residential_address;
	private String cust_residential_province;
	private String cust_residential_postcode;
	private String cust_postal_address;
	private String cust_postal_province;
	private String cust_postal_postcode;
	private String cust_landline;
	private String cust_mobile;
	private String cust_work;
	private String cust_email;
	private String cust_gender;
	private String cust_occupation;
	private String cust_institution;
	private String cust_student_number;
	private String cust_company;
	private String cust_employee_number;
	private double cust_salary;
	private Date cust_reg_date;
	private boolean cust_enabled;
	private boolean cust_verifed;
	private String cust_verification_key;

	public Customers() {
		// this.cust_id = 0;
		this.cust_enabled = true;
		this.cust_verifed = false;
	}

	public Customers(String cust_title, String cust_first_name, String cust_last_name, String cust_id_number, String cust_usename, String cust_password, String cust_residential_address, String cust_residential_province, String cust_residential_postcode, String cust_postal_address,
			String cust_postal_province, String cust_postal_postcode, String cust_landline, String cust_mobile, String cust_work, String cust_email, String cust_gender, String cust_occupation, String cust_institution, String cust_student_number, String cust_company, String cust_employee_number, double cust_salary, String cust_verification_key) {
		super();
		this.cust_title = cust_title;
		this.cust_first_name = cust_first_name;
		this.cust_last_name = cust_last_name;
		this.cust_id_number = cust_id_number;
		this.cust_username = cust_usename;
		this.cust_password = cust_password;
		this.cust_residential_address = cust_residential_address;
		this.cust_residential_province = cust_residential_province;
		this.cust_residential_postcode = cust_residential_postcode;
		this.cust_postal_address = cust_postal_address;
		this.cust_postal_province = cust_postal_province;
		this.cust_postal_postcode = cust_postal_postcode;
		this.cust_landline = cust_landline;
		this.cust_work = cust_work;
		this.cust_mobile = cust_mobile;
		this.cust_email = cust_email;
		this.cust_gender = cust_gender;
		this.cust_occupation = cust_occupation;
		this.cust_institution = cust_institution;
		this.cust_student_number = cust_student_number;
		this.cust_company = cust_company;
		this.cust_employee_number = cust_employee_number;
		this.cust_salary = cust_salary;
		this.cust_verification_key = cust_verification_key;
	}

	public Customers(String cust_title, String cust_first_name, String cust_last_name, String cust_id_number, String cust_usename, String cust_password, String cust_residential_address,
			String cust_residential_province, String cust_residential_postcode, String cust_postal_address, String cust_postal_province, String cust_postal_postcode, String cust_landline, String cust_mobile, String cust_email, Date cust_reg_date, Boolean cust_enabled, Boolean cust_verifed, String cust_verification_key) {
		super();
		this.cust_title = cust_title;
		this.cust_first_name = cust_first_name;
		this.cust_last_name = cust_last_name;
		this.cust_id_number = cust_id_number;
		this.cust_username = cust_usename;
		this.cust_password = cust_password;
		this.cust_residential_address = cust_residential_address;
		this.cust_residential_province = cust_residential_province;
		this.cust_residential_postcode = cust_residential_postcode;
		this.cust_postal_address = cust_postal_address;
		this.cust_postal_province = cust_postal_province;
		this.cust_postal_postcode = cust_postal_postcode;
		this.cust_landline = cust_landline;
		this.cust_mobile = cust_mobile;
		this.cust_email = cust_email;
		this.cust_reg_date = cust_reg_date;
		this.cust_enabled = cust_enabled;
		this.cust_verifed = cust_verifed;
		this.cust_verification_key = cust_verification_key;
	}

	public int getCust_id() {
		return cust_id;
	}

	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_title() {
		return cust_title;
	}

	public void setCust_title(String cust_title) {
		this.cust_title = cust_title;
	}

	public String getCust_first_name() {
		return cust_first_name;
	}

	public void setCust_first_name(String cust_first_name) {
		this.cust_first_name = cust_first_name;
	}

	public String getCust_last_name() {
		return cust_last_name;
	}

	public void setCust_last_name(String cust_last_name) {
		this.cust_last_name = cust_last_name;
	}

	public String getCust_id_number() {
		return cust_id_number;
	}

	public void setCust_id_number(String cust_id_number) {
		this.cust_id_number = cust_id_number;
	}

	public String getCust_username() {
		return cust_username;
	}

	public void setCust_username(String cust_username) {
		this.cust_username = cust_username;
	}

	public String getCust_password() {
		return cust_password;
	}

	public void setCust_password(String cust_password) {
		this.cust_password = cust_password;
	}

	public String getCust_residential_address() {
		return cust_residential_address;
	}

	public void setCust_residential_address(String cust_residential_address) {
		this.cust_residential_address = cust_residential_address;
	}

	public String getCust_residential_province() {
		return cust_residential_province;
	}

	public void setCust_residential_province(String cust_residential_province) {
		this.cust_residential_province = cust_residential_province;
	}

	public String getCust_residential_postcode() {
		return cust_residential_postcode;
	}

	public void setCust_residential_postcode(String cust_residential_postcode) {
		this.cust_residential_postcode = cust_residential_postcode;
	}

	public String getCust_postal_address() {
		return cust_postal_address;
	}

	public void setCust_postal_address(String cust_postal_address) {
		this.cust_postal_address = cust_postal_address;
	}

	public String getCust_postal_province() {
		return cust_postal_province;
	}

	public void setCust_postal_province(String cust_postal_province) {
		this.cust_postal_province = cust_postal_province;
	}

	public String getCust_postal_postcode() {
		return cust_postal_postcode;
	}

	public void setCust_postal_postcode(String cust_postal_postcode) {
		this.cust_postal_postcode = cust_postal_postcode;
	}

	public String getCust_landline() {
		return cust_landline;
	}

	public void setCust_landline(String cust_landline) {
		this.cust_landline = cust_landline;
	}

	public String getCust_mobile() {
		return cust_mobile;
	}

	public void setCust_mobile(String cust_mobile) {
		this.cust_mobile = cust_mobile;
	}

	public String getCust_work() {
		return cust_work;
	}

	public void setCust_work(String cust_work) {
		this.cust_work = cust_work;
	}

	public String getCust_email() {
		return cust_email;
	}

	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}

	public String getCust_gender() {
		return cust_gender;
	}

	public void setCust_gender(String cust_gender) {
		this.cust_gender = cust_gender;
	}

	public String getCust_occupation() {
		return cust_occupation;
	}

	public void setCust_occupation(String cust_occupation) {
		this.cust_occupation = cust_occupation;
	}

	public String getCust_institution() {
		return cust_institution;
	}

	public void setCust_institution(String cust_institution) {
		this.cust_institution = cust_institution;
	}

	public String getCust_student_number() {
		return cust_student_number;
	}

	public void setCust_student_number(String cust_student_number) {
		this.cust_student_number = cust_student_number;
	}

	public String getCust_company() {
		return cust_company;
	}

	public void setCust_company(String cust_company) {
		this.cust_company = cust_company;
	}

	public String getCust_employee_number() {
		return cust_employee_number;
	}

	public void setCust_employee_number(String cust_employee_number) {
		this.cust_employee_number = cust_employee_number;
	}

	public double getCust_salary() {
		return cust_salary;
	}

	public void setCust_salary(double cust_salary) {
		this.cust_salary = cust_salary;
	}

	public Date getCust_reg_date() {
		return cust_reg_date;
	}

	public void setCust_reg_date(Date cust_reg_date) {
		this.cust_reg_date = cust_reg_date;

		// call date function n set it..

	}

	public boolean getCust_enabled() {
		return cust_enabled;
	}

	public void setCust_enabled(boolean cust_enabled) {
		this.cust_enabled = cust_enabled;
	}

	public boolean getCust_verifed() {
		return cust_verifed;
	}

	public void setCust_verifed(boolean cust_verifed) {
		this.cust_verifed = cust_verifed;
	}

	public String getCust_verification_key() {
		return cust_verification_key;
	}

	public void setCust_verification_key(String cust_verification_key) {
		this.cust_verification_key = cust_verification_key;
	}

	@Override
	public String toString() {
		return "Customers [cust_id=" + cust_id + ", cust_title=" + cust_title + ", cust_first_name=" + cust_first_name
				+ ", cust_last_name=" + cust_last_name + ", cust_id_number=" + cust_id_number + ", cust_username="
				+ cust_username + ", cust_password=" + cust_password + ", cust_residential_address="
				+ cust_residential_address + ", cust_residential_province=" + cust_residential_province
				+ ", cust_residential_postcode=" + cust_residential_postcode + ", cust_postal_address="
				+ cust_postal_address + ", cust_postal_province=" + cust_postal_province + ", cust_postal_postcode="
				+ cust_postal_postcode + ", cust_landline=" + cust_landline + ", cust_mobile=" + cust_mobile
				+ ", cust_work=" + cust_work + ", cust_email=" + cust_email + ", cust_gender=" + cust_gender
				+ ", cust_occupation=" + cust_occupation + ", cust_institution=" + cust_institution
				+ ", cust_student_number=" + cust_student_number + ", cust_company=" + cust_company
				+ ", cust_employee_number=" + cust_employee_number + ", cust_salary=" + cust_salary + ", cust_reg_date="
				+ cust_reg_date + ", cust_enabled=" + cust_enabled + ", cust_verifed=" + cust_verifed
				+ ", cust_verification_key=" + cust_verification_key + "]";
	}

}
