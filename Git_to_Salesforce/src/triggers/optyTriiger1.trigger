trigger optyTriiger1 on Opportunity (before insert,before update,After update,after insert){
    
       Map<id,opportunity> opty=trigger.oldmap;
       Map<id,opportunity> opty1=trigger.newmap;
    
    if(trigger.IsBefore|| trigger.isUpdate){
     /* opportunity p=new opportunity();
         list<id>ids1=new list<id>();
        for(id op: opty.keySet()){
            opportunity op1=opty.get(op);
            opportunity op2=opty1.get(op);
           if(op1.stageName=='closed won' && op2.StageName=='Closed Lost'){
                ids1.add(op);
            }
        
     }
      list<opportunity> op9=[select id,Name,StageName,AccountId,leadSource,CloseDate from opportunity where id IN:ids1];  
        for(opportunity o:op9){
            o.CloseDate=System.today()+15;
        }
        update op9;
      */
        for(opportunity opp1: trigger.new){
            opp1.CloseDate=System.today()+25;
        }
    }
    
    if(trigger.isUpdate){
        List<Account> accs =new list<Account>();        
        list<id>ids=new list<id>();
        for(id op: opty.keySet()){
            opportunity op1=opty.get(op);
            opportunity op2=opty1.get(op);
            if(op1.stageName=='closed won' && op2.StageName=='Closed Lost'){
                ids.add(op);
            }
        }
        list<opportunity> op3=[select id,Name,StageName,AccountId,leadSource,CloseDate from opportunity where id IN:ids];
        for(opportunity op4:op3){
            Account a=new Account();
            a.id=op4.AccountId;
            a.Description=op4.Name+', '+op4.LeadSource+','+op4.CloseDate;
            accs.add(a);
        }
        update accs;
    }
    if(trigger.IsInsert){
        list<OpportunityContactRole> opct =[SELECT ContactId,CreatedById,CreatedDate,Id,IsDeleted,IsPrimary,LastModifiedById,
                 LastModifiedDate,OpportunityId,Role,SystemModstamp FROM OpportunityContactRole where ContactId!=null];
                 list<contact> c=new list<contact>();
                For(OpportunityContactRole op5: opct){
                    for(opportunity op6: trigger.new){
                         contact c1=new contact();
                         c1.LastName=op6.name;
                        c.add(c1);
                    }
                 
                    
        }
        
    }
}