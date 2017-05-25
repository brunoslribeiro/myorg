public class RegionService {
    public static List<OptionKeyValue> getOptionsRegionForContry(String ContryID){
        List<OptionKeyValue> options = new List<OptionKeyValue>();
        List<Region__c> Listregions = RegionRepository.getRegionForContry(ContryID); 
        for(Region__c region:Listregions){
            options.add(new OptionKeyValue(region.Id,region.Name));
        }
        return options;
    }
}