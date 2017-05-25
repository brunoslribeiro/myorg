public class TestController {
    public interface MyInterface { String getMyString(); }
    
    public class MyTestController implements MyInterface { 
        private String myString; 
        public String getMyString() { return myString; }
        public void setMyString(String s) { myString = s; }
    }
    
    @RemoteAction
    public static MyInterface setMessage(MyInterface i) {
        MyTestController myC = new MyTestController();
        myC.setMyString('MyClassified says "' + i.getMyString() + '".');
        return myC;
    }
}