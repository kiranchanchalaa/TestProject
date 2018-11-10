trigger RollupOncontact on Contact (After insert, After delete, After undelete) {
    Set<Id> parentIdsSet = new Set<Id>();
    List<Account> accountListToUpdate = new List<Account>();
    IF(Trigger.IsAfter){
        IF(Trigger.IsInsert || Trigger.IsUndelete){
            FOR(Contact c : Trigger.new){
                if(c.AccountId!=null){   
                   parentIdsSet.add(c.AccountId); 
                }
            }
        }
        IF(Trigger.IsDelete){
            FOR(Contact c : Trigger.Old){
                if(c.AccountId!=null){   
                   parentIdsSet.add(c.AccountId); 
                }
            }
        }
    }
    System.debug('#### parentIdsSet = '+parentIdsSet);
    List<Account> accountList = new List<Account>([Select id ,Name, Number_of_Contacts__c, (Select id, Name From Contacts) from Account Where id in:parentIdsSet]);
    FOR(Account acc : accountList){
        List<Contact> contactList = acc.Contacts;
        acc.Number_of_Contacts__c = contactList.size();
        accountListToUpdate.add(acc);
    }
    try{
        update accountListToUpdate;
    }catch(System.Exception e){
        
 }  
}