public class V_Create_Vor_ObjetoPai_Service {

/************************************************ 
* Author: Bruno Smith Lopes Ribeiro 
* Data de Criação:23/02/2017
* Descrição: Inserir o ObjetoPai__c
* Responsabilidade:
    1 - Inserir os registros de tipo ObjetoPai__c 
    2 - Identificar processos de negócio antes da Inserção 
    3 - Executar a Domain para Validar os dados
* Manutenção - Quem ? - Quando ? - Por quê ? 
*************************************************/
    public static ObjetoPai__c InserirObjetoPai(ObjetoPai__c obj){
        V_Create_Vor_ObjetoPai_Domain Domain = new V_Create_Vor_ObjetoPai_Domain(obj);
        Boolean isValidateDomain = Domain.IsValid();
        if(isValidateDomain){
           return V_Create_Vor_ObjetoPai_Repositorio.Inserir(obj);
        }else{
           return obj;
        }
     }
    
}