Global class updatebatch implements Database.batchable<Sobject>{	
	global final string Query ;
	global final string entery;
    global final string field;
    global final string value;	
	
global updatebatch(string q,string e,string f,string v){
	Query=q; entery=e; field=f; value=v;
     }	
global Database.QueryLocator Start(Database.BatchableContext  bc){
	Return database.getQueryLocator(Query);
     }
Global void Execute(Database.BatchableContext bc,list<Sobject> scope){
        for(Sobject s: scope){
            s.put(field,value);
        }
	update Scope;
 }	
    global void finish(database.BatchableContext bc){
        
    }
}