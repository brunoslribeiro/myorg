public class Opportunity_Repository {
	
    public static Opportunity CreateOpportunity(Opportunity paOpportunity){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            insert paOpportunity;
        }
        catch(DmlException e) {
            WriteDmlException(e);
        	Database.rollback(sp);
    	}
    	
        return paOpportunity;
    }
    
    public static Opportunity UpdateOpportunity(Opportunity paOpportunity){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            update paOpportunity;
        }
        catch(DmlException e) {
            WriteDmlException(e);
        	Database.rollback(sp);
    	}
    	
        return paOpportunity;
    }
    
    public static void DeleteOpportunity(List<Opportunity> paListOpportunity){        
        Savepoint sp = Database.setSavepoint();
        
        try {
            delete paListOpportunity;
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