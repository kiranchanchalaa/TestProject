global class SummarizeAccountTotal implements Database.Batchable<sobject>, Database.Stateful{

    public string query;
    public integer count;
    
    public SummarizeAccountTotal(string q){
        query=q;
        count=0;
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }  
    global void execute(Database.BatchableContext bc,list<sobject> scope){
         for(Sobject s: scope){
            count =integer.valueOf(s.get('total__c'))+count;
        }
    }
    global void finish(Database.BatchableContext bc){
        
    }
}