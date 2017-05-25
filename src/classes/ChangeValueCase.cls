// The Controller 

public with sharing class ChangeValueCase 
{
	private ApexPages.StandardController controller {get; set;}	    
    public Case c {get;set;}    
    public Case myCase{get;set;}
    	
    public ChangeValueCase(ApexPages.StandardController controller) {                        
        Id myCaseId = (Id) System.currentPageReference().getParameters().get('id');   
        myCase = [SELECT Id, Subject FROM Case WHERE IsDeleted = false AND Id = :myCaseId LIMIT 1 ALL ROWS];		        
    } 
          
    public String getCaseSubject() {
        return myCase.Subject;
    }   
}