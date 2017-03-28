package coza.royalbank.util;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Generic {
	
	public static enum Mode {
	    ALPHA, ALPHA_LOWER, ALPHA_UPPER, ALPHANUMERIC, NUMERIC 
	}
	
	public static Date getDate() {
		
		Date curr_date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String stringDate = sdf.format(curr_date);
		
		Date returnDate = null;
		try {
			returnDate = sdf.parse(stringDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return returnDate;
		
	}
	
	public static String secureString() {
		
		SecureRandom random = new SecureRandom();
		return new BigInteger(170, random).toString(32);
		
	}
	
	public static String generateRandomString(int length, Mode mode) throws Exception {

		StringBuffer buffer = new StringBuffer();
		String characters = "";

		switch(mode){
		
		case ALPHA:
			characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			break;
		
		case ALPHA_LOWER:
			characters = "abcdefghijklmnopqrstuvwxyz";
			break;
		
		case ALPHA_UPPER:
			characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			break;
		
		case ALPHANUMERIC:
			characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
			break;
	
		case NUMERIC:
			characters = "1234567890";
		    break;
		}
		
		int charactersLength = characters.length();

		for (int i = 0; i < length; i++) {
			double index = Math.random() * charactersLength;
			buffer.append(characters.charAt((int) index));
		}
		return buffer.toString();
	}	
	
	public static boolean checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean loggedIn  = false;

		HttpSession loggedInSession = request.getSession();

		if(loggedInSession.getAttribute("cust_id") == null) {
			response.sendRedirect("../");
		}
		else {
//			String session_id = null;
//			
//			session_id  = loggedInSession.getId();								
			loggedIn = true;					
		}
		
		return loggedIn;
		
	}
	
	public static int getLoggedInCustID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession loggedInSession = request.getSession();		
		int cust_id	    = Integer.parseInt(loggedInSession.getAttribute("cust_id").toString());		
		return cust_id;
	}
	
	public static String getLoggedInUsersName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession loggedInSession = request.getSession();
		String users_name  = loggedInSession.getAttribute("first_name").toString() + " " + loggedInSession.getAttribute("last_name").toString();
		return users_name;
	}

	public static String getSecurityKey(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession loggedInSession = request.getSession();
		String security_key  = loggedInSession.getAttribute("security_key").toString();
		return security_key;
	}

	public static void userLogOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession loggedInSession = request.getSession(false);
		loggedInSession.invalidate();
		response.sendRedirect("../");
	}
	
//	public static void sendSMS() {
//		// Send SMS
//		SmsSender smsSender = SmsSender.getClickatellSender("username", "password", "apiid"); 
//		// The message that you want to send. 
//		String msg = "A sample SMS."; 
//		// International number to reciever without leading "+" 
//		String reciever = "27826870834"; 		
//		// Number of sender
//		String sender = "27794976087"; smsSender.connect(); 
//		String msgids[] = smsSender.sendTextSms(msg, reciever, sender); 
//		smsSender.disconnect();		
//	
//	}

}
