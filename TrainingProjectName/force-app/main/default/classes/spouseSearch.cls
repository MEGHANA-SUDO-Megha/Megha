public class spouseSearch {
    public static void searchSpouse(String searchterm){
        String searchQuery = '%' + searchTerm + '%';
        List<Spouse__c> spouseList=new List<Spouse__c>();
        spouseList=[SELECT Id, Candidate_First_Name__c FROM Spouse__c WHERE Candidate_First_Name__c LIKE :searchQuery LIMIT 20];
        for(Spouse__c spouse : spouseList){
            System.debug('Spouse first name is ' + spouse.Candidate_First_Name__c);
        }
    }
}