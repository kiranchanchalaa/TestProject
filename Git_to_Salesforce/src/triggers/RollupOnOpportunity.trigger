trigger RollupOnOpportunity on Opportunity (after insert,after delete,after undelete) {
 
    list<id> updateids=new list<id>();
    list<Account> accslist=new list<Account>();
   
    if(trigger.isInsert || trigger.isUndelete)
        for(opportunity op: trigger.new){
            if(op.AccountId!=null){
                updateids.add(op.AccountId);
                            }
        }
    if(trigger.isDelete)
        for(opportunity op1: trigger.old){
            if(op1.AccountId!=null){
                updateids.add(op1.accountId);
            }
        }  
    
    list<account> accQuery=[select  id,name,phone,(select id,Accountid from Opportunities)Discrepation from Account where Id=:updateids];
    
    for(Account ab : accQuery){
        list<opportunity> otylist=ab.Opportunities;
        ab.Test__c=string.valueOf(otylist.size()); 
        accslist.add(ab);
    }
   try{
        update accslist;
   }catch(System.Exception e){}
    
 }