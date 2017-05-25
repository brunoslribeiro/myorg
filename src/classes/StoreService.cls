public class StoreService {
    public static List<OptionKeyValue> getOptionsStoreOfBrand(String BrandID){
       List<Store__c> ListStore = StoreRepository.getStoresOfBrand(BrandID);
       List<OptionKeyValue> options = new List<OptionKeyValue>();
       for(Store__c Store:ListStore){
           options.add(new OptionKeyValue(Store.Id, Store.Name));
       } 
	   return options;
    }
    
    public static List<Store__c> getStoreOfBrand(String BrandID){
       return StoreRepository.getStoresOfBrand(BrandID);
    }
    
    public static List<Store__c> getStoresOfBrandAndRegion(String BrandID,String RegionID){
        return StoreRepository.getStoresOfBrandAndRegion(BrandID,RegionID);
    }
}