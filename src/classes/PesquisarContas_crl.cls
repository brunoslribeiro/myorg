public with sharing class PesquisarContas_crl {
	
    public PesquisarContasVm pesquisarContasVm{get;set;}
    
    public PesquisarContas_crl(ApexPages.StandardController stdCtrl){
       	pesquisarContasVm = new PesquisarContasVm();
        pesquisarContasVm.Contas = new List<Account>();
    }
    
    public Account[] getContas() {
        
      	//Executo um count antes
        String countQuery = 'Select count() From Account Where Name LIKE \''+pesquisarContasVm.strNome+'%\'';
        pesquisarContasVm.total_size = Database.countQuery(countQuery);
       
        //Faço a pesquisa paginada
        String QuerySearch = 'Select Id,Name From Account Where Name  LIKE \''+pesquisarContasVm.strNome+'%\' order by Name limit '+pesquisarContasVm.list_size +' offset '+pesquisarContasVm.counter;
        pesquisarContasVm.Contas = Database.query(QuerySearch);
        
        if(pesquisarContasVm.Contas.Size()>0){
            pesquisarContasVm.blnBlockSearchTable = true;
        }else{
            pesquisarContasVm.blnBlockSearchTable = false;
        }
        return pesquisarContasVm.Contas;
   }
    
    public void PesquisarNome(){
       
        if(pesquisarContasVm.campoEstaValidoParaPesquisa()){
            pesquisarContasVm.Contas = getContas();
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,Label.CampoObrigatorio.replace('{0}','Nome'));
            ApexPages.addMessage(myMsg);
        }
       
    }
    
    public PageReference Beginning() { //user clicked beginning
      pesquisarContasVm.counter = 0;
      return null;
   }

   public PageReference Previous() { //user clicked previous button
      pesquisarContasVm.counter -= pesquisarContasVm.list_size;
      return null;
   }

   public PageReference Next() { //user clicked next button
      pesquisarContasVm.counter += pesquisarContasVm.list_size;
      return null;
   }

   public PageReference End() { //user clicked end
      pesquisarContasVm.counter = pesquisarContasVm.total_size - math.mod(pesquisarContasVm.total_size, pesquisarContasVm.list_size);
      return null;
   }

   public Boolean getDisablePrevious() { 
      //this will disable the previous and beginning buttons
      if (pesquisarContasVm.counter>0) return false; else return true;
   }

   public Boolean getDisableNext() { //this will disable the next and end buttons
      if (pesquisarContasVm.counter + pesquisarContasVm.list_size < pesquisarContasVm.total_size) return false; else return true;
   }

   public Integer getTotal_size() {
      return pesquisarContasVm.total_size;
   }

   public Integer getPageNumber() {
      return pesquisarContasVm.counter/pesquisarContasVm.list_size + 1;
   }

   public Integer getTotalPages() {
      if (math.mod(pesquisarContasVm.total_size, pesquisarContasVm.list_size) > 0) {
         return pesquisarContasVm.total_size/pesquisarContasVm.list_size + 1;
      } else {
         return (pesquisarContasVm.total_size/pesquisarContasVm.list_size);
      }
   }
    //View Model
    public class PesquisarContasVm{
        
        
        
        public integer counter=0;  //keeps track of the offset
        public integer list_size=5; //sets the page size or number of rows
        public integer total_size{get;set;} //used to show user the total size of the list
    
        public List<Account> Contas {get;set;}
        public Boolean blnBlockSearchTable {get;set;}
        public String strNome {get;set;}
        
        public PesquisarContasVm(){
            Contas = new List<Account>();
        }
        
        public Boolean campoEstaValidoParaPesquisa(){
            If(strNome==null || strNome=='')
            {
              return false;
            }
            return true;
        }

    }
   
}