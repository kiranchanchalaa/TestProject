trigger AcctoContactTrigger on AccountContactRelation (after update,after insert) {
    
    
    map<id,AccountContactRelation> oldvalues=trigger.oldmap;
    Map<id,AccountContactRelation> newvalues=trigger.newmap;
      
     set<id> ids=new set<id>();
    if(trigger.isafter && trigger.isupdate){  
         
    for(id a: oldvalues.keySet()){
       AccountContactRelation  oldval= oldvalues.get(a);
       AccountContactRelation  newval= oldvalues.get(a); 
        if(oldval.Roles!=newval.Roles){
            ids.add(a);
        }
    }
    
    list<AccountContactRelation> con = [select id,Contact.Lastname, Contact.phone,
                                        Account.phone,AccountID,
                                        ContactId from AccountContactRelation where id IN :ids];
    list<account> accd= new list<account>();
    
    for(AccountContactRelation accs: con){
        Account a=new Account();
        accs.AccountId=a.id;
        accs.Account.phone=a.phone;  
        accd.add(a);
        System.debug(a);
    }   update accd; 
    
}
}