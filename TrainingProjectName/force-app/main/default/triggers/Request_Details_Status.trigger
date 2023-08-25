trigger Request_Details_Status on Request_Details__c (before insert, before update, after insert, after update, before delete, after delete) {
    
    //Recrod Status should be only 'In Progress while creating a record
    if(Trigger.isBefore && Trigger.isInsert) {
        for(Request_Details__c myNewRecord : Trigger.New) {
        	if(myNewRecord.Status__c !='In Progress') {
                    myNewRecord.addError('while creation record status should be only in progress');
        	}
    	}
    }
    
    //Stopping user to delete any request details record
    if(Trigger.isBefore && Trigger.isDelete){
        for(Request_Details__c myNewRecord : Trigger.Old) {
        	myNewRecord.addError('Request Details Record Deletion is not Allowed !!!');    	}
        }
    
    //A record cannot be updated to Cancelled if status is Submitted
    if(Trigger.isBefore && Trigger.isUpdate) {
        for(Request_Details__c myNewRecord : Trigger.New) {
            for( Request_Details__c myNewRecordOldValue : Trigger.Old) {
                if(myNewRecord.Status__c =='Cancelled' && myNewRecordOldValue.Status__c =='Submitted') {
                            	myNewRecord.addError('Submitted Requests Cannot Be Cancelled !!!');    	

                }
            }
        }
    }
    
    
}