public class PageReferenceMycontroller {
    
    Account account;
    
    contact cons;
    
    public Account getAccount(){
        if(Account==null)account =new Account();        
        return account;
    }
    
    public PageReference save(){
        try{
          insert account;  
        }catch(Exception e){
            System.debug(e.getMessage());
            System.debug(e.getStackTraceString());
        }
         
        PageReference  p= new ApexPages.StandardController(account).view();
        p.setRedirect(true);
        return p;
    }
    public PageReference  Edit(){
        insert account;
        PageReference  p=new apexpages.StandardController(account).Edit();
        p.setRedirect(true);
        return p;
    }
   
}