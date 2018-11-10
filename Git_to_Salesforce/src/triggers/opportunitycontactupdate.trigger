trigger opportunitycontactupdate on Opportunity (after insert, after update) {
    
    map<id,opportunity> oldvalues=trigger.oldMap;
    map<id,opportunity> newvalues=trigger.newMap;
    List<contact> con=new list<contact>();
    list<id> ids=new list<id>();
    
    if(trigger.isAfter && trigger.isUpdate){
    	for(id opty: oldvalues.keyset()){
    		opportunity old1= oldvalues.get(opty);
    		opportunity new1= newvalues.get(opty);
    		if(old1.StageName!=new1.StageName || new1.StageName=='Closed Won'){
    		ids.add(opty);
    		}
    	}
    }
    
   list<OpportunityContactRole> opty1=[select id,Contactid,contact.phone,opportunity.stageName,opportunityid
                                       from OpportunityContactRole where opportunityid IN:ids];                     
                                          
          for(OpportunityContactRole opr: opty1){               
               contact c=new contact();
               c.id=opr.Contactid;
               c.phone='9550251035';
               c.Description= opr.opportunity.stageName;
               con.add(c);
          }  
          update con;              
    
}