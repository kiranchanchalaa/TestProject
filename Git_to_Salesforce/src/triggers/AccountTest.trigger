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
    
    if(trigger.isAfter && trigger.isUpdate){
        for(Account a: trigger.new){
            a.phone='9848966428';
        }
    }
}