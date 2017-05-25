public class Opportunity_ProductItens_ctrl {
    
    public ViewModel VM{get;set;}
    public String opportunityId;    
    
    public Opportunity_ProductItens_ctrl(){
        VM = new ViewModel();
    }
    
    public void setOpportunityId (String opportunityId) {
        VM.Products = Opportunity_ProductItens_service.LoadItensOpportunityFromOpportunity(opportunityId);
    }
        
    public String getOpportunityId() {
        return opportunityId;
    } 
    
    public void EditarItemOportunidade(){
       OpportunityLineItem vaOpportunityLine = Opportunity_ProductItens_service.LoadItemOpportunity(VM.IdItemAtual);
       VM.ItemAtual = vaOpportunityLine;
    }
    
    public void SalvarItemOportunidade(){
        OpportunityLineItem vaOpportunityLine = Opportunity_ProductItens_service.SaveOpportunityLineItem(VM.ItemAtual);
    }
            
    public class ViewModel{
        public List<OpportunityLineItem> Products{get;set;}
        public String IdItemAtual{get;set;}
        public OpportunityLineItem ItemAtual{get;set;}
        public Id OpportunityId{get;set;}
        
        public ViewModel(){
            ItemAtual = new OpportunityLineItem();
            Products = new List<OpportunityLineItem>();
        }
    }
    
}