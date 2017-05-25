@isTest
public class AnimalLocatorTest {
	@isTest static void testGetAnimalLocator() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String name = AnimalLocator.getAnimalNameById(1);                                                        
        String expectedValue = 'chicken';
        System.assertEquals(name, expectedValue);        
    }
}