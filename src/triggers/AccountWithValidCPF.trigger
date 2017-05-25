trigger AccountWithValidCPF on Account (before insert, before update) {
    if(Trigger.isinsert || Trigger.isUpdate){
    	List<account> Accounts = Trigger.New;
        for(Account acct : Accounts) {
           acct.addError('Houve um problema com o CPF');
    	}
    }
}