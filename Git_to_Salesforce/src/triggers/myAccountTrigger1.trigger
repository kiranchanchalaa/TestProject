trigger myAccountTrigger1 on Account (after insert,after update,after delete,after undelete) {

    string Beforeorafter=(trigger.isbefore ? 'before':'after');
    string trrigertype=''
        +(trigger.isdelete ?'delete':'')
        +(trigger.isInsert ?'insert':'')
        +(trigger.isupdate ?'Update':'') 
        +(trigger.isUndelete ?'Undelete':'');
    System.debug(Beforeorafter+''+trrigertype+':'+'Trigger.old==null ~'+(Trigger.old==null));
    System.debug(Beforeorafter+''+trrigertype+':'+'Trigger.oldmap==null ~'+(Trigger.old==null));
 
}