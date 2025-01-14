public with sharing class AccountCustomController {

    private Account a;
    public AccountCustomController() {
        a = (Account)[SELECT Name FROM Account WHERE Name = 'Testing'];
    }
    public Account getAccount(){
        return this.a;
    }

}