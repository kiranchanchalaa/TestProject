trigger AccountTest on Account (before insert,before update,after insert,after update) {

   /* if(trigger.isBefore && Trigger.isinsert)
        For(Account a: trigger.new){
            a.phone='955025103555';
        }
    
    if(trigger.isAfter && trigger.isinsert)
        for(Account a: trigger.new){
        messaging.SingleEmailMessage mail=new messaging.SingleEmailMessage();
        //messaging.singleEmailMessage mail = messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {'kirangugulothu@gmail.com'});
        mail.setReplyTo('batch@acme.com');
       mail.setSenderDisplayName('trigger Processing');
       mail.setSubject('Batch Process Completed');
       mail.setPlainTextBody('Batch Process has completed');

     Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
   
    if(trigger.isBefore){
        for(Account a: trigger.new){
            System.debug('i am runing as after trigger');
            a.phone='testphone';
        }
    }}*/
    
    map<id,Account> newvalues=trigger.newmap;
    map<id,Account> oldvalues=trigger.newmap;
     list<id> key=new list<id>();
    
    if(trigger.isbefore && trigger.isUpdate){
        for(id ids: oldvalues.keySet()){
            account a=oldvalues.get(ids);
            Account b=newvalues.get(ids);            
            if(a.Phone!=b.Phone){
            String q = 'SELECT Industry,phone FROM Account';
            String e = 'Account';
            String f = 'phone';
            String v = '123';
            Id batchInstanceId = Database.executeBatch(new updatebatch(q,e,f,v), 5);
            } 
         }           
        }
    }