public with sharing class V_Create_Vor_ctr {
    
    public V_Create_Vor_ctr_ViewModel ViewModel{get;set;}
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Construtor da Página
* Manutenção:
************************************/
    public V_Create_Vor_ctr(ApexPages.StandardController standardController){
        ViewModel = new V_Create_Vor_ctr_ViewModel(standardController);
    }
    
/*********************************** 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Override do Método - Escutar o Save da VisualForce
* Manutenção:
************************************/
    public PageReference save(){
        Try{
            ViewModel.objVor=(ObjetoPai__c)ViewModel.controller.getRecord();
            ObjetoPai__c objPai = V_Create_Vor_ObjetoPai_Service.InserirObjetoPai(ViewModel.objVor);
            PageReference nextPage = new PageReference('/'+objPai.Id);
            return nextPage;
             
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
    public class V_Create_Vor_ctr_ViewModel {
        
        public Boolean isUpdate {get;set;}
        public Boolean isCreate {get;set;}
        public ObjetoPai__c objVor{get;set;}
        public ApexPages.StandardController controller{get;set;}
        
        public V_Create_Vor_ctr_ViewModel(ApexPages.StandardController std){
            controller = std;
        }
         
    }
}