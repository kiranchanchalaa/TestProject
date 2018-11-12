public class AccountQueryAction {
    
    @InvocableMethod(label='get Accounts name' description='this list will return the account list')
    public static list<String> getAccounts( list<id> ids){
        list<string> Accountnames=new list<String>();
        list<Account> accs= [select id ,name from Account where id IN:Ids];
        for(Account a: accs){
          Accountnames.add(a.name);  
        }
        return Accountnames;
        
    }    
}