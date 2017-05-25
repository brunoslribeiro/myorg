global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> updateLeads = new List<Lead>();
        List<Lead> leadsblanks = [SELECT Id, LeadSource
            FROM Lead 
            WHERE LeadSource = ''];
        for(Lead l:leadsblanks){
            l.LeadSource = 'Dreamforce';
            updateLeads.add(l);
        }
        update updateLeads;
        
    }
    
}