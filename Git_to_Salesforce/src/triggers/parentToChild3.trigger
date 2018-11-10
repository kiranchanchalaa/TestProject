trigger parentToChild3 on Contact (after update) {
    
  map<id,contact>conOld=Trigger.newmap;
  map<id,contact>conNew=Trigger.oldmap;
    list<account> accs=new list<account>();
    if(trigger.isUpdate){
    list<id> ids=new list<id>();
    for(id c: conOld.keyset()){
        contact c1=conOld.get(c);
        contact c2= conNew.get(c);
        if(c1.phone!=c2.phone){
            ids.add(c);
        }
    }
//list<contact> con = [select id,phone,(select id,AccountId from AccountContactRelations where isDirect =false)from contact where Id IN :ids];
list<AccountContactRelation> acr=[select AccountId,ContactID,Account.phone,Contact.phone from AccountContactRelation
                                where contactId IN :ids And AccountId!=null] ;
       
  for( AccountContactRelation ac: acr){
         Account a=new Account();
         ac.AccountId=a.id;
         a.Phone=ac.contact.phone;
        accs.add(a);
            
        }
    update accs;
     
}
}