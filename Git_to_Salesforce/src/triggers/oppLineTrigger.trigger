trigger oppLineTrigger on OpportunityLineItem (before insert) {
    
    set<id> ids=new set<id>();
    for(OpportunityLineItem op: trigger.new){
        ids.add(op.id);
    }
    map<id, PricebookEntry > pbe=new map<id, PricebookEntry>(
        [select id,product2.color__c from  PricebookEntry where id in:ids]);
    
    for(OpportunityLineItem olt: trigger.new){
        olt.Description = pbe.get(olt.pricebookEntryId).product2.color__c;
    }
}