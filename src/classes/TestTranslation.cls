@isTest
private class TestTranslation {
 
    static testMethod void TestGetTranslateOfLabelWithValid(){
        
        test.startTest();
        MockCreateLabel();
   	
        String result = Translation.GetTranslateOfValueKeyAndLanguage('brazil','pt_BR');
        
        String valueExpected='Brasil';
      
        System.assertEquals(valueExpected, result);
        
        test.stopTest();
    }
 
    static testMethod void TestGetTranslateOfLabelWithNotValid(){
        
        test.startTest();
        MockCreateLabel();
   	
        String result = Translation.GetTranslateOfValueKeyAndLanguage('brasil','en_US');
        
        String valueExpected='';
      
        System.assertEquals(valueExpected, result);
        
        test.stopTest();
    }
    
     static testMethod void TestGetTranslateOfLabelWithValid3(){
        
        test.startTest();
       
         LBLCOMUNITY__C label = [Select Name From LBLCOMUNITY__C Limit 1];
         
   		System.assert(label!=null);
        
        test.stopTest();
    }
    
    public static void MockCreateLabel(){
        /*
        LBLCOMUNITY__C label = new LBLCOMUNITY__C();
        label.Name = 'Test 1';
        label.Valor__c = 'Brasil';
        label.keyname__c = 'brazil';
        label.language__c = 'pt_BR';
        insert label;*/
        
    }
}