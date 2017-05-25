public with sharing class Opportunity_Ctrl {
    
    //public transient ViewModel ViewModel{get;set;}
    public ViewModel ViewModel{get;set;}
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Construtor da Página
* Manutenção:
************************************/
    public Opportunity_Ctrl(ApexPages.StandardController standardController){
        ViewModel = new ViewModel(standardController);
    }
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Override do Método - Escutar o Save da VisualForce
* Manutenção:
************************************/
    public PageReference save(){
        Try{
            ViewModel.Oportunidade.Name = 'carol';
            return ApexPages.currentPage();
            //ObjetoPai__c objPai = V_Create_Vor_ObjetoPai_Service.InserirObjetoPai(ViewModel.objVor);
            //PageReference nextPage = new PageReference('/'+objPai.Id);
            //return nextPage;
             
        } catch (V_Create_Vor_ObjetoPai_DomainException e) {
            AddMessage(e.getMessage());
            return ApexPages.currentPage();
        } catch (Exception e) {
            AddMessage(e.getMessage());
            return ApexPages.currentPage();
        } 
       
    }        
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Centralizar as mensagens de Tela
* Manutenção:
************************************/
    public void AddMessage(String message){
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,Message));
    }
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Centralizar a entrada e saída de paramêtros da VisualForce
* Manutenção:
************************************/
    public class ViewModel {
        
        public Boolean isUpdate {get;set;}
        public Boolean isCreate {get;set;}
        public Opportunity Oportunidade{get;set;}
        public ApexPages.StandardController controller{get;set;}
        
        public ViewModel(ApexPages.StandardController std){
           controller = std;
           Oportunidade = (Opportunity)controller.getRecord();
        }
          
    }
}