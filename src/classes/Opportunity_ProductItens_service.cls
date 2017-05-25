public class Opportunity_ProductItens_service {
    
    public static List<OpportunityLineItem> LoadItensOpportunityFromOpportunity(String OpportunityId){
     return Opportunity_ProductItens_Repository.LoadItensOpportunityFromOpportunity(OpportunityId);
    }
    
    public static OpportunityLineItem LoadItemOpportunity(String OpportunityItemId){
     return Opportunity_ProductItens_Repository.LoadItemOpportunity(OpportunityItemId);
    } 
    
    public static OpportunityLineItem SaveOpportunityLineItem(OpportunityLineItem opLineItem){  
        if(opLineItem.Id != null){
            return Opportunity_ProductItens_Repository.UpdateOpportunityLineItem(opLineItem);
        }else{
            return Opportunity_ProductItens_Repository.CreateOpportunityLineItem(opLineItem);
        }
    }
  
}