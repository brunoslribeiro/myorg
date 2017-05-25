@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        List<String> result = new List<String>();
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());        
        List<String> parks = new List<String>();
        parks.add('Hamburg Wadden Sea National Park');
        parks.add('Hainich National Park');
        parks.add('Bavarian Forest National Park');
        result = ParkLocator.country('Germany');
        // Verify that a fake result is returned
        System.assertEquals(parks, result); 
    }
}