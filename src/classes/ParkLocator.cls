public class ParkLocator {
    public static List<String> country(String country){
        List<String> parks = new List<String>();        
        ParkService.ParksImplPort service = new  ParkService.ParksImplPort();
        parks = service.byCountry(country);                
        return parks;
    }
}