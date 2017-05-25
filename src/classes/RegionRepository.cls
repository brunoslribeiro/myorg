public class RegionRepository {
    public static List<Region__c> getRegionForContry(String ContryID){
        System.debug(ContryID);
        List<Region__c> ListRegions = [Select ID,Name From Region__c Where Contry__c=:ContryID];
        return ListRegions;
    }
}