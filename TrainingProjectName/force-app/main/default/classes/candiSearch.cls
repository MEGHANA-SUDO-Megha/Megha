public with sharing class candidateSearch {
    public static void candisearch (String firstName ) {
        List<candidate__c> candidateList = new List<candidate__c>();
        candidateList = [select First_Name__c , GENDER__c, Last_Name__c from candidate__c where First_Name__c = :firstName ];
        for(candidate__c candidateRecord : candidateList ){
            System.debug('searched account details ' + candidateRecord);
        }
        
    }
    
}