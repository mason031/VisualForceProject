public with sharing class AccountHelper {
    public AccountHelper() {

    }

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Name, AnnualRevenue FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteAccountWithId(String id){
        try {
            
            Account a = [SELECT Id FROM Account WHERE Id = :id];
        
            delete a;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}