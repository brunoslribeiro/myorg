public class AnimalLocator {
	
    public static String getAnimalNameById(Integer id){        
        String name;
        String url = 'https://th-apex-http-callout.herokuapp.com/animals/'+id;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = http.send(request);       
        if (response.getStatusCode() == 200) {
            AnimalJson ab = (AnimalJson)JSON.deserialize(response.getBody(), AnimalJson.class);                                    
            Animal animal = ab.getanimal();
            name = animal.getName();            
        }
        return name;        
    }
    
}