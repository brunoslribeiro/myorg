public class ContriesService {
	
    
    public static List<OptionKeyValue> getOptionsContriesWithTranslate(String language){
        
        List<Contry__c> Contries = getContries();
         
        List<OptionKeyValue> options = Translation.getOptionsWithTranslate(Contries, language, 'Contry');
            
        return options;
     }
    

    public static List<Contry__c> getContries(){
         List<Contry__c> Contries = ContriesRepository.getContries();
         return Contries;
    }
    
}