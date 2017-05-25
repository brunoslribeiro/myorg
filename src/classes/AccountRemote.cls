global with sharing class AccountRemote {

    public String accountName { get; set; }
    public static Account account { get; set; }
    public static List<Account> accounts { get; set; }
    public AccountRemote() { } // empty constructor
    
    @RemoteAction
    global static Account getAccount(String accountName) {
        account = [SELECT Id, Name, Phone, Type, NumberOfEmployees FROM Account WHERE Name = :accountName limit 20];
        return account;
    }
    
    @RemoteAction
    global static List<Account> getAccounts() {
        accounts = [SELECT Id, Name, Phone, Type, NumberOfEmployees FROM Account limit 20];
        return accounts;
    }
    
    @RemoteAction
    global static List<Account> getAccountSearch(String name) {
        accounts =  Database.query('SELECT Id, Name, Phone, Type, NumberOfEmployees FROM Account WHERE Name LIKE \'%' + name + '%\' limit 20');
        return accounts;
    }
}