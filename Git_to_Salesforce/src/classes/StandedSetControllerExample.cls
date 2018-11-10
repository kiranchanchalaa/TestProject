public class StandedSetControllerExample {
    public integer noofrecords{get;set;}
    public integer size{get;set;}
    public Apexpages.StandardSetController setcon{
        get{
          if(setcon==null){
              size=25;
     setcon=new apexpages.StandardSetController(Database.getQueryLocator([select id,name,phone from Account]));
              setcon.setPageSize(size);
              noofrecords=setcon.getResultSize();
            System.debug(setcon);                                                                      
          }
        return setcon; 
      }
      set;    
       
    }
    
    public list<Account> getAccount(){
       list<account> accs= new list<account>();
        for(Account a :(list<Account>)setcon.getRecords())
        accs.add(a);
        return accs;
    }
    
    public pageReference refresh(){
        setcon=null;
        getAccount();
        setcon.setPageNumber(1);
        return null;
    }

}