trigger Pratices on WorkFlowTestChild__c (before insert,after insert) {
     boolean IsLock = false;
    for( WorkFlowTestChild__c op : trigger.new){
        if(op.Name!='test'){
           IsLock= true; 
        }
    }
}