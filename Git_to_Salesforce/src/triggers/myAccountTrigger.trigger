Trigger myAccountTrigger on Account(before delete,before insert,before update,after delete,after insert,after update){
                                     
    /* If(trigger.isbefore){
        if(trigger.isDelete){
          for(account a: trigger.old){
              if(a.name=='ammu'){
                  a.adderror('you do not delete this record');
              }
          }
        }   
        
    }else{
        if(trigger.isbefore){
            if(trigger.isDelete){
                for(account ab: trigger.new){
                    if(ab.name=='kirru'){
                        ab.adderror('you do not delete this record');
                    }
                }
            }
        }
    }
    if(trigger.isinsert){
        for(account ac: trigger.new){
            if(ac.name=='kiran' && ac.phone=='9550251035'){
                ac.Type='Others';
            }
        }
    }else{
        if(trigger.isinsert){
            list<contact> c=new list<contact>();
            for(Account acc: trigger.new){
                if(acc.name=='insertcontact'){
                    c.add(new contact(lastname='insertcontact',Accountid=acc.id));
                }
            }insert c;
        }
    }*/
     
if (Trigger.isBefore) {
    if (Trigger.isDelete) {

        // In a before delete trigger, the trigger accesses the records that will be
        // deleted with the Trigger.old list.
        for (Account a : Trigger.old) {
            if (a.name != 'okToDelete') {
                a.addError('You can\'t delete this record!');
            } 
        }
    } else {

    // In before insert or before update triggers, the trigger accesses the new records
    // with the Trigger.new list.
        for (Account a : Trigger.new) {
            if (a.name == 'bad') {
                a.name.addError('Bad name');
            }
    }
    if (trigger.isafter && Trigger.isInsert) {
        for (Account a : Trigger.new) {
            System.assertEquals('xxx', a.accountNumber); 
            System.assertEquals('Other', a.industry); 
            System.assertEquals(100, a.numberofemployees);
            System.assertEquals(100.0, a.annualrevenue);
            a.accountNumber = 'yyy';
        }

// If the trigger is not a before trigger, it must be an after trigger.
} else {
    if (Trigger.isInsert) {
        List<Contact> contacts = new List<Contact>();
        for (Account a : Trigger.new) {        
            if(a.Name == 'makeContact') {
                contacts.add(new Contact (LastName = a.Name,
                                          AccountId = a.Id));
            }
        } 
      insert contacts;
    }
  }
}}}