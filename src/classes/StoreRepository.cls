public class StoreRepository {
    public static List<Store__c> getStoresOfBrand(String BrandID){
        List<Store__c> lojas = [Select ID,Name,ImgLogo__c From Store__c Where Brands__c=:BrandId];
        return lojas;
    }
    
     public static List<Store__c> getStoresOfBrandAndRegion(String BrandID,String RegionID){
        System.debug('BrandId'+BrandID+' RegionID'+RegionID);
        List<Store__c> lojas = [Select ID,Name,ImgLogo__c From Store__c Where Brands__c=:BrandId and Region__c=:RegionID];
        return lojas;
    }
}