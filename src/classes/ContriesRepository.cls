public class ContriesRepository {
    public static List<Contry__c> getContries(){
       List<Contry__c> Contries = new List<Contry__c>();
       Contries = [Select Id,Name,KeyTranslate__c From Contry__c];
       return Contries;
    }
}