public class LinghtningForOutlookServerController {

    @AuraEnabled
    public static list<map<string, object>> findAccountAges(list<string> emails){
        list<map<string, object>> objlist=new list<map<string, object>>();
        list<contact> cons=[select id,Lastname,email, name,Account.name,Account.CreatedDate from contact where email =:emails];
        
        for(contact c: cons){
            map<string, object> obj=new map<string,object>();
            obj.put(c.name, c.Account.Name);
            obj.put(c.LastName, date.valueOf(c.account.CreatedDate).daysBetween(System.date.today()));
            System.debug(obj.keyset());
           // string k=onj.getvalues();
               objlist.add(obj);    
        }
       
        return objlist;
      }
    @AuraEnabled
    public static list<map<string,object>> findOpportunityCloseDateTime(list<string> emails){
        list<map<string, object>> ret =new list<map<string,object>>();
       List<OpportunityContactRole> contacts = 
           [SELECT Opportunity.Name, Opportunity.CloseDate 
            FROM OpportunityContactRole];
        for(OpportunityContactRole   c: contacts){
             Map<String, Object> item = new Map<String, Object>();
            item.put('name', c.Opportunity.Name);
            item.put('closesIn', 
                     System.Date.today().daysBetween(
                         Date.valueOf(c.Opportunity.CloseDate)));
            ret.add(item);
        }
        return ret;
    }
}