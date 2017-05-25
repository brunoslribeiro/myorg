trigger AccountWithValidCPF on Account (before insert, before update) {
    if(Trigger.isinsert || Trigger.isUpdate){
        for(Account acct : Trigger.new) {
           acct.addError('Houve um problema com o CPF');
    	}
    }
}