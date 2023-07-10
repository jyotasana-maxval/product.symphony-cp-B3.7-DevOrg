@isTest
Public class AverageTimeReportTest
{
    Static TestMethod Void AverageTimeReportTestMethod()
    {
    Patent__c objAsset = new Patent__c();
    objAsset.Title_of_Invention__c='phone';
    objAsset.Description__c='Maxval';
    insert objAsset;
    System.assertEquals(objAsset.Description__c,'Maxval');
    IFW_Data_v1__c objIFWData = new IFW_Data_v1__c();
    objIFWData.Asset__c=objAsset.id;
    //insert objIFWData;
    
    AverageTimeReport atr = New AverageTimeReport();
    //calculatingAverageTimeForAssets cat = New calculatingAverageTimeForAssets();
    }
}