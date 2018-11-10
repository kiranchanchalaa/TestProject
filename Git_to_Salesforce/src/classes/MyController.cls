public class MyController {
    private final Account account;
    public MyController(){
        
        account=[select id,name,site from Account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    public account getAccount(){
        return account;
    }
    public pageReference save(){
        update account;
       PageReference redirectSuccess = new ApexPages.StandardController(Account).view();
        return (redirectSuccess);

    }
}