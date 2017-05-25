public class AddPrimaryContact implements Queueable {
    
    private Contact contato;
    private String BillingState;
    
    public AddPrimaryContact(Contact c, String BillingState) {
        this.contato = c;
        this.BillingState = BillingState;
    }

    public void execute(QueueableContext context) {
        
        List<Account> accounts = [Select Id,BillingState From Account Where BillingState=:BillingState];           
        List<Contact> contacts = new List<Contact>();
                        
        for (Account account : accounts) {          
          Contact clonedc = contato.clone(false, false, false, false);
          clonedc.AccountId = account.Id;
          contacts.add(clonedc);
        }
        insert contacts;
    }
    
}