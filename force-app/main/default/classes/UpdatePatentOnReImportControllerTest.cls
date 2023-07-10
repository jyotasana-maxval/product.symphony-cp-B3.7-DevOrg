@isTest
public class UpdatePatentOnReImportControllerTest {
    @isTest
    static void testSelectedPatentIDsCheck() {
        // Create test data
        Patent__c objPatent = new Patent__c();
        objPatent.Title_of_Invention__c = 'Test';
        insert objPatent;

        List<String> selectedPatentIds = new List<String>();
        selectedPatentIds.add(objPatent.Id);

        // Create a test instance of ApexPages.StandardSetController
        ApexPages.StandardSetController standardSetController = new ApexPages.StandardSetController(new List<Patent__c>{ objPatent });
        
        // Create an instance of the controller
        UpdatePatentOnReImportController controller = new UpdatePatentOnReImportController(standardSetController);
        controller.SelectedPatentIDs = selectedPatentIds;

        // Call the method to be tested
        controller.SelectedPatentIDsCheck();

        // Perform assertions
        System.assertEquals(true, controller.patIdsSizeCheck);

        // Verify the logic of the ImportPatents method
        String batchId = ImportViewController_v1.ReimportAsset(selectedPatentIds);
        System.assertEquals(batchId, controller.MVImportBatchRecordId.remove('/'));
    }
}