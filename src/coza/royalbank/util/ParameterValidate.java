package coza.royalbank.util;

public class ParameterValidate {

	public static boolean isValid(String ... parameters){
		
		for(String s : parameters){
			if(s == null || s.trim().equals("")){
				return false;
			}
			
		}
		
		return true;
	}
	
	public static boolean isSelectValid(int ... parameters){
		
		for(int s : parameters){
			if(s == 0){
				return false;
			}
			
		}
		
		return true;
	}
	
}
