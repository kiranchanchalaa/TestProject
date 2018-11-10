global class batchClass implements Database.Batchable<Account>{
    global iterable<account> start(Database.BatchableContext bc){
        return new example();
    }
    global void execute(Database.BatchableContext bc,list<Account> scope){
        list<Account> acc=new list<Account>();
        for(Account a:Scope){
           a.name='batchecampleitraoretest';
           a.NumberOfEmployees=25;
            acc.add(a);
        }
        update acc;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}