public class BrandRepository {

     public static List<Brands__c> getBrandsOfContry(String ContryId){
       List<Brands__c> Brands = new List<Brands__c>();
       Brands = [Select Id,Name,CommunityPage__c From Brands__c Where Contry__c=:ContryId];
       return Brands;
    }
    
     public static Brands__c getBrand(String BrandId){
       List<Brands__c> Brands = new List<Brands__c>();
       Brands = [Select Id,Name,CommunityPage__c From Brands__c Where Id = :BrandId ];
       System.debug(Brands);
       return Brands.get(0);
    }
    
    public static List<Brands__c> getBrands(){
         List<Brands__c> Brands = new List<Brands__c>();
         Brands = [Select Id,Name,CommunityPage__c From Brands__c];
         return Brands;
    }
    
}