public with sharing class AccountCustomController {

    private Account a;
    public Boolean render;
    public AccountCustomController() {
        this.a = (Account)[SELECT Name FROM Account WHERE Name = 'Testing'];
        this.render =false;
    }
    public Account getAccount(){
        return this.a;
    }
    public void setRender(boolean value){
        this.render = value;
    }
    public Boolean getRender(){
        return this.render;
    }
    

}