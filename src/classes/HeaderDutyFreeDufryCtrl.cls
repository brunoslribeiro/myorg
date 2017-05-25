public with sharing class HeaderDutyFreeDufryCtrl {
    
    public HeaderDutyFreeDufryCtrl(){
        
    } 
    
    @AuraEnabled
    public static String getTraslanteKeyName(String jsonlabels){
        
        List<label> ListLabel = (List<label>)JSON.deserialize(jsonlabels,List<label>.class);
        
        for(label labelDeserialized:ListLabel){
        	labelDeserialized.Value = Translation.GetTranslateOfValueKeyAndLanguage(labelDeserialized.Key,labelDeserialized.Language);
        }
        
        return JSON.serialize(ListLabel);
    }
    
    @AuraEnabled
    public static String getBrands(){
       
        List<ListOption> Brands =  new List<ListOption>();
        
        for(Integer i=0;i<=10;i++){
            Brands.add(new ListOption(i.format(),'Teste'+i));
        }
        
        return JSON.serialize(Brands);
    }
    
    public class ListOption {
        
        public String key {get;set;}
        public String value {get;set;}
        
        public ListOption(){
            
        }
        
        public ListOption(String paKey, String paValue){
            key = paKey;
            value = paValue;
        }
        
    }
    
    public class label{  
      
        public label(String Key, String Language, String Value) {
            this.Key = Key;
            this.Language = Language;
            this.Value = Value;
        }
        
        public String Key{get;set;}
     
        public String Language{get;set;}
        
        public String Value{get;set;}
    }

}