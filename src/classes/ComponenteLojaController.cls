public with sharing class ComponenteLojaController {
    
    @AuraEnabled
    public static String getRegioes(String ContryID){
        return JSON.serialize(RegionService.getOptionsRegionForContry(ContryID));
    }
    
     @AuraEnabled
    public static String getStores(String BrandID){
       return JSON.serialize(StoreService.getStoreOfBrand(BrandID));
    }
    
    @AuraEnabled
    public static String getStoresOfBrandAndRegion(String BrandID,String RegionID){
         System.debug('getStoresOfBrandAndRegion');
        System.debug(BrandID);
        System.debug(RegionID);
       return JSON.serialize(StoreService.getStoresOfBrandAndRegion(BrandID,RegionID));
    }
}