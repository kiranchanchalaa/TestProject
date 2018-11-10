@RestResource(urlMapping='/ShowAccounts/*')
global class ShowAccounts {

    @HttpGet
    global static list<Account>getAccount(){
        list<account> accs;
        try{
           accs =[select id,name,phone from account];
            return accs;
        }catch(Exception e){
            System.debug('Error'+e.getMessage());
            return accs;
        }
    }
    
}