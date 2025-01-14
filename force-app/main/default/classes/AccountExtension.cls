public with sharing class AccountExtension {
    private String accountName;
    public Account a;
    public AccountExtension(ApexPages.StandardController stdController) {
        this.a = (Account)stdController.getRecord();
    }
    public String getaccountName(){
        return this.accountName;
    }
    public void setaccountName(String value){
        this.accountName = value;
    }
    public Account getA(){
        return this.a;
    }
    public void queryAccount(){
        this.a = (Account)[SELECT Name FROM Account WHERE Name = :accountName];
    }
    
}