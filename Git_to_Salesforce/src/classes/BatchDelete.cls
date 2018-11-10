global class BatchDelete implements Database.Batchable<sobject>{
public string query;
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    global void Execute(Database.BatchableContext bc,list<sobject> scope){
        delete scope;
        database.emptyRecycleBin(scope);
    }
    global void finish(Database.BatchableContext bc){
        
    }
}