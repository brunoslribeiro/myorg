public class V_Create_Vor_ObjetoPai_Domain {
   
    public ObjetoPai__c obj;
    
/************************************************ 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Constructor da Domain ObjetoPai
* Manutenção - Quem ? - Quando ? - Por quê ? 
*************************************************/
    public V_Create_Vor_ObjetoPai_Domain(ObjetoPai__c obj){
        this.obj = obj;
    }
    
/************************************************ 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Verificar se os dados do ObjetoPai são válidos
* Manutenção - Quem ? - Quando ? - Por quê ? 
*************************************************/
    public Boolean IsValid(){
        if(obj.Name=='' || obj.Name==null){
            throw new V_Create_Vor_ObjetoPai_DomainException('O valor do campo Name não pode estar vazio');
            return false;
        }
        return true;
    }
}