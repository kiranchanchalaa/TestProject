global class UpdateChildRecordsBatch implements Database.Batchable<Sobject>{
    final string Query;    
        Global UpdateChildRecordsBatch(){
           Query='select id,name,(select id,LastName,phone from contacts)from account'; 
        }    
    
        Global Database.QueryLocator Start(Database.BatchableContext bc){
            Return Database.getQueryLocator(Query);
        } 
    
       global void Execute(Database.BatchableContext bc, list<Account> Scope){
           list<contact> c1=new list<contact>();
        For(Account a: Scope){
            For(Contact c: a.Contacts){
                c.phone='9866546424';
                c1.add(c);              
            }            
          }
            list<Database.SaveResult> resule=database.update(c1, false);
           for(Database.SaveResult dr: resule){
               if(dr.isSuccess()){
                   System.debug('records processsed sucessfully');
               }
               else{
                   for(Database.Error er: dr.getErrors()){
                    System.debug('The following error has occurred.');                    
                    System.debug(er.getStatusCode() + ': ' + er.getMessage());
                    System.debug('Account fields that affected this error: ' + er.getFields());  
                   }
               }
           }
             
       }
        global void finish(Database.BatchableContext bc){      
            
            AsyncApexJob jobid=[SELECT id, ApexClassId,JobItemsProcessed,TotalJobItems,NumberOfErrors,CreatedBy.Email FROM AsyncApexJob WHERE id = :bc.getJobId()];
             String emailMessage = 'Your batch job '
             + 'AccountOwnerReassignment '
             + 'has finished.  It executed ' 
             + jobid.totalJobItems
             + ' batches.  Of which, ' + jobid.jobitemsprocessed 
             + ' processed without any exceptions thrown and ' 
             + jobid.numberOfErrors +
             ' batches threw unhandled exceptions.'
             + '  Of the batches that executed without error, ' 
              + ' records were not updated successfully.';
            
           messaging.SingleEmailMessage msg=new messaging.SingleEmailMessage();
             String[] toAddresses = new String[] {jobid.createdBy.email};
                msg.setToAddresses(toAddresses);
                msg.setSenderDisplayName('batch_job_Execuation');
                msg.setPlainTextBody(emailMessage);
            Messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});          
    }
}