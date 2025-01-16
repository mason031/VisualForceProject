public with sharing class Challenge3Extension {
    public Account a{get;set;}
    public Boolean isRendered{get;set;}
    public Challenge3Extension(ApexPages.StandardController stdController) {
        this.a = (Account)stdController.getRecord();
        this.isRendered = false;
    }

    public void toggleRender(){
        this.isRendered = !this.isRendered;
    }
}