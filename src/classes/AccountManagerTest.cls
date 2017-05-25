@IsTest
private class AccountManagerTest{

    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://brunoribeiro-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assert(thisAccount.Contacts != null);
        System.assertEquals('Test record 1', thisAccount.Name);
        for(Contact contact : thisAccount.Contacts){
          	System.assertEquals('Test 1', contact.FirstName);
        	System.assertEquals('record 1', contact.LastName);    
        }                
    }
        
    static Id createTestRecord() {
        // Create test record
                 
        Account accountnew = new Account(
            	Name='Test record 1'            	
        );                
        
        insert accountnew;        
        
        Contact contact = new Contact(
        	FirstName='Test 1',
            LastName='record 1',
            AccountId = accountnew.Id
        );      
        
        return accountnew.Id;
    }     
}