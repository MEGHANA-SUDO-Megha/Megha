trigger Children_Gender on Children__c (before insert,after insert,before update,after update) {
    
    //A Gender Value should be populated
    if(Trigger.isBefore && Trigger.isUpdate) {
        for(Children__c myNewRecord : Trigger.New) {
            if(myNewRecord.Gender__c ==Null) {
                myNewRecord.addError('A Gender Value should be populated');
            }
        }
    }
    
    //Children name field should be boy if gender is selected as male, girl if selected as female, if selected as others nothing is populated
    List<Children__c> RecList = New List<Children__c>();
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)) {
        for(Children__c myNewRecord : Trigger.New) {
            if(myNewRecord.Gender__c =='Male') {
                myNewRecord.Name='Boy' ;
            } 
            if(myNewRecord.Gender__c =='Female') {
                myNewRecord.Name='Girl' ;
            } 
//            Update myNewRecord ; 
              Children__c ABCD = New Children__c(Id = myNewRecord.Id, Name = myNewRecord.Name);
              RecList.add(ABCD);

        }
        Update RecList;
    }

}