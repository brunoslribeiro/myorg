public class Opportunity_ProductItens_Repository {
    
  	public static List<OpportunityLineItem> LoadItensOpportunityFromOpportunity(String paOpportunityId){
        List<OpportunityLineItem> ListOpportunityLineItem = new List<OpportunityLineItem>();
        ListOpportunityLineItem = [Select Id,Name,Quantity,OpportunityId From OpportunityLineItem Where OpportunityId=:paOpportunityId Limit 10];
        return ListOpportunityLineItem;
    }
    
    public static OpportunityLineItem LoadItemOpportunity(String paOpportunityItemId){
        OpportunityLineItem vaOpportunityLineItem = [Select Id,Name,OpportunityId,Quantity From OpportunityLineItem Where Id=:paOpportunityItemId Limit 1];
        return vaOpportunityLineItem;
    }
    
    public static OpportunityLineItem CreateOpportunityLineItem(OpportunityLineItem paOpLineItem){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            insert paOpLineItem;
        }
        catch(DmlException e) {
            WriteDmlException(e);
        	Database.rollback(sp);
    	}
    	
        return paOpLineItem;
    }
    
    public static OpportunityLineItem UpdateOpportunityLineItem(OpportunityLineItem paOpLineItem){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            update paOpLineItem;
        }
        catch(DmlException e) {
            WriteDmlException(e);
        	Database.rollback(sp);
    	}
    	
        return paOpLineItem;
    }
    
    public static void DeleteOpportunityLineItem(List<OpportunityLineItem> paListOpportunityLineItem){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            delete paListOpportunityLineItem;
        }
        catch(DmlException e) {
            WriteDmlException(e);
        	Database.rollback(sp);
    	}
        
    }
    
    public static void WriteDmlException(DmlException e){
         for (Integer i = 0; i < e.getNumDml(); i++) {
                System.debug(e.getDmlMessage(i)); 
         }
    }
   
}