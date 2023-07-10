@isTest
private class Test_PAIR_RequestPatentData_ApiBatch {
    @isTest
    static void testBatchProcess() 
    {
        
        // Start the batch process
        Test.startTest();
        PAIR_RequestPatentData_ApiBatch batch = new PAIR_RequestPatentData_ApiBatch();
        Database.executeBatch(batch);
        Test.stopTest();
    }
}