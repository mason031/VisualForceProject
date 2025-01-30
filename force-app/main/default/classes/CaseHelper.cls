public with sharing class CaseHelper {
    public CaseHelper() {

    }

    @AuraEnabled(cacheable = true)
    public static List<Case> getHighPriorityCases(){
        try {
            return [SELECT AccountId, ContactId, Subject FROM Case WHERE Priority = 'High' AND IsEscalated = True];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void createCase(String status, String origin){
        try {
            Case c = new Case(AccountId = '001Ru00000P8wBmIAJ',
            ContactId='003Ru00000M7UyrIAF',
            Subject = 'Test',
            Status = status, Origin = origin, IsEscalated=true,Priority='High');
        
            insert c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void closeCase(String id){
        try {
            Case c = [SELECT Id, Status FROM Case WHERE Id =:id];
            c.Status = 'Closed';
            update c;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}