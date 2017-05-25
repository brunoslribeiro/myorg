public class V_Create_Vor_ObjetoPai_Repositorio {
	
    public static ObjetoPai__c Inserir(ObjetoPai__c obj){
       Savepoint sp = Database.setSavepoint();
        Try{
            upsert(obj);
        }catch(Exception e){
            Database.rollback(sp);
        }
        return obj;
    }
    
}