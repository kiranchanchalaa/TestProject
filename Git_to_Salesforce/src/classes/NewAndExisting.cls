public class NewAndExisting {
    public Account account{get;private set;}
    
    public NewAndExisting(){
        Id id=ApexPages.currentPage().getParameters().get('id');
        account = (id == null) ? new Account() :
       [SELECT Name, Phone, Industry FROM Account WHERE Id = :id];
    }
    public pageReference save(){
        try{
            upsert(Account);
        }catch(system.DMLException  e){
             ApexPages.addMessages(e);

            return null;
            }
        PageReference redirectSuccess =new apexPages.StandardController(Account).view();
            return(redirectSuccess);
    }

}