global class Batchclassexample2 implements Database.Batchable<contact>{
    list<account> ab=new list<Account>();
    
    global iterable<contact>start(Database.BatchableContext bc){
        return new Example2apex();
    }
    
    global void Execute(Database.BatchableContext bc,list<contact> scope){
        for(contact c: scope){
            Account a =new Account();
            a.id=c.AccountId;
            a.Phone=c.HomePhone;
            ab.add(a);
           }
        update ab;
    }
    global void finish(Database.BatchableContext bc){
        
        
    }
}