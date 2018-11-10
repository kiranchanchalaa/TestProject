public class PaginatewiththeStandardSetControlle {
list<opportunity> query =[SELECT Name, StageName, Amount, Account.Name FROM Opportunity where Account.BillingState ='California' 
            and StageName ='ClosedWon'];
    
         public apexpages.StandardSetController setCon {
           get{
            if(setCon==null){
                setCon=new apexpages.StandardSetController(Database.getQueryLocator('query'));
            }
               return setCon;
        }
             set;
       
    }
}