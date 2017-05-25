public class UtilIpAddress {
    public static String getIpAddress(){
         String ReturnValue='';                
   			
         // True-Client-IP has the value when the request is coming via the caching integration.
                ReturnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
         
                  // X-Salesforce-SIP has the value when no caching integration or via secure URL.
                if (ReturnValue == '' || ReturnValue == null) {
                 ReturnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
                } // get IP address when no caching (sandbox, dev, secure urls)
         
                 if (ReturnValue == '' || ReturnValue == null) {
                 ReturnValue = ApexPages.currentPage().getHeaders().get('X-Forwarded-For');
                } // get IP address from standard header if proxy in use               
        
     	return ReturnValue;
    }
}