global class BatchUserRecordsassin implements Database.batchable<sobject>{
	
	public string Query;
    public string email;
    public id toUserid;
    public id FromUserID;

 global Database.QueryLocator Start(Database.batchableContext bc){
	 Return Database.GetQuerylocator(Query);
 }	
 global void Execute(Database.batchableContext bc,list<Sobject> scope){
	 list<Account> accs=new list<Account>();
	 for(Sobject s: scope){
		 Account a=(Account)s;
		 if(a.OwnerId==FromUserID){
			 a.OwnerId=toUserid;
			accs.add(a);
		 } 
	 }
	 update accs;
 }
 Global void finish(Database.batchableContext bc){
	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	mail.setToAddresses(new String[] {email});
    mail.setReplyTo('batch@acme.com');
    mail.setSenderDisplayName('Batch Processing');
    mail.setSubject('Batch Process Completed');
    mail.setPlainTextBody('Batch Process has completed');
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
	
 }
   /* Execuation process:
    user u = [SELECT ID, UserName FROM User 
             WHERE username='kiran@chanchalaa.com'];
   user u2 = [SELECT ID, UserName FROM User 
              WHERE username='integration@00d7f000001cqlruaa.com'];

BatchUserRecordsassin reassign = new BatchUserRecordsassin();
reassign.query = 'SELECT Id, Name, Ownerid FROM Account ' + 
                'WHERE ownerid=\'' + u.id + '\'';
reassign.email='kirannaikgugulothu@gmail.com';
reassign.fromUserId = u.id;
reassign.toUserId = u2.id;
ID batchprocessid = Database.executeBatch(reassign);
	*/
}