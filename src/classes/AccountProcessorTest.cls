@isTest
private class AccountProcessorTest {
     @isTest
    static void testcountContacts(){
                        
        List<Id> ids = getIds();
        test.startTest();
        AccountProcessor.countContacts(ids);        
        test.stopTest();
        Account conta = [Select Number_of_Contacts__c From Account Where Id = :ids[0]];
        system.equals(conta.Number_of_Contacts__c, 1);
        
    }
    
    static List<Id> getIds(){
		List<Id> ids = new List<Id>();
        
        Account conta = new Account();
        conta.Name = 'Teste da Conta';        
        insert conta;
        
        Contact Contato = new Contact();
        Contato.FirstName = 'Teste';
        Contato.LastName = 'do Contato';
        Contato.AccountId = conta.Id;
        insert Contato;                
        
        ids.add(conta.Id);
        
        return ids;
    }
}