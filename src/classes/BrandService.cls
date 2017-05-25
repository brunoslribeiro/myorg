public class BrandService {
	
     public static List<OptionKeyValue> getOptionsBrandWithTranslate(String language){
        
        List<Brands__c> Brands = BrandRepository.getBrands();
        List<OptionKeyValue> options = Translation.getOptionsWithTranslate(Brands, language, 'Brand');
            
        return options;
     }
 
    
     public static String getBrandCommunity(String BrandId){
         
        Brands__c Brand = BrandRepository.getBrand(BrandId);
           
        return  Brand.CommunityPage__c;
     }
    
    
    public static List<OptionKeyValue> getBrandsOfContryWithTranslate(String ContryId,String language){
        List<Brands__c> Brands = BrandRepository.getBrandsOfContry(ContryId);
        List<OptionKeyValue> options = Translation.getOptionsWithTranslate(Brands, language, 'Brand');
        return options;
    }
    
    
}