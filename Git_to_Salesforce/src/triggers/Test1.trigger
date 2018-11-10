trigger Test1 on Contact (after update) {
  map<id,contact> con=trigger.oldmap;
  map<id,contact> con1=trigger.newmap;    
    
    
  List<id> ids=new list<id>();
     for(id id1 : con.keySet()){
       contact c=con.get(id1); 
       contact c1=con1.get(id1);
        if(c.Phone!=c1.Phone){
            ids.add(id1);
        }
    }
     list<Account> acc=[select id,phone,Fax from Account Where id IN:ids];
   for(contact ab: trigger.new){
        Account a=new Account();
       a.id=ab.accountId;
       a.Phone=ab.Phone;
       a.Fax=ab.Fax;
       acc.add(a);
    }
    update acc;
}