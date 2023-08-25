public class childrenSearch {
    public static void searchChildren(String searchTerm){ 
        String searchQuery = '%' + searchTerm + '%';
        List<Children__c> childrenList = new List<Children__c>();
        childrenList=[SELECT Id, First_Name__c, Candidate__r.Candidate_First_Name__c  FROM Children__c WHERE Name LIKE :searchQuery LIMIT 20];
        for(Children__c children : childrenList){
            System.debug('Related parent candidate name is ' + children.First_Name__c + ' abd parent related candidate first name is  ' + children.Candidate__r.Candidate_First_Name__c );
        }
    }   
}