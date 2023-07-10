@isTest
private class OCRServiceAPITest {
    @isTest
    static void testGetIfwData() {
        // Test data setup
        Ifw_Data_v1__c ifwData = new Ifw_Data_v1__c(Name = 'Test Data');
        insert ifwData;

        Test.startTest();
        // Call the method to test
        String result = OCRServiceAPI.GetIfwData();
        Test.stopTest();

        // Assertion
        System.assertEquals(ifwData.Id, result, 'Unexpected IfwId value');
    }

    @isTest
    static void testUploadPDF() {
        // Test data setup
        String pdfContent = 'Test PDF Content';
        String pdfFileName = 'Test.pdf';
        String ifwRecordId = '001XXXXXXXXXXXX';

        Test.startTest();
        // Call the method to test
        String result = OCRServiceAPI.UploadPDF(pdfContent, pdfFileName, ifwRecordId);
        Test.stopTest();

        // Assertion
        System.assertEquals('{"Result" : "success"}', result, 'Unexpected result value');
    }
}