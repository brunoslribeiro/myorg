public with sharing class recaptchaController {
    
    public String IpAddress; 
    
	
 	public recaptchaController() {
        	                 
    } 
    
    
    public String getIpAddress(){
       return UtilIpAddress.getIpAddress();
    }
}