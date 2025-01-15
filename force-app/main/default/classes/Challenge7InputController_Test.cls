/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Challenge7InputController_Test {

    @TestSetup
    static void makeData(){
        Account account = new Account(name = 'test');
        insert account;
        Contact contact = new Contact(FirstName = 'John' ,LastName = 'Doe', AccountId = account.Id );
        insert contact;
        Account account2 = new Account(name = 'nocontact');
        insert account2;
    }

    @isTest
    static void testGetAccountPositive() {
        PageReference pageRef = Page.Challenge6;
        Test.setCurrentPage(pageRef);
        Challenge7InputController controller = new Challenge7InputController();
        // TO DO: implement unit test
        
        //Testing getAccount method
        controller.accountName = 'test';
        controller.getAccount();
        controller.accountId = controller.a[0].Id;
        controller.setC();
        Assert.areEqual('test', controller.a[0].Name);
        Assert.areEqual('John', controller.c[0].FirstName);

    }

    @isTest
    static void testGetAccountNegative(){
        Challenge7InputController controller = new Challenge7InputController();
        controller.accountName = 'badinput';
        controller.getAccount();
        Assert.areEqual(0, controller.a.size());
    }

    @isTest
    static void testNoContacts(){
        Challenge7InputController controller = new Challenge7InputController();
        controller.accountName = 'nocontact';
        controller.getAccount();
        controller.accountId = controller.a[0].Id;
        controller.setC();
        Assert.areEqual(0, controller.c.size());
        
    }

    @isTest
    static void saveRecords(){
        Challenge7InputController controller = new Challenge7InputController();
        controller.accountName = 'test';
        controller.getAccount();
        controller.accountId = controller.a[0].Id;
        controller.setC();
        controller.a[0].name = 'Test2';
        controller.c[0].FirstName = 'Jane';
        controller.saveRecords();
        Account aTest = [SELECT Name FROM Account WHERE Id = :controller.a[0].Id LIMIT 1];
        Contact cTest = [SELECT FirstName FROM Contact WHERE Id = :controller.c[0].Id LIMIT 1];
        Assert.areEqual('Test2', aTest.Name);
        Assert.areEqual('Jane', cTest.FirstName);
    }

}