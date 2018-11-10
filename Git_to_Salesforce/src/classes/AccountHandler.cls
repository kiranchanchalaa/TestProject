/**
 * Class  AccountHandler
 *
 * Trigger Handler for the Entity SObject. This class implements the ITrigger
 * interface to help ensure the trigger code is bulkified and all in one place.
 */
public with sharing class AccountHandler implements TriggerInterface{   
 
	
    public AccountHandler(){
        System.debug('ACCOUNT HANDLER');
    }
     
    public void bulkBefore(){
        
    }
    
    public void bulkAfter(){  
        

    }   
  
    public void beforeInsert(SObject so){
        System.debug('ACCOUNT HANDLER ::> Before Insert');
       
        
    }
    
    public void beforeUpdate(SObject oldSo, SObject so){ 
        System.debug('ACCOUNT HANDLER ::> Before Update');
        
    }
    
    public void beforeDelete(SObject so){
    
    }
    
    public void afterInsert(SObject so){ 
        System.debug('afterInsertafterInsert'+so);      
        
    }
         
    public void afterUpdate(SObject oldSo, SObject so){ 
		System.debug('Controller in afterUpdate');
        
        
		
    }
    
public void afterDelete(SObject so){
    
}
       
    
    public void andFinally(){            

    }  
}