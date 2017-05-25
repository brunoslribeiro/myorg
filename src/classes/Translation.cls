public class Translation {
	
    @AuraEnabled
    public static String GetTranslateOfValueKeyAndLanguage(String paKey, String paLanguage){

      List<LBLCOMUNITY__C> ListOfLabels = LBLCOMUNITY__C.getAll().values();
      
      for(LBLCOMUNITY__C Label:ListOfLabels){
          if(Label.keyname__c == paKey && Label.language__c== paLanguage){
              return Label.Valor__c;
          }
      }
      
      return '';
    }
    
     public static List<OptionKeyValue> getLabelsOfAGPAndLanguage(String Language, String AGP){
	  
      List<OptionKeyValue> options = new List<OptionKeyValue>();
      for(LBLCOMUNITY__C Label:[Select keyname__c,language__c,Valor__c From LBLCOMUNITY__C Where language__c=:Language and AGL__c=:AGP]){
          options.add(new OptionKeyValue(Label.keyname__c,Label.Valor__c));
      }
      
      return options;
    }
    
    @AuraEnabled
    public static List<OptionKeyValue> getOptionsWithTranslate(List<sObject> ListObject, String Language, String AGP){
        
        System.debug(Language);
        System.debug(AGP);
        List<LBLCOMUNITY__C> LBL = [Select Name,keyname__c,language__c,Valor__c From LBLCOMUNITY__C Where language__c=:Language and AGL__c=:AGP];
        List<OptionKeyValue> options = new List<OptionKeyValue>();
        
         for(sObject o:ListObject){
            for(LBLCOMUNITY__C Label:LBL){
               if(Label.keyname__c == (String)o.get('Name') && Label.language__c== Language){
                  options.add(new OptionKeyValue((String)o.get('Id'), Label.Valor__c));
              	}
            }
        }
        
        return options;
    }
   
    
}