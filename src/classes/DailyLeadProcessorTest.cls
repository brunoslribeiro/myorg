@isTest
private class DailyLeadProcessorTest {
    
     // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    // s | M | H | D | MONTH | YEAR
    public static String CRON_EXP = '0 02 18 16 1 ?';
    
    static List<Id> setup() {
        List<Lead> leads = new List<Lead>();        
        // insert 200 leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Lead '+i, 
                Company='Triscal'));
        }
        insert leads;       
        
         // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leads);
        List<Id> leadsIds = new List<Id>(leadMap.keySet());
        
        return leadsIds;
    }

    static testmethod void test() {        
                
        Test.startTest();
        //Crio os leads
        List<Id> leadsIds = setup();
        //Agendo a Schedule
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor());         
        //Verifico se ainda não foi rodada
        List<Task> lt = [SELECT Id FROM Task WHERE WhatId IN :leadsIds];        
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce' and Company='Triscal']);
        
        
    }
    
}