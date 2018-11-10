public class SoqlExamples {
    
    public SoqlExamples(){
        account a=[select id,name from account where name like 'ammu%'];
        
        //Alias Notation
        integer con=[SELECT count()FROM Contact c, c.Account a WHERE a.name = 'kiran'];
        System.debug(con);
        // name starts with k
        list<account> acc=[select id,name from account where name like 'k%'];
        System.debug(acc);
        /*Translating Results8
         *  client application
         *  can have results from a query returned that are translated into the user’s language, using toLabel():
         */
       /*
         Filtering on Boolean Fields
             WHERE BooleanField = TRUE 
          WHERE BooleanField = FALSE 

         Querying Multi-Select Picklists:-
         SELECT Id, MSP1__c from CustObj__c WHERE MSP1__c includes ('AAA;BBB','CCC');
        SELECT Id, MSP1__c FROM CustObj__c WHERE MSP1__c = 'AAA;BBB'

    */
        
    }

}