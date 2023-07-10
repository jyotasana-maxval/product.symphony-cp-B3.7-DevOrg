@IsTest
public class PillControllerTest {
    @IsTest
    public static void testSearchCountries() {
        // Test data
        String searchWord = 'test';
        List<String> countryIds = new List<String>{'countryId1', 'countryId2'};
            String PCT;
        
        // Create test countries
        List<Country__c> testCountries = new List<Country__c>();
        for (Integer i = 0; i < 2; i++) {
            Country__c country = new Country__c();
            country.Name = 'Country ' + i;
            country.Country_Code__c = 'Code ' + i;
            country.PCT_Contracting_State__c = false;
            testCountries.add(country);
        }
        insert testCountries;
        
        // Call the method
        Test.startTest();
        List<wrapperComboboxOption> result = PillController.searchCountries(searchWord, countryIds, PCT);
        Test.stopTest();
        
        // Verify the result
        System.assertEquals(2, result.size());
        
        // Verify the wrapper objects
        for (Integer i = 0; i < result.size(); i++) {
            wrapperComboboxOption option = result[i];
            Country__c country = testCountries[i];
            if (country.Country_Code__c != null) {
                System.assertEquals(country.Name + ' (' + country.Country_Code__c + ')', option.label);
            } else {
                System.assertEquals(country.Name, option.label);
            }
            System.assertEquals(country.Id, option.value);
        }
    }
    
    @IsTest
    public static void testGetSelectedCountries() {
        // Test data
        List<String> countryIds = new List<String>{'countryId1', 'countryId2'};
            
            // Create test countries
            List<Country__c> testCountries = new List<Country__c>();
        for (Integer i = 0; i < 2; i++) {
            Country__c country = new Country__c();
            country.Name = 'Country ' + i;
            country.Country_Code__c = 'Code ' + i;
            testCountries.add(country);
        }
        insert testCountries;
        
        // Test data
        wrapperPill objPill = new wrapperPill();
        objPill.type = 'avatar';
        objPill.label = 'Test Label';
        objPill.name = 'United States of America';
        objPill.fallbackIconName = 'Test Fallback Icon';
        objPill.variant = 'Test Variant';
        objPill.alternativeText = 'Test Alternative Text'; 
        
        // Call the method
        Test.startTest();
        List<wrapperPill> result = PillController.getSelectedCountries(countryIds);
        Test.stopTest();
        
        // Verify the result
        System.assertEquals(2, result.size());
        
        // Verify the wrapper objects
        for (Integer i = 0; i < result.size(); i++) {
            wrapperPill pill = result[i];
            Country__c country = testCountries[i];
            System.assertEquals('avatar', pill.type);
            System.assertEquals(country.Name, pill.label);
            System.assertEquals(country.Id, pill.name);
            System.assertEquals('standard:address', pill.fallbackIconName);
            System.assertEquals('circle', pill.variant);
            if (country.Country_Code__c != null) {
                System.assertEquals(country.Name + ' (' + country.Country_Code__c + ')', pill.alternativeText);
            } else {
                System.assertEquals(country.Name, pill.alternativeText);
            }
        }
    }
    
    /*@IsTest
public static void testGetDecisnRcrdCountrys() {
// Test data
String decisionrecordId = 'decisionrecordId';
String norEP = 'National';

// Create test countries
List<Country__c> testCountries = new List<Country__c>();
for (Integer i = 0; i < 2; i++) {
Country__c country = new Country__c();
country.Name = 'Country ' + i;
country.Country_Code__c = 'Code ' + i;
testCountries.add(country);
}
insert testCountries;

// Create test Jurisdiction Decision Records
List<Jurisdiction_Decision_Record__c> testJDRs = new List<Jurisdiction_Decision_Record__c>();
for (Integer i = 0; i < 2; i++) {
Jurisdiction_Decision_Record__c jdr = new Jurisdiction_Decision_Record__c();
jdr.Name__c = 'JDR ' + i;
jdr.Name__r = testCountries[i];
jdr.Decision_Record__c = decisionrecordId;
jdr.Is_PCT_Nation__c = true;
jdr.Jurisdiction_Decision_Status__c = 'Confirmation Pending';
jdr.Is_EP_Nation__c = false;
testJDRs.add(jdr);
}
insert testJDRs;

// Call the method
Test.startTest();
List<wrapperPill> result = PillController.getDecisnRcrdCountrys(decisionrecordId, norEP);
Test.stopTest();

// Verify the result
System.assertEquals(2, result.size());

// Verify the wrapper objects
for (Integer i = 0; i < result.size(); i++) {
wrapperPill pill = result[i];
Jurisdiction_Decision_Record__c jdr = testJDRs[i];
System.assertEquals('avatar', pill.type);
System.assertEquals(jdr.Name__r.Name, pill.label);
System.assertEquals(jdr.Name__r.Id, pill.name);
System.assertEquals('standard:address', pill.fallbackIconName);
System.assertEquals('circle', pill.variant);
if (jdr.Name__r.Country_Code__c != null) {
System.assertEquals(jdr.Name__r.Name + ' (' + jdr.Name__r.Country_Code__c + ')', pill.alternativeText);
} else {
System.assertEquals(jdr.Name__r.Name, pill.alternativeText);
}
}
}*/
    @isTest
    public static void testGetDecisnRcrdCountrys() 
    {
        // Create test data
        Jurisdiction_Decision_Record__c jdr = new Jurisdiction_Decision_Record__c();
        jdr.Is_PCT_Nation__c = true;
        jdr.Jurisdiction_Decision_Status__c = 'Confirmation Pending';
        jdr.Is_EP_Nation__c = false;
        INSERT jdr;
        
        // Test data
        wrapperPill objPill = new wrapperPill();
        objPill.type = 'avatar';
        objPill.label = 'Test Label';
        objPill.name = 'United States of America';
        objPill.fallbackIconName = 'Test Fallback Icon';
        objPill.variant = 'Test Variant';
        objPill.alternativeText = 'Test Alternative Text';        
        
        // Call the method to test
        List<wrapperPill> result = PillController.getDecisnRcrdCountrys(jdr.Id, 'National');
        
        // Perform assertions to validate the results
        System.assertEquals(0, result.size(), 'Expected size: 0');
        
    }
}