public with sharing class AccountRelatedContactsController {

    transient public List<Account> allAccs {set;get;}
    public String filter{set;get;}
    //public List<Contact> contactLists {set;get;}
    //public set<Id> accountIds{set;get;}
    transient public List<wrappedAccCon> listWrapped {set;get;}
    public AccountRelatedContactsController() {
        this.filter = ApexPages.currentPage().getParameters().get('filterValue');
        System.debug(this.filter);
        if(this.filter != null){
            this.filter = '%' + this.filter + '%';
            this.allAccs = [SELECT Id, Name FROM Account WHERE Name LIKE :this.filter];
        }
        else{
            this.allAccs = [SELECT Id, Name FROM Account];
        }
        List<wrappedAccCon> listWrappedNew = new List<WrappedAccCon>();
        this.listWrapped = listWrappedNew;

        for(Account a: this.allAccs){
            wrappedAccCon w = new wrappedAccCon(a);
            this.listWrapped.add(w);
        }
        //this.contactLists = [SELECT Id, Name FROM Contact WHERE AccountId IN :accountIds];
    }

    public static String createString(List<Contact> contacts){
        String s = '';
        if(contacts != null && contacts.size()>0){
            for(Integer i = 0; i<contacts.size();i++){
                if(i == contacts.size()-1){
                    s = s + contacts[i].FirstName + ' ' + contacts[i].LastName;
                }
                else{
                    s = s + contacts[i].FirstName + ' ' + contacts[i].LastName + ' ,';
                }
                
            }
        }
        else{
            s = s + 'No related contacts';
        }
        //wrapped.s = s;
        return s;
    }

    public PageReference ListPage(){
        PageReference nextPage = Page.AccountRelatedContacts;
        //System.debug('Previous filter'+ this.filter);
        nextPage.getParameters().put('filterValue', this.filter);
        nextPage.setRedirect(true);
        return nextPage;
    }
    
    public class wrappedAccCon{
        public Account a {get;set;}
        public List<Contact> c {get;set;}
        public String s {get;set;}
        public wrappedAccCon(Account acc){
            this.a = acc;
            this.c = [SELECT Id, FirstName, LastName FROM Contact WHERE AccountId = :acc.Id];
            this.s = AccountRelatedContactsController.createString(this.c);
            
        }
    }
    

}