trigger ContactRelatedtoAccout on Contact (after insert,after update, after delete,after undelete) {
       /*list<account> accountupdatelist=new list<account>();
       list<id> ids=new list<id>();
    if(trigger.isAfter||(trigger.isDelete|| trigger.isInsert)){
        for(contact c: trigger.new){
            if(c.AccountId!=null){
                ids.add(c.AccountId);
            }
        }
    }
    if(trigger.isUndelete){
        for(contact c:trigger.old){
            if(c.AccountId!=null){
                ids.add(c.AccountId);
            }
        }
    }
    System.debug('contact id =======>'+ids);
    list<Account> accs=new list<account>([select id,RelatecedContacts__c,(select id,name from Contacts) from Account
                                         where id=:ids]);
    
    for(Account a: accs){
        list<contact> con=a.contacts;
        a.RelatecedContacts__c=con.size();
        accountupdatelist.add(a);
    }
     update accountupdatelist;*/
    
    map<id,contact> oldvalues=trigger.oldmap;
    map<id,contact> newvalues=trigger.newmap;
    list<id> contactids=new list<id>();
    
    if(trigger.isAfter && trigger.isUpdate){
        
    for(id ids : newvalues.keySet()){
         contact oldvalues1=oldvalues.get(ids);
         contact newvalues1=newvalues.get(ids);
        if(oldvalues1.Level__c!= newvalues1.Level__c || newvalues1.Level__c=='Secondary'){
            contactids.add(ids);
        }
    }  
   }
  list<Account> ac=new list<Account>();
    list<contact> con= [select id,name,AccountId,Lastname,phone from contact where id=:contactids];  
    for(contact c: con){
        Account a= new Account();
        a.Id=c.AccountId;
        a.Description=c.Id+','+c.LastName+','+c.Phone;
        ac.add(a);
        update ac;
    }
}