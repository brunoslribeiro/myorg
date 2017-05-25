@isTest
public class AddPrimaryContactTest {

    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();                        
        String name,BillingState;
        
        for (Integer i = 0; i < 100; i++) {
            name = 'Test Account'+i;
            if(i<50){
            	BillingState = 'NY';
            }else{
               	BillingState = 'CA';
            }
            
            accounts.add(new Account(
                name=name,
                BillingState = BillingState
            ));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {        
                        
        // Create our Queueable instance        
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        Contact ccct = new Contact(FirstName='Test',LastName='de Queue');         
        AddPrimaryContact addPrimyCcct = new AddPrimaryContact(ccct, 'CA');                   
        System.enqueueJob(addPrimyCcct);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now        
        System.assertEquals(50, [select count() from contact where FirstName = 'Test' and LastName='de Queue']);
    }
    
}