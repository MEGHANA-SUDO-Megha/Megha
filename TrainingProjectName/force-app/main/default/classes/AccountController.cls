public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchTerm) {
        String searchQuery = '%' + searchTerm + '%';
        return [SELECT Id, Name FROM Account WHERE Name LIKE :searchQuery LIMIT 20];
    }
}