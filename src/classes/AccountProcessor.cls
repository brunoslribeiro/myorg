public class AccountProcessor {
    @future
    public static void countContacts(List<Id> ids){
                                 
        for(Id accountid:ids){
        	Account conta = [Select Number_of_Contacts__c,(Select Id From Contacts) from Account Where id = :accountid];    
            conta.Number_of_Contacts__c = conta.contacts.size();
            update conta;
        }
        
    }
}