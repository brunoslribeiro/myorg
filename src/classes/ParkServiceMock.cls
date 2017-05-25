@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        parkService.byCountryResponse response_x = new parkService.byCountryResponse();        
        List<String> parks = new List<String>();
        parks.add('Hamburg Wadden Sea National Park');
        parks.add('Hainich National Park');
        parks.add('Bavarian Forest National Park');
        response_x.return_x = parks;
        // end
        response.put('response_x', response_x); 
   }
}