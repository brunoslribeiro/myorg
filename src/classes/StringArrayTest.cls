public class StringArrayTest {
	
    public static void generateStringArray(){
        List<String> Testes = new List<String> { 'Test', 'Test', 'Test'};
        for(Integer i=0;i<Testes.size();i++) {
            // Write value to the debug log
            System.debug(Testes[i]+' '+i);
        }
    }
    
    
}