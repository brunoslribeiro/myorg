public with sharing class HeaderController {
	
    public HeaderController(){
        
    } 
    
    @AuraEnabled
    public static String getContries(String language){
        return JSON.serialize(ContriesService.getOptionsContriesWithTranslate(language));
    }
    
    @AuraEnabled
    public static String getBrands(String language){
        return JSON.serialize(BrandService.getOptionsBrandWithTranslate(language));
    }
    
    @AuraEnabled
    public static String getBrandsOfContry(String ContryId, String language){
        return JSON.serialize(BrandService.getBrandsOfContryWithTranslate(ContryId,language));
    }
    
    @AuraEnabled
    public static String getBrandCommunity(String BrandId){
        return JSON.serialize(BrandService.getBrandCommunity(BrandId));
    }
    
    @AuraEnabled
    public static String getLabelsView(String language,String AGP){
        return JSON.serialize(LabelService.getLabelsofView(language,AGP));
    }
   
    
}