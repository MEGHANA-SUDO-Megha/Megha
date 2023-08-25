public class candidateController {
    @AuraEnabled(cacheable=true)
    public static List<candidate__c> searchCandidates(String searchTerm) {
        String searchQuery = '%' + searchTerm + '%';
        return [select id,Candidate_First_Name__c,Candidate_Last_Name__c from candidate__c WHERE Candidate_First_Name__c LIKE :searchQuery LIMIT 20];
    }
}