global Class optyBatch implements Database.Batchable<SObject>{
  global Database.QueryLocator start(Database.BatchableContext bc){
  return database.getQueryLocator('select id,name from opportunity');
  }
  global void execute(Database.batchableContext bc, list<opportunity>scope){
  for(opportunity op:scope){
      op.name='sush';
  }update scope;
  }
  global void finish(Database.batchableContext bc){
  Messaging.singleEmailmessage msg=new   Messaging.singleEmailmessage();
  string[]ToAddress=new string[]{'sushmashaik60@gmail.com'};
  msg.setToAddresses(ToAddress);
  msg.setplaintextBody('Iam from BatchApex');
  msg.setSenderdisplayname('Sush');
  Messaging.Email[] email=new Messaging.Email[]{msg};
  Messaging.sendEmail(email);
  }
  
}