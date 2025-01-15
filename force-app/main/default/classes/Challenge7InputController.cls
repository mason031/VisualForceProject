public with sharing class Challenge7InputController {

    public String accountName{set;get;}
    public List<Account> a {set;get;}
    public List<Contact> c;
    public String accountId{set;get;}
    public Challenge7InputController() {

    }
    public void getAccount(){
        String s = '%' + accountName + '%';
        this.a = [SELECT Name FROM Account WHERE Name LIKE :s];
       
    }
    public List<Contact> getC(){
        return this.c;
    }
    public void setC(){
        this.c = [SELECT FirstName, LastName FROM Contact WHERE AccountId = :accountId];
    }
    public void saveRecords(){
        Database.update(this.a);
        Database.update(this.c);
    }

}