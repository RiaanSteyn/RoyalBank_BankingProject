package coza.royalbank.model;

public class Admin {
	
	private int admin_id;
	private String admin_first_name;
	private String admin_last_name;
	private String admin_username;
	private String admin_password;
	private String admin_email;
	
	public Admin(){
		this.admin_id = 0; 
	}
	
	public Admin(String admin_first_name, String admin_last_name, String admin_username, String admin_password, String admin_email){
		this.admin_first_name = admin_first_name;
		this.admin_last_name  = admin_last_name;
		this.admin_username   = admin_username;
		this.admin_password   = admin_password;
		this.admin_email      = admin_email;
	}

	public int getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_first_name() {
		return admin_first_name;
	}

	public void setAdmin_first_name(String admin_first_name) {
		this.admin_first_name = admin_first_name;
	}

	public String getAdmin_last_name() {
		return admin_last_name;
	}

	public void setAdmin_last_name(String admin_last_name) {
		this.admin_last_name = admin_last_name;
	}

	public String getAdmin_username() {
		return admin_username;
	}

	public void setAdmin_username(String admin_username) {
		this.admin_username = admin_username;
	}

	public String getAdmin_password() {
		return admin_password;
	}

	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", admin_first_name="
				+ admin_first_name + ", admin_last_name=" + admin_last_name
				+ ", admin_username=" + admin_username + ", admin_password="
				+ admin_password + ", admin_email=" + admin_email + "]";
	}	
	
}
