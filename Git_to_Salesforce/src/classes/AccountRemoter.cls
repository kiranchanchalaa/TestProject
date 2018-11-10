public class AccountRemoter{

    public string accontname{get;set;}
    public string contactName{get;set;}
    public static Account account {get;set;}
     public static Contact contact {get;set;}
    
    public AccountRemoter(){}
    @RemoteAction
    public static Account getAccount(string accontname){
        account=[SELECT Id, Name, Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accontname];
        return account;
    }
        
    @RemoteAction
        public static contact getContact(string contactName){
            contact=[select id,lastname from contact where lastName=:contactName];
           return contact; 
        }     
  }